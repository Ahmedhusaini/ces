using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class parent_view_child : System.Web.UI.Page
    {
        private Database myDatabase = new Database("cesConnectionString3");

        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "Date :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "Time :" + System.DateTime.Now.ToShortTimeString();

            if (Session["userid"] != null)
            {

                string[] col = {"General_Id"};
                string[] colwhere = {"authorized_id"};
                string[] whereoperator = {"="};
                string[] multiwhere = {""};

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                //Parents.GetChildDetails(Session["userid"].ToString());


                string[] whereoperatorvale = {"'" + CurrentUser.AuthorizedID + "'"};

                string[,] parentid = myDatabase.SelectQuery("tbl_Parents", col, colwhere, whereoperator,
                    whereoperatorvale, multiwhere);

                CurrentUser.GetPersonalDetails(Convert.ToInt32(parentid[0, 0]));

                Label lbl = (Label) this.Master.FindControl("fname");
                if (lbl != null)
                {
                    lbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                }


                

            }
            
            Parents.GetChildDetails(Parents.parentschild);

            id.Text = Parents.std_id;
            Parents.child_detail(id.Text);
            lblfl.Text = Parents.Firstname + " " + Parents.Lastname;
            lblclass.Text = Parents.sclass;
            lblsec.Text = Parents.sectionn;
            lblgen.Text = Parents.Gender;
            lblph.Text = Parents.Phone;
            lblsname.Text = Parents.Schoolname;
            lblcontact.Text = Parents.contactprimary;



        }
    }
}