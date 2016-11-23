using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class parentpanel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Remove("userid");
            Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
        }
    }
}