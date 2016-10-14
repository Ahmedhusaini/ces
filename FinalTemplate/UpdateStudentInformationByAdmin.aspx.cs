using FinalTemplate.source.Functions;
using System;
using System.Web;

namespace FinalTemplate
{
    public partial class UpdateStudentInformationByAdmin : System.Web.UI.Page
    {
        private JStudent objStudent = new JStudent();
        private string genderUpdated = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
                JFunctions.BindDropDownList(ddlClass, "class", "Class_id", "select * from tbl_class");
                JFunctions.BindDropDownList(ddlSection, "section", "Section_id", "select * from tbl_section");
            }


            if (!string.IsNullOrWhiteSpace(Request.QueryString["SIAC"]))
                txtStudentIDForGettingInformation.Text = Request.QueryString["SIAC"];

        }

        protected void btnGetStudentInformation_Click(object sender, EventArgs e)
        {
            if (objStudent.PopulateStudentInformationByAdminUsingStudentID(txtStudentIDForGettingInformation.Text, JSchool.SchoolID) == "true")
            {
                ShowStudentInformationToForm();
            }
            else if (objStudent.PopulateStudentInformationByAdminUsingStudentID(txtStudentIDForGettingInformation.Text, JSchool.SchoolID) == "NoRecord")
                HttpContext.Current.Response.Write("<script>alert('No Record Found with given student id');</script>");
        }

        private void ShowStudentInformationToForm()
        {
            string dateofbirth = Convert.ToString(objStudent.Day + "/" + objStudent.Month + "/" + objStudent.Year);
            txtFirstName.Text = objStudent.FirstName;
            txtLastName.Text = objStudent.LastName;
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(3, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/0" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/0" + dateofbirth.Substring(3, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateOfBirth.Text = "0" + dateofbirth.Substring(0, 1) + "/" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(5, 1) == "/"))
                txtDateOfBirth.Text = dateofbirth.Substring(0, 2) + "/" + dateofbirth.Substring(3, 2) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);

            if (objStudent.Gender.ToLower() == "male")
                rbtnMale.Checked = true;
            else
                rbtnFemale.Checked = true;

            txtNationality.Text = objStudent.Nationality;
            txtReligion.Text = objStudent.Religion;
            txtPhone.Text = objStudent.Phone;
            txtAddress.Text = objStudent.Address;
            txtPostalCode.Text = objStudent.PostalCode.ToString();
            ddlClass.ClearSelection();
            ddlClass.Items.FindByValue(objStudent.ClassID.ToString()).Selected = true;
            ddlSection.ClearSelection();
            ddlSection.Items.FindByValue(objStudent.SectionID.ToString()).Selected = true;
            ddlCity.ClearSelection();
            ddlCity.Items.FindByValue(objStudent.CityID.ToString()).Selected = true;
            txtGuardianName.Text = objStudent.GuardianName;
            txtGuardianContact.Text = objStudent.GuardianContact;
            txtPreviousSchool.Text = objStudent.PreviousSchool;
            txtLastClassAttended.Text = objStudent.LastClassAttended;
            txtGeneralID.Text = objStudent.GeneralID.ToString();
            txtAuthorizedID.Text = objStudent.AuthorizedID;
            txtStudentID.Text = objStudent.StudentID;
            txtClassSectionInformationID.Text = objStudent.ClassSectionInformationID.ToString();
            txtDateOfBirthID.Text = objStudent.DOBID.ToString();
            txtLocationID.Text = objStudent.LocationID.ToString();
        }

        protected void btnUpdateStudentInformation_Click(object sender, EventArgs e)
        {
            if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                genderUpdated = "male";
            else
                genderUpdated = "female";

            string result = objStudent.UpdateStudentInformation(Convert.ToInt32(txtDateOfBirthID.Text), txtDateOfBirth.Text,
                Convert.ToInt32(txtLocationID.Text), Convert.ToInt32(ddlCity.SelectedValue), Convert.ToInt32(txtPostalCode.Text),
                Convert.ToInt32(txtClassSectionInformationID.Text), Convert.ToInt32(ddlClass.SelectedValue),
                Convert.ToInt32(ddlSection.SelectedValue), txtStudentID.Text, txtGuardianName.Text,
                txtPreviousSchool.Text, txtLastClassAttended.Text, txtGuardianContact.Text, txtFirstName.Text,
                txtLastName.Text, txtNationality.Text, txtReligion.Text, txtPhone.Text, genderUpdated, txtAddress.Text,
                Convert.ToInt32(txtGeneralID.Text));
            if (result == "true")
            {
                HttpContext.Current.Response.Write("<script>alert('Record has been updated successfully.');</script>");
            }
            else
            {
                HttpContext.Current.Response.Write("<script>alert('An error occured during updating information. All changes are now properly rollback.');</script>");
            }
        }

        protected void rbtnMale_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
            {
                genderUpdated = "male";
            }
        }

        protected void rbtnFemale_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnFemale.Checked == true && rbtnMale.Checked == false)
            {
                genderUpdated = "female";
            }
        }
    }
}