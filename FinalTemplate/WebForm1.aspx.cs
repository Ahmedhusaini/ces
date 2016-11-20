using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text= CurrentUser.AuthorizedID;
            //Label2.Text = student.studentid;

            Label1.Text = student.s_class;
            Label2.Text = student.s_section;
            Label3.Text = student.s_schoolid;
        }
    }
}