using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class Admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null)
                {
                    try
                    {
                        lbl_schoolid.Text = "Your User ID: " + Session["userid"].ToString();
                        CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                }
                else
                    Response.Redirect("~/Default.aspx");
            }
        }
        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Remove("userid");
            bool sessiongone = (Session["userid"] == null);
            if (sessiongone)
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}