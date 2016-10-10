using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class StudentOfTheMonth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMakeStudentOfTheMonth_Click(object sender, EventArgs e)
        {
            JStudent student = new JStudent();
            if (student.StudentOfTheMonth(txtstudentofthemonth.Text) == true)
                Response.Write("<script>alert('Record successfully updated.')</script>");
            else
                Response.Write("<script>alert('Error occur during updating information.')</script>");
        }


    }
}