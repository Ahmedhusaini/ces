using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;

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
            sendtodb();
        }
        public void sendtodb()
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
                        Label1.Visible =true;
                        sendmail();
                        message();
                        con.Close();
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

        public void message()
        {

            StringBuilder builder = new StringBuilder();
            builder.Append("Thanks for Upadte Your Password </br>");
            builder.Append(changepassword.Text);
            builder.Append(newpassword.Text);

        }

        public void sendmail()
        {
            MailMessage mmsg = new MailMessage();
            SmtpClient client = new SmtpClient();
            client.Host = "smtp.gmail.com";
            client.Port = 587;

            string useractivation = "http://shahwaizhasan106/StudentUpdateProfile.aspx?email=" + username.Text;

            mmsg.From = new MailAddress("shahwaizhasan106@gmail.com");
            mmsg.To.Add(email.Text);
            mmsg.Subject = "Activation";
            mmsg.Body = "HELLOW  " + username.Text + "</br> This is check your password</br>";
            mmsg.IsBodyHtml = true;
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = new NetworkCredential("shahwaizhasan106@gmail.com", "uombhdylobfcwnjp");
            client.Send(mmsg);
        }
    }
}