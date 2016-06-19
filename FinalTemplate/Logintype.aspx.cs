using FinalTemplate.source.Functions;
using System;
using System.Drawing;

namespace FinalTemplate
{
    public partial class Logintype : System.Web.UI.Page
    {
        private Login myLogin = new Login();
        private string loginresult;
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_error.Visible = false;

            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddl_type, "usertype", "usertype_id", "select * from tbl_usertype");
                ddl_type.Items.Insert(0, "--- Select User Type ---");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            loginresult = myLogin.UserLogin(txt_username.Text, txt_password.Text);
            if (ddl_type.SelectedIndex == 0)
            {
                lbl_error.Visible = true;
                lbl_error.Text = "Please choose a user type";
                lbl_error.ForeColor = Color.Red;
            }
            else
            {
                if (txt_username.Text == "" || txt_username.Text == string.Empty || txt_password.Text == "" || txt_password.Text == string.Empty)
                {
                    lbl_error.Visible = true;
                    lbl_error.Text = "username and password fields can not be null or empty.";
                    lbl_error.ForeColor = Color.SteelBlue;
                }
                else
                {
                    if (loginresult == "true")
                    {
                        if (ddl_type.SelectedIndex == 1)
                        {
                            if (loginresult == "true")
                                Response.Redirect("~/Admin.aspx");
                        }
                        else if (ddl_type.SelectedIndex == 2)
                        {
                            if (loginresult == "true")
                                Response.Redirect("~/Admin.aspx");
                        }
                    }
                    else
                    {
                        lbl_error.Text = "username and password combination is incorrect.";
                        lbl_error.Visible = true;
                        lbl_error.ForeColor = Color.Gold;
                    }
                }
            }
        }
    }
}