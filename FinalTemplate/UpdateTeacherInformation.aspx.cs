using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FinalTemplate.source.Functions;
namespace FinalTemplate
{
    public partial class UpdateTeacherInformation : System.Web.UI.Page
    {
        private JTeacher objTeacher = new JTeacher();
        protected void Page_Load(object sender, EventArgs e)
        {
            rbtnFemale.Checked = false;
            rbtnMale.Checked = false;
            if (!IsPostBack)
            {
             //   objTeacher.PopulateTeacherProfileInformationByID(Convert.ToInt32(txtTeacherIDToPopulateDetails.Text));
            }
        }
        private void ShowDataToForm()
        {
            txtFirstName.Text = objTeacher.FirstName;
            txtLastName.Text = objTeacher.LastName;
            txtDateOfBirth.Text=objTeacher.Month+"/"+objTeacher.Day+"/"+objTeacher.Year;
            ddlNationality.SelectedIndex = 0;
            if (objTeacher.Gender.ToLower() == "male")
                rbtnMale.Checked = true;
            else
                rbtnFemale.Checked = true;
            //photo here
            txtReligion.Text = objTeacher.Religion;
            txtPhone.Text = objTeacher.Phone;
            txtAddress.Text = objTeacher.Address;
            //country
            //city
            txtPostalCode.Text = objTeacher.PostalCode.ToString();
            txtDateOfJoin.Text = objTeacher.DateOfJoin;
            txtCNIC.Text = objTeacher.CNIC;
            txtSchoolID.Text = objTeacher.SchoolID;
            txtUsername.Text = objTeacher.Username;
            txtPrimaryEmail.Text = objTeacher.PrimaryEmail;
            //usertype
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
        }
    }
}