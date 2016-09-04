using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class parentpanel1 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "Date: " + System.DateTime.Now.ToShortDateString();
            lab2.Text = "Time: "+System.DateTime.Now.ToShortTimeString();
              
            if (!IsPostBack)
            {

                if (Session["userid"] != null)
                {
                    username.Text = "Your User ID: " + Session["userid"].ToString();
                    CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());

                    

                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }

        }

    
        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

      protected void Button2_Click(object sender, EventArgs e)
      {
          
        }

     

        
    }
}