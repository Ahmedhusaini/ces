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
using System.Net.Mail;
using System.Net;

namespace FinalTemplate
{
    public partial class StudentUpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_error.Visible = false;
            Session.Remove("userid");
            bool sessiongone = (Session["userid"] == null);
            //if (sessiongone)
            //{
            //    Response.Redirect("~/Default.aspx");
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sendtodb();
        }
        public void sendtodb()
        {
            string confstu = ConfigurationManager.ConnectionStrings["cesConnectionString2"].ConnectionString;
            SqlConnection con = new SqlConnection(confstu);
            SqlDataAdapter sda = new SqlDataAdapter("select username,password from tbl_authorized_users where username='" + txt_username1.Text + "' and password='" + change_password.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count.ToString() == "1")
            {
                if (txt_password.Text == conform_password.Text)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update tbl_authorized_users set password='" + txt_password.Text + "' where password='" + change_password.Text + "' and username='" + txt_username1.Text + "'", con);
                    cmd.ExecuteNonQuery();
                  //  sendmail();
                    Label1.Text = "Successfully";
                    Label1.ForeColor = System.Drawing.Color.DarkRed;
                    con.Close(); 
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
        }

        //public void sendmail()
        //{
        //    MailMessage mmsg = new MailMessage();
        //    string useractivation = "http://shahwaizhasan106/StudentUpdateProfile.aspx?email=" + TextBox1.Text;

        //    mmsg.From = new MailAddress("shahwaizhasan106@gmail.com");
        //    mmsg.To.Add(TextBox1.Text);
        //    mmsg.Subject = "Activation";
        //    mmsg.IsBodyHtml = true;
        //    SmtpClient client = new SmtpClient();
        //    client.Host = "smpt.gmail.com";
        //    mmsg.Body = "hi" + txt_username1.Text + "</br>this is</br><a href='" + useractivation+"'> click here</a>";
        //    client.EnableSsl = true;

        //    NetworkCredential networkCredential = new NetworkCredential("shahwaizhasan106@gmail.com", "teuss106");
        //    client.UseDefaultCredentials = true;
        //    client.Credentials = networkCredential;
        //    client.Port = 587;
        //    client.Send(mmsg);
        //}
    }
}