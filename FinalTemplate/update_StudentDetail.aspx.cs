using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace FinalTemplate
{
    public partial class update_StudentDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ab = Session["userid"].ToString();
            //try
            int g = Convert.ToInt32(source.Functions.CurrentUser.GeneralID.ToString());
            //{
            string update = ConfigurationManager.ConnectionStrings["cesConnectionString2"].ConnectionString;
            SqlConnection connection = new SqlConnection(update);
            SqlDataAdapter adp = new SqlDataAdapter("select authorized_id from tbl_authorized_users where authorized_id='" + stdid.Text + "'", connection);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count.ToString() == "1")
            {
                if (stdid.Text == ab)
                {
                    connection.Open();
                    SqlCommand command = connection.CreateCommand();
                    //command.CommandText =("update tbl_general set firstname='" + name.Text + "', lastname='" + lastname.Text + "' , phone='" + contact.Text + "',Nationality='" + nationality.Text + "', religion='" + religion.Text + "',address='" + address.Text + "' where General_id='g'");
                    //// , dob_id='" + dateofbirth.Text + "' not adding value
                    //command.ExecuteNonQuery();
                    //command.CommandText =("update tbl_location set postal_code='" + postalcode.Text + "'");
                    //command.ExecuteNonQuery();
                    command.CommandText = ("update tbl_general set firstname='" + name.Text + "' where General_id='g'");
                    command.ExecuteNonQuery();
                    //command.CommandText = ("update tbl_authorized_users set username='" + username.Text + "' where authorized_id='"+stdid.Text+"'");
                    //command.ExecuteNonQuery();
                    Label1.Visible = true;
                    connection.Close();
                    Label1.Text = "Successfully Update";
                    Label1.ForeColor = System.Drawing.Color.DarkRed;
                }
            }
            //}
            //catch (Exception ex)
            //{
            //    Label1.Text = ex.Message;
            //}
        }
    }
}