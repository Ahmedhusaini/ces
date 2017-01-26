using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
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
        private string EmailBody()
        {
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.Clear();
            stringBuilder.Append("<h1>Welcome to Centeralized Education System - CES</h1>");
            stringBuilder.Append("<p>Pakistan's only education portal which aims to gather education on single online platform for betterment of education.</p>");
            stringBuilder.Append("<h1>Your Account Details</h1>");
            stringBuilder.Append("<h2>Login Details</h2>");
            stringBuilder.Append("<br>");
            stringBuilder.Append("Username:");
            stringBuilder.Append(user.Text);
            stringBuilder.Append(" <br> ");
            stringBuilder.Append("Password:");
            stringBuilder.Append(pass.Text);
            return stringBuilder.ToString();
        }




        protected void Button1_Click1(object sender, EventArgs e)
        {
            CParentsregistraion classparent = new CParentsregistraion();
            string result = string.Empty;

            try
            {
                if (JFunctions.UploadSingleFile(fileupload, "images/Parents/"+fileupload.FileName) == "true")
                {
                    result = classparent.Registerparents(name.Text, lname.Text, nation.Text, radiobut.SelectedValue, dob.Text,
                        fileupload.FileName, religion.Text, contact1.Text, address.Text, officeadd.Text,
                        contact2.Text, nic.Text, post.Text, salary.Text, 1, Convert.ToInt32(DropDownList2.SelectedValue),
                        Convert.ToInt32(postal.Text), user.Text, pass.Text,
                        Convert.ToInt32(accountp.Text), pemail.Text, semail.Text);
                    if (result == "true")
                    {
                        JFunctions.SendEmail(pemail.Text, "CES - Registration", EmailBody());

                        //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "popup();", true);
                        Response.Write("Register");
                        Response.Redirect("Default.aspx");

                    }
                    else
                    {
                        Response.Write("not register");
                    }
                }
                else
                    Response.Write("image was not uploaded to server. Hence the registration process is cancelled. Please try again");
            }

            catch (Exception ex)
            {

                result = ex.ToString();
                Response.Write(result);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
           

        }
    }
}