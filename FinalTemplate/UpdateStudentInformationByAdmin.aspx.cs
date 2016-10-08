using FinalTemplate.source.Functions;
using System;
using System.Web;

namespace FinalTemplate
{
    public partial class UpdateStudentInformationByAdmin : System.Web.UI.Page
    {
        private JStudent objStudent = new JStudent();
        protected void Page_Load(object sender, EventArgs e)
        {
            rbtnMale.Checked = false;
            rbtnFemale.Checked = false;
            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
            JFunctions.BindDropDownList(ddlClass, "class", "Class_id", "select * from tbl_class");
            JFunctions.BindDropDownList(ddlSection, "section", "Section_id", "select * from tbl_section");
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
            ddlClass.Items.FindByValue(objStudent.ClassID.ToString()).Selected = true;
            ddlSection.Items.FindByValue(objStudent.SectionID.ToString()).Selected = true;
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
        }
    }
}