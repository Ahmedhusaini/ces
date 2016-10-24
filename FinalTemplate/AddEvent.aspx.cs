using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class AddEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlEventType, "event_type", "event_type_id", "select * from tbl_event_type;");
            }
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            JSchool objSchool = new JSchool();
            SchoolRelatedFunction objSchoolRelatedFunction = new SchoolRelatedFunction();
            int result = objSchoolRelatedFunction.AddEvents(txtEventTitle.Text, txtEventDescription.Text, txtEventPlace.Text,
                Convert.ToInt32(ddlEventType.SelectedValue), txtStartTime.Text, txtEndTime.Text, txtStartDate.Text,
                txtEndDate.Text, JSchool.SchoolID, fuPicture.FileName, txtTags.Text);
            if (result > 0)
            {
                Response.Write("<script>alert('Event added successfully.');</script>");
            }
        }
    }
}