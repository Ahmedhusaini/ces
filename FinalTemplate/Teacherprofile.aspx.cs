using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class Teacherprofile : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
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
                    name.Text=CurrentUser.Username;
                    usertype.Text=CurrentUser.UserType;
                    Gender.Text=CurrentUser.Gender;
                    Nationality.Text=CurrentUser.Nationality;
                    Religion.Text=CurrentUser.Religion;
                    Phone.Text=CurrentUser.Phone;
                    Address.Text=CurrentUser.Address;
                    Email.Text=CurrentUser.PrimaryEmailAddress;
                    Email2.Text = CurrentUser.SecondaryEmailAddress;
                    

                }

                else
                {
                    Response.Redirect("~/Default.aspx");
                }

        }
    }
}
