using FinalTemplate.source.Registration;
using System;
using FinalTemplate.source;
using FinalTemplate.source.Functions;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Jfunctionstudents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ClassStudentRegistration classStudent = new ClassStudentRegistration();
            string result = string.Empty;
            try
            {
                result = classStudent.studentregister(name.Text,lname.Text,contact1.Text,guardian.Text,contact2.Text,radiobut.SelectedValue,
                                            nation.Text, religion.Text,1, Convert.ToInt32(DropDownList2.SelectedValue), address.Text,
                                            Convert.ToInt32(postal.Text),prevchool.Text,preclass.Text,FileUpload1.FileName,sname.Text,
                                            Convert.ToInt32(classx.Text),Convert.ToInt32(sec.Text),user.Text,Convert.ToInt32(accountp.Text),
                                            pass.Text,pemail.Text,semail.Text);

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