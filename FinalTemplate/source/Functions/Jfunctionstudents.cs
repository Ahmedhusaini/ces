using System;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using FinalTemplate.source.Registration;

namespace FinalTemplate.source.Functions
{
    public class Jfunctionstudents
    {
        //Returns Date in dd/mm/yyyy format
        public static string GetSystemDate()
        {
            return Convert.ToString(DateTime.Today.ToString("d"));
        }

        public static string GetSystemTime()
        {
            return Convert.ToString(System.DateTime.Today.ToString("t"));
        }

        public static void SendEmail(string To, string Subject, string MessageBody)
        {
            string smtpUsername = "shahwaizhasan106@gmail.com";
            using (MailMessage mailMessage = new MailMessage("shahwaizhasan106@gmail.com", To, Subject, MessageBody))
            {
                mailMessage.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential networkCredential = new NetworkCredential(smtpUsername, "uombhdylobfcwnjp");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = networkCredential;
                smtp.Port = 587;
                smtp.Send(mailMessage);

            }
        }
        public static void BindDropDownList(DropDownList ddl1, string displayField1, string valueField1, string queryy)
        {
            Database.Database studentDatabase = new Database.Database("ces");
            studentDatabase.CreateConnection();
            studentDatabase.InitializeSQLCommandObject(studentDatabase.GetCurrentConnection, queryy);
            try
            {
                studentDatabase.OpenConnection();
                ddl1.DataSource = studentDatabase.obj_sqlcommand.ExecuteReader();
                ddl1.DataTextField = displayField1;
                ddl1.DataValueField = valueField1;
                ddl1.DataBind();
            }
            finally
            {
                studentDatabase.CloseConnection();
                studentDatabase.obj_sqlcommand.Dispose();
            }
        }
    }
}