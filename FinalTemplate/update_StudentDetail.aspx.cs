using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Validation;

namespace FinalTemplate
{
    public partial class update_StudentDetail : System.Web.UI.Page
    {
        private string gender = string.Empty;
        private StudentUpdate update = new StudentUpdate();
        public student s_update = new student();
        protected void Page_Load(object sender, EventArgs e)
        {
            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");

            if (!IsPostBack)
            {
                if (update.updatestudent(CurrentUser.AuthorizedID) == "true")
                {
                    ShowDataToForm();
                }
                else
                {
                    Response.Write("NO Recound Found");
                }
            }
         }

        private void ShowDataToForm()
        {
            txtFirstName.Text = update.u_firstname;
            txtLastName.Text = update.u_lastname;

            ddlNationality.Text = update.u_nationality;
            txtReligion.Text = update.u_religion;
            txtPhone.Text = update.u_phone;
            string dateofbirth = Convert.ToString(update.u_day + "/" + update.u_month + "/" + update.u_year);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(3, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/0" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/0" + dateofbirth.Substring(3, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(5, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/" + dateofbirth.Substring(3, 2) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);


            if (update.u_gender.ToLower() == "male")
                rbtnMale.Checked = true;
            else
                rbtnFemale.Checked = true;

            addresstxt.Text = update.u_address;
            gurdiannaametxt.Text = update.u_gurdianname;
            gurdiancontacttxt.Text = update.u_gurdianname;
            preschooltxt.Text = update.u_previousschool;
            lastclasstxt.Text = update.u_lastclassattend.ToString();

            ddlCity.ClearSelection();

            postalcodetxt.Text = update.u_postalcode.ToString();
            usernametxt.Text = update.u_username;
            pemailtxt.Text = update.u_primaryemail;
            semailtxt.Text = update.u_secondaryemail;
            stdtxtid.Text = update.u_stdid;
            txtGenealID.Text = update.u_generalid.ToString();
            txtLocationID.Text = update.u_locid.ToString();
            txtDOBId.Text = update.u_dobid.ToString();
            authorizedidtxt.Text=update.u_authorizeid;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                gender = "male";
            else
                gender = "female";

            string result = string.Empty;

            result = s_update.Updatestudentdetail(Convert.ToInt32(txtGenealID.Text), txtFirstName.Text, txtLastName.Text,
                           ddlNationality.SelectedItem.ToString(), gender, txtPhone.Text, txtReligion.Text, addresstxt.Text, Convert.ToInt32(txtDOBId.Text),
                          txtDateOfBirth.Text, stdtxtid.Text, gurdiannaametxt.Text, gurdiancontacttxt.Text, preschooltxt.Text, lastclasstxt.Text,
                         Convert.ToInt32(txtLocationID.Text), Convert.ToInt32(ddlCity.SelectedValue), Convert.ToInt32(postalcodetxt.Text),
                         authorizedidtxt.Text, usernametxt.Text, pemailtxt.Text, semailtxt.Text);

            Label1.Text = "successfully Update";
            if (result == "true")
                Response.Write("<script>alert('Record Successfully updated'); </script>");
            else
                Response.Write("<script>alert('Error occured during updation of data, the new information is rolled back to previous inforamtion and nothing is udpated.');</script>");
        }
    }
}