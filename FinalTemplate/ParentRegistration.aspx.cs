using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;
using System.Web.UI;

namespace FinalTemplate
{
    public partial class Parent_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 Jfunctionstudents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
               
            }
        }

        protected void country_TextChanged(object sender, EventArgs e)
        {
            
        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {
            CParentsregistraion classparent = new CParentsregistraion();
            string result = string.Empty;

            try
            {
                result = classparent.Registerparents(name.Text, lname.Text, nation.Text, radiobut.SelectedValue, fileupload.FileName, religion.Text, contact1.Text, address.Text, officeadd.Text,
                    contact2.Text,nic.Text,post.Text,salary.Text,1,Convert.ToInt32(DropDownList2.SelectedValue),Convert.ToInt32(postal.Text),user.Text,pass.Text,
                    Convert.ToInt32(accountp.Text),pemail.Text,semail.Text);
                if (result == "true")
                {
                    Response.Write("register");
                }
                else
                {
                    Response.Write("not register");
                }

            }
            catch (Exception ex)
            {

                result = ex.ToString();
                Response.Write(result);
            }

        }
    }
}