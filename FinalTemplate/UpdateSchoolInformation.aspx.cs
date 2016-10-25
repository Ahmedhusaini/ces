using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class UpdateSchoolInformation : System.Web.UI.Page
    {
        private string[,] SchoolInformation;
        private JSchool objJSchool = new JSchool();
        private string FileName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
                JFunctions.BindDropDownList(ddlCountry, "country", "country_id", "select * from tbl_country");
            }
            ShowSchoolInformation();
            imgLogo.ImageUrl = "images/registeredSchools/" + FileName;
        }
        private bool LoadSchoolInformation()
        {
            SchoolInformation = objJSchool.GetSchoolDetails();
            if (SchoolInformation.Length == 0)
                return false;
            return true;
        }

        private void ShowSchoolInformation()
        {
            if (LoadSchoolInformation())
            {
                txtSchoolName.Text = SchoolInformation[0, 14];
                txtOwnerName.Text = SchoolInformation[0, 15];
                txtFoundedIn.Text = SchoolInformation[0, 16];
                FileName = SchoolInformation[0, 17];
                ddlCity.ClearSelection();
                ddlCity.Items.FindByValue(SchoolInformation[0, 11].ToString()).Selected = true;
                ddlCountry.ClearSelection();
                ddlCountry.Items.FindByValue(SchoolInformation[0, 10].ToString()).Selected = true;
                txtPostalCode.Text = SchoolInformation[0, 12];
                txtSchoolTpe.Text = SchoolInformation[0, 21];
                txtContactPrimary.Text = SchoolInformation[0, 18];
                txtContactSecondary.Text = SchoolInformation[0, 19];
                txtUsername.Text = SchoolInformation[0, 1];
                txtPassword.Text = SchoolInformation[0, 2];
                txtAccountPin.Text = SchoolInformation[0, 3];
                txtPrimaryEmail.Text = SchoolInformation[0, 4];
                txtSecondaryEmail.Text = SchoolInformation[0, 5];
                txtLoginCount.Text = SchoolInformation[0, 7];
                txtlastLoginDate.Text = SchoolInformation[0, 8];
            }
        }
    }
}