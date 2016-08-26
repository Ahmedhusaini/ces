using FinalTemplate.source;
using FinalTemplate.source.Functions;
using System;
using System.Text;


namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Jfunctionstudents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
                Jfunctionstudents.BindDropDownList(DropDownList3, "class", "class_id", "select * from tbl_class");
                Jfunctionstudents.BindDropDownList(DropDownList4, "section", "Section_id", "select * from tbl_section");
                Jfunctionstudents.BindDropDownList(DropDownList5, "school_name", "school_id", "select * from tbl_school");
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
            stringBuilder.Append(user.Text);
            stringBuilder.Append(" <br> ");
            stringBuilder.Append("Password:");
            stringBuilder.Append(pass.Text);
            return stringBuilder.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClassStudentRegistration classStudent = new ClassStudentRegistration();
            string result = string.Empty;
            try
            {
                result = classStudent.studentregister(name.Text, lname.Text, contact1.Text, guardian.Text, gurcontact.Text, radiobut.SelectedValue,
                                            dob.Text,nation.Text, religion.Text, Convert.ToInt32(DropDownList2.SelectedValue),1, address.Text,
                                            Convert.ToInt32(postal.Text), prevchool.Text, preclass.Text, FileUpload1.FileName, DropDownList5.SelectedValue,
                                            Convert.ToInt32(DropDownList3.SelectedValue), Convert.ToInt32(DropDownList4.SelectedValue), 
                                            user.Text, Convert.ToInt32(accountp.Text),pass.Text,pemail.Text,semail.Text);

                if (result == "true")
                {
                    JFunctions.SendEmail(pemail.Text, "CES - Registration", EmailBody());
                    Response.Write("Register Successfully Complete");
                }
                else
                {
                    Response.Write("not register");
                }
            }
            catch (Exception exception)
            {
                result = exception.ToString();
                Response.Write(result);
            }

        }
    }
}