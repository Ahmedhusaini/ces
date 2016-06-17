using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class Logintype : System.Web.UI.Page
    {
        private Database myDatabase = new Database("cesConnectionString");
        private string valideUsername, validePasswoerd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddl_type, "usertype", "usertype_id", "select * from tbl_usertype");
                ddl_type.Items.Insert(0, "--- Select User Type ---");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ddl_type.SelectedIndex == 0)
            {
                Response.Write("Please choose a user type");
            }
            else if (ddl_type.SelectedIndex == 1)
            {
                Login(txt_username.Text, txt_password.Text);
                Response.Redirect("~/Admin.aspx");
            }
            else if (ddl_type.SelectedIndex == 2)
            {

            }
        }
        protected internal string Login(string username, string password)
        {
            if ((username == "" || password == "") || (username == null || password == null))
            {
                return "username/password can not be null or empty.";
            }
            string[] columns = { "username", "password" };
            string[,] returnedValues;
            returnedValues = myDatabase.SelectQuery("tbl_authorized_users", columns);
            if (String.IsNullOrEmpty(returnedValues[0, 0]))
                return "no user found";
            valideUsername = returnedValues[0, 0];
            validePasswoerd = returnedValues[0, 1];
            return "true";

        }

    }
}