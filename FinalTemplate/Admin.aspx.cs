using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Web;

namespace FinalTemplate
{
    public partial class Admin1 : System.Web.UI.Page
    {
        private SchoolRelatedFunction objSchoolRelatedFunction = new SchoolRelatedFunction();
        private Database mydb = new Database("ces");
        private string loginDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    try
                    {
                        lblUserID.Text = "Your User ID: " + Session["userid"].ToString();

                        CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                        lbllogoutDate.Text = GetLastLoginDate();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                }
                else
                    Response.Redirect("~/Default.aspx");
            }
        }
        public bool UpdateLastLoginDate()
        {
            Database database = new Database("ces");
            string lastLoginDate = string.Empty;
            database.CreateConnection();
            database.InitializeSQLCommandObject(database.GetCurrentConnection, "spLastLoginDate", true);
            database.obj_sqlcommand.Parameters.AddWithValue("@date", SqlDbType.Date).Value = JFunctions.GetSystemDate();
            database.obj_sqlcommand.Parameters.AddWithValue("@authorizedid", SqlDbType.VarChar).Value = CurrentUser.AuthorizedID;
            try
            {
                database.OpenConnection();
                if (database.obj_sqlcommand.ExecuteNonQuery() <= 0)
                {
                    return false;
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                database.CloseConnection();
            }
            return true;
        }
        public string GetLastLoginDate()
        {
            string returnstring = string.Empty;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spGetLastLogoutDate", true);
            mydb.obj_sqlcommand.Parameters.AddWithValue("@authorized_id", CurrentUser.AuthorizedID);
            try
            {

                mydb.OpenConnection();
                mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                if (mydb.obj_reader.HasRows)
                {
                    while (mydb.obj_reader.Read())
                    {
                        returnstring = mydb.obj_reader["last_login_date"].ToString();
                    }
                }
            }
            catch (Exception exception)
            {
                HttpContext.Current.Response.Write(exception.ToString());
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_reader.Close();
                mydb.obj_reader.Dispose();
            }
            return returnstring;
        }
        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Remove("userid");
            bool sessiongone = (Session["userid"] == null);
            if (sessiongone)
            {
                if (!UpdateLastLoginDate())
                    Response.Write("<script>alert('Logout date do not updated in database due to some error.');</script>");
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}