using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class TeacherPanel : System.Web.UI.Page
    {

        private Database myDatabase = new Database("abc");
        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "DATE :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "TIME :" + System.DateTime.Now.ToLongTimeString();

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
                    if (Label1 != null)
                    {
                        Label1.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

        }
    }
}
