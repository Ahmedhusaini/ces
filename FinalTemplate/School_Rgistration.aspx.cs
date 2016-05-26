using FinalTemplate.source.Database;
using System;
using System.Web.UI;
namespace FinalTemplate
{
    public partial class School_Rgistration : System.Web.UI.Page
    {
        private Database _database = new Database("thisisconnectionstring");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_goto_ViewSchoolDetails_Click(object sender, EventArgs e)
        {

        }

        protected void btn_goto_RegistrationDetails_Click(object sender, EventArgs e)
        {

        }

        protected void btn_gobackto_viewpackages_Click(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            Response.Write("It worked");
        }

        protected void imgbtn_calender_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Calendar_foundedIn_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}