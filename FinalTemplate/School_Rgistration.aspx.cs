using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class School_Rgistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            country.Enabled = false;
            if (!IsPostBack)
            {
                MultiviewRegisterSchool.ActiveViewIndex = 0;
            }
        }

        protected void btn_goto_ViewSchoolDetails_Click(object sender, EventArgs e)
        {
            MultiviewRegisterSchool.ActiveViewIndex = 1;
        }

        protected void btn_goto_RegistrationDetails_Click(object sender, EventArgs e)
        {
            MultiviewRegisterSchool.ActiveViewIndex = 2;
        }

        protected void btn_gobackto_viewpackages_Click(object sender, EventArgs e)
        {
            MultiviewRegisterSchool.ActiveViewIndex = 0;
        }

        protected void btn_goto_summary_Click(object sender, EventArgs e)
        {
            MultiviewRegisterSchool.ActiveViewIndex = 2;
        }
    }
}