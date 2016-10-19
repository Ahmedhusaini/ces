using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class AllEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlEventType, "event_type", "event_type_id", "select * from tbl_event_type");

            }
        }


    }
}