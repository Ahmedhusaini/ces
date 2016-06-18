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
                JFunctions.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
		    }
		}

        protected void country_TextChanged(object sender, EventArgs e)
        {
            country.ReadOnly = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CParentRegistration classparent = new CParentRegistration();
            string result = string.Empty;

            try
            {
                result = classparent.ParentRegister(1, Convert.ToInt32(DropDownList2.SelectedValue),
                    Convert.ToInt32(postal.Text), user.Text, pass.Text, Convert.ToInt32(accountp.Text),
                    pemail.Text, semail.Text, name.Text, lname.Text, fileupload.FileName);
                if (result=="true")
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