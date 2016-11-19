using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class Check_News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                student.forevent(Session["userid"].ToString());
                new_name.Text = "News Title : " + student.title;
                start_d.Text = "";
                end_d.Text = "";
                start_t.Text = student.starting_time;
                end_t.Text = student.ending_time;
                plac.Text = student.place;
                desc.Text = student.discription;
                tag.Text = student.tags;

            }
        }
    }
}