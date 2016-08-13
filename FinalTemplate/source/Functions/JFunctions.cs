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
            return Convert.ToString(System.DateTime.Today.ToString("t"));
        }
        public static void SendEmail(string To, string Subject, string MessageBody)
        {
            string smtpUsername = "jahangeer.ahmed11@gmail.com";
            //i changed my original password to this to check the email, later i will change this back to my original password.
            //if you want to send email from your own email id change the id and password to yours and email will be sent through
            //your email address.
            string smtpPassword = "159abbasi789";
            int smtpPort = 587;
            try
            {
                var client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                    EnableSsl = true
                };
                client.Send(smtpUsername, To, "medo subject", "demo body");
            }
            catch (Exception ex)
            {

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