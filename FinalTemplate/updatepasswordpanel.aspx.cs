using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FinalTemplate
{
    public partial class updatepasswordpanel1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Visible = false;
            Session.Remove("userid");
            bool sessiongone = (Session["userid"] == null);
            //if (sessiongone)
            //{
            //    Response.Redirect("~/Default.aspx");
            //}
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string confstu = ConfigurationManager.ConnectionStrings["cesConnectionString2"].ConnectionString;
                SqlConnection con = new SqlConnection(confstu);
                SqlDataAdapter sda = new SqlDataAdapter("select username,password from tbl_authorized_users where username='" + username.Text + "' and password='" + changepassword.Text + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count.ToString() == "1")
                {
                    if (newpassword.Text == conformpassword.Text)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("update tbl_authorized_users set password='" + newpassword.Text + "' where password='" + changepassword.Text + "' and username='" + username.Text + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Label1.Visible =true;
                        Label1.Text = "Successfully";
                        Label1.ForeColor = System.Drawing.Color.DarkRed;
                    }
                }
                else
                {
                    Label1.Text = "Please correct the both Password";
                }
            }
            else
            {
                Label1.Text = "UnSuccessfull";
            }
        }
    }
}