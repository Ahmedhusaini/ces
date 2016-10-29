using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Validation;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class ContactUs_Student : System.Web.UI.Page
    {
        private Database mydatabase = new Database("cesConnectionString2");
        public student std = new student();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"]!=null)
            {
                student.SchoolDetails(Session["userid"].ToString());
                contact1.Text = student.s_primarycontact;
                contact2.Text = student.s_secondarycontact;
                lab2.Text =  student.s_schoolname;
                name.Text = CurrentUser.Username;
            }            
        }

        protected void messege(object sender, EventArgs e)
        {

        }        
    }
}