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
    public partial class UpdateTeacherInformation : System.Web.UI.Page
    {
        private JTeacher objTeacher = new JTeacher();
        protected void Page_Load(object sender, EventArgs e)
        {
            rbtnFemale.Checked = false;
            rbtnMale.Checked = false;

            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
            JFunctions.BindDropDownList(ddlCountry, "country", "country_id", "select * from tbl_country");
        }


        private void ShowDataToForm()
        {
            string dateofbirth = Convert.ToString(objTeacher.Day + "/" + objTeacher.Month+ "/" + objTeacher.Year);
            DateTime dateofjoin = Convert.ToDateTime(objTeacher.DateOfJoin);
            txtFirstName.Text = objTeacher.FirstName;
            txtLastName.Text = objTeacher.LastName;
            if(dateofbirth.Substring(1,1)=="/")
                txtDateOfBirth.Text = "0"+dateofbirth;
            else
                txtDateOfBirth.Text = dateofbirth;
            ddlNationality.SelectedIndex = 0;
            if (objTeacher.Gender.ToLower() == "male")
                rbtnMale.Checked = true;
            else
                rbtnFemale.Checked = true;

            txtReligion.Text = objTeacher.Religion;
            txtPhone.Text = objTeacher.Phone;
            txtAddress.Text = objTeacher.Address;

            ddlCity.Items.FindByValue(objTeacher.CityID.ToString()).Selected = true;
            txtPostalCode.Text = objTeacher.PostalCode.ToString();
            txtDateOfJoin.Text = dateofjoin.ToString("d");
            txtCNIC.Text = objTeacher.CNIC;
            txtSchoolID.Text = objTeacher.SchoolID;
            txtUsername.Text = objTeacher.Username;
            txtPrimaryEmail.Text = objTeacher.PrimaryEmail;
            txtLoginCount.Text = objTeacher.LoginCount.ToString();
            txtlastLoginDate.Text = objTeacher.LastLoginDate;
        }
        protected void btnPopulateDetails_Click(object sender, EventArgs e)
        {
            if (objTeacher.PopulateTeacherProfileInformationByID(Convert.ToInt32(txtTeacherIDToPopulateDetails.Text), JSchool.SchoolID) == "true")
            {
                ShowDataToForm();
            }
            else
            {
                ClearAllFields();
                Response.Write("<script>alert('No record found with given teacher id. Try again with valid ID.');</script>");
            }
        }
        private void ClearAllFields()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtDateOfBirth.Text = "";
            rbtnFemale.Checked = false;
            rbtnMale.Checked = false;
            txtReligion.Text = "";
            txtPhone.Text = "";
            txtPostalCode.Text = "";
            txtCNIC.Text = "";
            txtSchoolID.Text = "";
            txtUsername.Text = "";
            txtPrimaryEmail.Text = "";
            txtLoginCount.Text = "";
            txtlastLoginDate.Text = "";
        }

        protected void Button21_Click(object sender, EventArgs e)
        {
            string gender = string.Empty;
            //JTeacher objteacher = new JTeacher();
            string[] AssumedBlackListKeyWords = { txtFirstName.Text, txtLastName.Text, txtDateOfBirth.Text, txtReligion.Text, txtPhone.Text, txtAddress.Text, txtPostalCode.Text, txtCNIC.Text, txtDateOfJoin.Text };
            if (Jvalidate.FilterBlackLIstKeywords(AssumedBlackListKeyWords))
            {
                if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                    gender = "male";
                else
                    gender = "female";
                string result = objTeacher.UpdateTeacherInformation(objTeacher.GeneralID,objTeacher.DOBID,objTeacher.LocationID,objTeacher.TeacherID,txtFirstName.Text, txtLastName.Text, ddlNationality.SelectedItem.ToString(), gender, objTeacher.Photo, txtReligion.Text, txtPhone.Text, txtAddress.Text, txtDateOfJoin.Text, txtDateOfBirth.Text, Convert.ToInt32(ddlCity.SelectedValue), Convert.ToInt32(txtPostalCode.Text));
                if (result == "true")
                    Response.Write("<script>alert('Record Successfully updated');</script>");
                else
                    Response.Write("<script>alert('Error occured during updation of data, the new information is rolled back to previous inforamtion and nothing is udpated.');</script>");
            }
        }
    }
}