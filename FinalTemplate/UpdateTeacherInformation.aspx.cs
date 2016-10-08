using FinalTemplate.source.Functions;
using FinalTemplate.source.Validation;
using System;

namespace FinalTemplate
{
    public partial class UpdateTeacherInformation : System.Web.UI.Page
    {
        private JTeacher objTeacher = new JTeacher();
        private string gender = string.Empty;
        private int cityID = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(Request.QueryString["IAC"]))
                txtTeacherIDToPopulateDetails.Text = Request.QueryString["IAC"];



            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
            JFunctions.BindDropDownList(ddlCountry, "country", "country_id", "select * from tbl_country");
        }


        private void ShowDataToForm()
        {
            string dateofbirth = Convert.ToString(objTeacher.Day + "/" + objTeacher.Month + "/" + objTeacher.Year);
            DateTime dateofjoin = Convert.ToDateTime(objTeacher.DateOfJoin);
            txtFirstName.Text = objTeacher.FirstName.Trim();
            txtLastName.Text = objTeacher.LastName;
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(3, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/0" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/0" + dateofbirth.Substring(3, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(5, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/" + dateofbirth.Substring(3, 2) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);

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
            txtGenealID.Text = objTeacher.GeneralID.ToString();
            txtDOBId.Text = objTeacher.DOBID.ToString();
            txtLocationID.Text = objTeacher.LocationID.ToString();
            txtTeacherID.Text = objTeacher.TeacherID.ToString();
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
            txtReligion.Text = "";
            txtPhone.Text = "";
            txtPostalCode.Text = "";
            txtCNIC.Text = "";
            txtSchoolID.Text = "";
            txtUsername.Text = "";
            txtPrimaryEmail.Text = "";
            txtLoginCount.Text = "";
            txtlastLoginDate.Text = "";
            txtGenealID.Text = "";
            txtDateOfBirth.Text = "";
            txtLocationID.Text = "";
            txtTeacherID.Text = "";
        }

        protected void Button21_Click(object sender, EventArgs e)
        {
            string[] AssumedBlackListKeyWords = { txtFirstName.Text, txtLastName.Text, txtDateOfBirth.Text, txtReligion.Text, txtPhone.Text, txtAddress.Text, txtPostalCode.Text, txtCNIC.Text, txtDateOfJoin.Text };
            if (Jvalidate.FilterBlackLIstKeywords(AssumedBlackListKeyWords))
            {
                if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                    gender = "male";
                else
                    gender = "female";

                string result = objTeacher.UpdateTeacherInformation(Convert.ToInt32(txtGenealID.Text), Convert.ToInt32(txtDOBId.Text), Convert.ToInt32(txtLocationID.Text), Convert.ToInt32(txtTeacherID.Text), txtFirstName.Text, txtLastName.Text, ddlNationality.SelectedItem.ToString(), gender, txtReligion.Text, txtPhone.Text, txtAddress.Text, txtDateOfJoin.Text, txtDateOfBirth.Text, cityID, Convert.ToInt32(txtPostalCode.Text));
                if (result == "true")
                    Response.Write("<script>alert('Record Successfully updated');</script>");
                else
                    Response.Write("<script>alert('Error occured during updation of data, the new information is rolled back to previous inforamtion and nothing is udpated.');</script>");
            }
        }
        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            cityID = Convert.ToInt32(ddlCity.SelectedValue);
        }

        //protected void rbtnMale_CheckedChanged(object sender, EventArgs e)
        //{
        //    gender = "male";
        //}

        //protected void rbtnFemale_CheckedChanged(object sender, EventArgs e)
        //{
        //    gender = "female";
        //}
    }
}