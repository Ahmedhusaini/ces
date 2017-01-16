using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class PostJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            JFunctions.BindDropDownList(ddlJobCategory, "job_category", "jcat_id", "select * from tbl_job_category;");
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            SchoolRelatedFunction objSchoolRelatedFunction = new SchoolRelatedFunction();
            if (
                objSchoolRelatedFunction.PostJob(txtTitle.Text, txtDescription.Text,
                    int.Parse(ddlJobCategory.SelectedValue)) > 0)
            {
                Response.Write("<script>alert('Job successfully posted.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error uccured while posting job.');</script>");
            }
        }
    }
}