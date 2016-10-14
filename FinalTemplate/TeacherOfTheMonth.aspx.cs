using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;
using FinalTemplate.source.Validation;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class TeacherOfTheMonth : System.Web.UI.Page
    {
        private Database mydb = new Database("cesConnectionString");
        public string schoolID;
        //private bool IsFirstRequest = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            ClassSchoolRegistration schoolRegistration = new ClassSchoolRegistration();
            schoolID = schoolRegistration.GetSchoolIDByAuthorizedID(CurrentUser.AuthorizedID);


        }
        private bool IsAllReadyThere()
        { 
            string[] col={"school_id"};
            string returnedValue = mydb.SelectQuery("tbl_teacher_of_the_month", col).ToString();
            if (returnedValue == "null")
                return false;
            else
                return true;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int rowsAffected = 0;
            if (IsAllReadyThere())
            {
                string[] teacherid_unsecure={txt_teacherid.Text};
                bool teacherid_secure= Jvalidate.FilterBlackLIstKeywords(teacherid_unsecure);

                if (teacherid_secure)
                {                 
                    string query = "update tbl_teacher_of_the_month set teacher_id="+ Convert.ToInt32(Jvalidate.RemoveHtmlTags(txt_teacherid.Text))+" where school_id='"+schoolID+"';";
                    mydb.CreateConnection();
                    mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, query);
                    try
                    {
                        mydb.OpenConnection();
                        rowsAffected= mydb.obj_sqlcommand.ExecuteNonQuery();
                        if (rowsAffected > 0)
                            Response.Write("<script>alert('Successfully updated teacher of the month information');</script>");
                        else
                            Response.Write("<script>alert('0 Records affected');</script>");
                    }
                    catch{}
                    finally
                    {
                        mydb.CloseConnection();
                        mydb.obj_sqlcommand.Dispose();
                    }
                }
                else
                    Response.Write("<script>alert('Unsecure teacher id');</script>");   
            }
            else
            {
                string[] cols = { "school_id", "teacher_id" };
                object[] vals = { schoolID, Convert.ToInt32(txt_teacherid.Text) };            
                rowsAffected = mydb.InsertQuery("tbl_teacher_of_the_month", cols, vals);
                if (rowsAffected > 0)
                    Response.Write("<script>alert('Successfully updated teacher of the month information');</script>");
                else
                    Response.Write("<script>alert('0 Records affected');</script>");
            }
        }
    }
}