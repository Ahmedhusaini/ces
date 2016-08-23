using System;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI.WebControls;

namespace FinalTemplate.source.Functions
{
    public class JFunctions
    {
        public static string GetSystemDate()
        {
            return Convert.ToString(System.DateTime.Today.ToString("d"));
        }

        public static string GetSystemTime()
        {
            return Convert.ToString(System.DateTime.Today.ToString("HH:MM:ss"));
        }
        public static void SendEmail(string To, string Subject, string MessageBody)
        {
            string smtpUsername = "jahangeer.ahmed11@gmail.com";
            using (MailMessage mailMessage = new MailMessage("jahangeer.ahmed11@gmail.com", To, Subject, MessageBody))
            {
                mailMessage.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential networkCredential = new NetworkCredential(smtpUsername, "dovocgsfopxjqjko");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = networkCredential;
                smtp.Port = 587;
                smtp.Send(mailMessage);

            }
        }
        //File size limit in bytes
        public static string UploadSingleFile(FileUpload objFileUpload, string filePath)
        {
            string fullPath = "~/" + filePath;
            string savedPath = string.Empty, returnvalue = string.Empty;
            returnvalue = "null";
            if (objFileUpload.HasFile)
            {
                int currentFileSize = objFileUpload.PostedFile.ContentLength;
                savedPath = fullPath + objFileUpload.FileName;
                try
                {
                    objFileUpload.SaveAs(HttpContext.Current.Server.MapPath(savedPath));
                    returnvalue = "true";
                }
                catch (Exception exception)
                {
                    returnvalue = exception.ToString();
                }


            }
            return returnvalue;

        }
        public static void BindDropDownList(DropDownList ddl, string displayField, string valueField, string query)
        {
            Database.Database myDatabase = new Database.Database("cesConnectionString");
            myDatabase.CreateConnection();
            myDatabase.InitializeSQLCommandObject(myDatabase.GetCurrentConnection, query);
            try
            {
                myDatabase.OpenConnection();
                ddl.DataSource = myDatabase.obj_sqlcommand.ExecuteReader();
                ddl.DataTextField = displayField;
                ddl.DataValueField = valueField;
                ddl.DataBind();
            }
            finally
            {
                myDatabase.CloseConnection();
                myDatabase.obj_sqlcommand.Dispose();
            }
        }

    }
}