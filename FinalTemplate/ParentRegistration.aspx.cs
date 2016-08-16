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
                 Jfunctionparents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
               
            }
        }

        protected void country_TextChanged(object sender, EventArgs e)
        {
            
        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {
            CParents classparent = new CParents();
            string result = string.Empty;

            try
            {
                result = classparent.Registerparents(1, Convert.ToInt32(DropDownList2.SelectedValue),
                    Convert.ToInt32(postal.Text),Convert.ToInt32(accountp.Text), user.Text, pass.Text,
                    pemail.Text, semail.Text, name.Text, lname.Text, fileupload.FileName, Convert.ToInt32(nic.Text), post.Text, salary.Text, Convert.ToInt32(contact1.Text.ToString())
                    , officeadd.Text, Convert.ToInt32(contact2.Text.ToString()), radiobut.SelectedValue, dob.Text, nation.Text, religion.Text, address.Text);
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