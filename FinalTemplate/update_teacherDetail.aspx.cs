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
    public partial class update_teacherDetail : System.Web.UI.Page
    {
        private string gender = string.Empty;
        public TeacherUpdate update = new TeacherUpdate();
        public teacher t_update = new teacher();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
            ShowDataToForm();
        }

        private void ShowDataToForm()
        {
            txtFirstName.Text = CurrentUser.FirstName;
            txtLastName.Text = CurrentUser.LastName;
            
            

            ddlNationality.Text = update.u_nationality;
            string dateofbirth = Convert.ToString(update.u_day + "/" + update.u_month + "/" + update.u_year);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(3, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/0" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/0" + dateofbirth.Substring(3, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(5, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/" + dateofbirth.Substring(3, 2) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);


            if (CurrentUser.Gender.ToLower() == "male")
                rbtnMale.Checked = true;
            else
                rbtnFemale.Checked = true;

            addresstxt.Text = CurrentUser.Address;
            ddlCity.ClearSelection();
            postalcodetxt.Text = update.u_postalcode.ToString();
            usernametxt.Text = CurrentUser.Username;
            pemailtxt.Text = CurrentUser.PrimaryEmailAddress;
            semailtxt.Text = CurrentUser.SecondaryEmailAddress;
            teachertxtid.Text = teacher.teacher_id;
            txtGenealID.Text = CurrentUser.GeneralID.ToString();
            txtLocationID.Text = CurrentUser.LocationID.ToString();
            txtDOBId.Text = CurrentUser.DateOfBirthID.ToString();
            authorizedidtxt.Text = CurrentUser.AuthorizedID;
            cnicnotxt.Text = teacher.teacher_cnic;
            DateOfJointxt.Text = teacher.teacher_dateofjoin;
            txtPhone.Text = CurrentUser.Phone;
            txtReligion.Text = CurrentUser.Religion;

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                gender = "male";
            else
                gender = "female";

            string result = string.Empty;

            //result = t_update.Updateteacherdetail(Convert.ToInt32(txtGenealID.Text), txtFirstName.Text, txtLastName.Text,
            //               ddlNationality.SelectedItem.ToString(), gender, txtPhone.Text, txtReligion.Text, addresstxt.Text, Convert.ToInt32(txtDOBId.Text),
            //              txtDateOfBirth.Text,  Convert.ToInt32(teachertxtid.Text), DateOfJointxt.Text, cnicnotxt.Text,
            //             Convert.ToInt32(txtLocationID.Text), Convert.ToInt32(ddlCity.SelectedValue), Convert.ToInt32(postalcodetxt.Text),
            //             authorizedidtxt.Text, usernametxt.Text, pemailtxt.Text, semailtxt.Text);

            Label1.Text = "successfully Update";
            if (result == "true")
                Response.Write("<script>alert('Record Successfully updated'); </script>");
            else
                Response.Write("<script>alert('Error occured during updation of data, the new information is rolled back to previous inforamtion and nothing is udpated.');</script>");
        
        }
    }
}