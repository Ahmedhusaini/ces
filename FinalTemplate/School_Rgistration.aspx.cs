using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;
using System.Text;

namespace FinalTemplate
{
    public partial class School_Rgistration : System.Web.UI.Page
    {
        public string SelectedPackageName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddl_city, "city", "city_id", "select * from tbl_city");
                JFunctions.BindDropDownList(ddl_schooltype, "school_type", "school_type_id", "select * from tbl_school_type");
            }

        }

        private string EmailBody()
        {
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.Clear();
            stringBuilder.Append("<h1>Welcome to Centeralized Education System - CES</h1>");

            stringBuilder.Append("<p>Pakistan's only education portal which aims to gather education on single online platform for betterment of education.</p>");

            stringBuilder.Append("<h1>Your Account Details</h1>");

            stringBuilder.Append("<h2>Login Details</h2>");
            stringBuilder.Append("<br>");
            stringBuilder.Append("Username:");
            stringBuilder.Append(txt_username.Text);
            stringBuilder.Append(" <br> ");
            stringBuilder.Append("Password:");
            stringBuilder.Append(txt_password.Text);
            stringBuilder.Append(" <br> ");
            stringBuilder.Append("<h2>Package Details</h2>");
            stringBuilder.Append("Package Name: ");
            stringBuilder.Append(hiddenFieild.Value.ToString());
            stringBuilder.Append(" <br> ");
            stringBuilder.Append("<a href='https://" + "drive.google.com/open?id=0B1sWtpM3NwoqSFpCU1h1LXpWVlk'>Click here</a> to view all details about your selected package.");

            return stringBuilder.ToString();
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            ClassSchoolRegistration classSchool = new ClassSchoolRegistration();
            string result = string.Empty;

            try
            {
                string selectedpackage = this.hiddenFieild.Value.ToString();
                if (selectedpackage == "Gold" || selectedpackage == "Silver" || selectedpackage == "Platinum")
                {
                    if (JFunctions.UploadSingleFile(fileupload, "images/registeredSchools/" + fileupload.FileName) == "true")
                    {
                        result = classSchool.RegisterSchool(1, Convert.ToInt32(ddl_city.SelectedValue),
                             Convert.ToInt32(txt_postalcode.Text), txt_username.Text, txt_password.Text,
                             Convert.ToInt32(txt_accountPin.Text),
                             txt_primaryEmailAddress.Text, txt_secondaryEmailAddress.Text, txt_contact_primary.Text, txt_contact_secondary.Text, txt_schoolName.Text,
                             txt_ownername.Text,
                             txt_foundedIn.Text, fileupload.FileName, Convert.ToInt32(ddl_schooltype.SelectedValue),
                             txt_campusname.Text);
                        if (result == "true")
                        {
                            Package objPackage = new Package();
                            objPackage.InitializePackageAttributes(selectedpackage, classSchool.myDatabase.GetLastValueByColumnName("school_id", "tbl_school"));
                            if (objPackage.AssignPackage() == "true")
                            {
                                JFunctions.SendEmail(txt_primaryEmailAddress.Text, "CES - Registration", EmailBody());
                                Response.Write("<script>alert('An email has been sent to your primary email address which contain basic information about your account. You will be redirected to home page.');</script>");
                                Response.Redirect("Default.aspx");
                            }
                            else
                                Response.Write("Regisration completed successfully, but package assingment is not completed due to an error.");

                        }
                        else
                            Response.Write("not register");
                    }
                    else
                        Response.Redirect("image was not uploaded to server. Hence the registration process is cancelled. Please try again");
                }
                else
                    Response.Write("<script>alert('You have to select atleast one package.');</script>");
            }
            catch (Exception exception)
            {
                result = exception.ToString();
                Response.Write(result);
            }


        }
    }
}