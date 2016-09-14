using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Runtime.CompilerServices;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class parentpanel1 : System.Web.UI.Page
    {
        private Database myDatabase = new Database("cesConnectionString3");
        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "Date :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "Time :" + System.DateTime.Now.ToShortTimeString();

            
            if (Session["userid"] != null)
            {

                string[] col = { "General_Id" };
                string[] colwhere = {"authorized_id"};
                string[] whereoperator = {"="};
                string[] multiwhere = {""};
                
                
                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };
               
                string[,] parentid = myDatabase.SelectQuery("tbl_Parents",col,colwhere,whereoperator,whereoperatorvale,multiwhere );
                CurrentUser.GetPersonalDetails(Convert.ToInt32(parentid[0, 0]));
               
              
                Label lbl = (Label) this.Master.FindControl("fname");
                if (lbl!=null)
                {
                    lbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                }

                headlbl.Text = CurrentUser.FirstName;
                headll.Text = CurrentUser.LastName;
                gender.Text = CurrentUser.Gender;
                phone.Text = CurrentUser.Phone;
                address.Text = CurrentUser.Address;
                pemail.Text = CurrentUser.PrimaryEmailAddress;
                atype.Text= CurrentUser.AuthorizedID;
                Image1.ImageUrl=CurrentUser.Photo;


                string[] col2 = { "General_Id" };
                string[] colwhere1 = { "Std_id" };
                Parents.GetChildDetails(Session["userid"].ToString());

                //string[] whereoperatorvalue1 = { "'" + Parents.std_id + "'" };

                //string[,] stdid = myDatabase.SelectQuery("tbl_Student_Reg", col2, colwhere1, whereoperator, whereoperatorvalue1, multiwhere);
                //CurrentUser.GetPersonalDetails(Convert.ToInt32(stdid[0, 0]));
                //Parents.GetPersonalDetails(Convert.ToInt32(stdid[0, 0]));


                name.Text = Parents.FirstName;
                stdid.Text = Parents.std_id;






            }

            else
            {
                Response.Redirect("~/Default.aspx");
            }
           
            }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        }

    
       

     

        
    }
