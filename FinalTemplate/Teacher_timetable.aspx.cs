using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class Teacher_timetable : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                string[] col = { "General_Id" };
                string[] colwhere = { "authorized_id" };
                string[] whereoperator = { "=" };
                string[] multiwhere = { "" };

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };
                string[,] teacherid = myDatabase.SelectQuery("tbl_teacher", col, colwhere, whereoperator, whereoperatorvale, multiwhere);
                CurrentUser.GetPersonalDetails(Convert.ToInt32(teacherid[0, 0]));

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
}