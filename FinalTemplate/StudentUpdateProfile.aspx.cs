using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using FinalTemplate.source.Functions;
using System.Drawing;
using System.Configuration;

namespace FinalTemplate
{
    public partial class StudentUpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           lbl_error.Visible =false;
           Session.Remove("userid");
           bool sessiongone = (Session["userid"] == null);
           //if (sessiongone)
           //{
           //    Response.Redirect("~/Default.aspx");
           //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                SqlConnection con = new SqlConnection(@"Data Source=SHAHWAIZHASAN;Initial Catalog=ces;Integrated Security=True");
                SqlDataAdapter sda = new SqlDataAdapter("select username,password from tbl_authorized_users where username='" + txt_username1.Text + "' and password='" + change_password.Text + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count.ToString() == "1")
                {
                    if (txt_password.Text == conform_password.Text)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("update tbl_authorized_users set password='" + txt_password.Text + "' where password='" + change_password.Text + "' and username='"+txt_username1.Text+"'",con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "Successfully";
                        Label1.ForeColor = System.Drawing.Color.DarkRed;
                    }
                    else
                    {
                        Label1.Text = "Please correct the both Password";
                    }
                }
                else
                {
                    Label1.Text = "check your password";
                }
                //try 
                //{
                //    if (txt_username1.Text == "" || txt_username1.Text == string.Empty)
                //    {
                //        lbl_error.Visible = true;
                //        lbl_error.Text = "username fields can not be null or empty.";
                //        lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                //    }
                //    else if (change_password.Text == "" || change_password.Text == string.Empty || txt_password.Text == "" || txt_password.Text == string.Empty || conform_password.Text == "" || conform_password.Text == string.Empty)
                //    {
                //        lbl_error.Visible = true;
                //        lbl_error.Text = "username fields can not be null or empty.";
                //        lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                //    }

                //}
                //catch (Exception exp)
                //{
                //    Response.Write(exp.Message); 
                //}
        }
    }
}