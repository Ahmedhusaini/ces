using FinalTemplate.source.Registration;
using System;
using FinalTemplate.source;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               Jfunctionstudents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
               Jfunctionstudents.BindDropDownList(Dropd, "school_type", "school_type_id", "select * from tbl_school_type");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ClassStudentRegistration classStudent = new ClassStudentRegistration();
            string result = string.Empty;
            //Convert.ToInt32(Dropd.SelectedValue) changes//
            try
            {
                result = classStudent.studentregister(name.Text,lname.Text,(contact1.Text),
                    (guardian.Text), (contact2.Text), radiobut.SelectedValue, (nation.Text),
                    (religion.Text), Convert.ToInt32(DropDownList2.SelectedValue),1,
                    (address.Text), Convert.ToInt32(postal), (prevchool.Text), (preclass.Text),
                    FileUpload1.FileName, (sname.Text), Convert.ToInt32(classtxt.Text),
                    Convert.ToInt32(section.Text),(user.Text), Convert.ToInt32(accountp),(pass.Text),
                     (pemail.Text),(semail.Text));

                if (result == "true")
                {
                    Response.Write("register");
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