using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class UpdateAndViewEventDetails : System.Web.UI.Page
    {
        JEvents objJEvents = new JEvents();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlEventType, "event_type", "event_type_id", "select * from tbl_event_type");
            }
            if (!string.IsNullOrWhiteSpace(Request.QueryString["EIC"]))
                txteventid.Text = Request.QueryString["EIC"];

        }

        private void ShowDetails()
        {
            txteventtitle.Text = objJEvents.Title;
            txtdescription.Text = objJEvents.Description;
            txtplace.Text = objJEvents.Place;
            ddlEventType.ClearSelection();
            ddlEventType.Items.FindByValue(objJEvents.EventTypeID.ToString()).Selected = true;
            txtstarttime.Text = objJEvents.StartTime;
            txtendtime.Text = objJEvents.EndTime;
            txtstartdate.Text = objJEvents.StartDate;
            txtenddate.Text = objJEvents.EndDate;
            txttags.Text = objJEvents.Tags;
        }

        protected void btnupdateeventdetails_Click(object sender, EventArgs e)
        {
            if (objJEvents.UpdateEvent(txteventid.Text, txteventtitle.Text, txtdescription.Text, txtplace.Text, Convert.ToInt32(ddlEventType.SelectedValue), txtstarttime.Text, txtendtime.Text, txtstartdate.Text, txtenddate.Text, txttags.Text) == "true")
            {
                Response.Write("<script>alert('Record updated');</script>");
            }
            else
            {
                Response.Write("<script>alert('Not updated due to an error.');</script>");
            }

        }

        protected void btngeteventdetails_Click(object sender, EventArgs e)
        {
            if (objJEvents.GetEventDetails(Convert.ToInt32(txteventid.Text)))
            {
                ShowDetails();
            }
            else
            {
                Response.Write("<script>alert('No data found');</script>");
            }
        }
    }
}