using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class UpdateSchoolInformation2 : System.Web.UI.Page
    {
        private string file = string.Empty;
        private int cityid = 0;
        private SchoolRelatedFunction objJSchool = new SchoolRelatedFunction();
        private string FileName
        {
            get { return file; }
            set
            {
                if (fuLogo.HasFile)
                {
                    file = fuLogo.FileName;
                }
                else
                {
                    file = objJSchool.Logo;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
                JFunctions.BindDropDownList(ddlCountry, "country", "country_id", "select * from tbl_country");
                ShowSchoolInformation();
                imgLogo.ImageUrl = "images/registeredSchools/" + FileName;
            }

        }
        private void ShowSchoolInformation()
        {
            if (objJSchool.GetSchoolDetails() == "true")
            {
                txtSchoolName.Text = objJSchool.SchoolName;
                txtOwnerName.Text = objJSchool.OwnerName;
                txtFoundedIn.Text = objJSchool.FoundedIn.Substring(0, 10);
                FileName = objJSchool.Logo;
                ddlCity.ClearSelection();
                ddlCity.Items.FindByValue(objJSchool.CityID.ToString()).Selected = true;
                ddlCountry.ClearSelection();
                ddlCountry.Items.FindByValue(objJSchool.CountryID.ToString()).Selected = true;
                txtPostalCode.Text = objJSchool.PostalCode.ToString();
                txtSchoolTpe.Text = objJSchool.SchoolType;
                txtContactPrimary.Text = objJSchool.PrimaryContact;
                txtContactSecondary.Text = objJSchool.SecondaryContact;
                txtUsername.Text = objJSchool.Username;
                txtAccountPin.Text = objJSchool.AccountPin.ToString();
                txtPrimaryEmail.Text = objJSchool.PrimaryEmail;
                txtSecondaryEmail.Text = objJSchool.SecondaryEmail;
                txtLoginCount.Text = objJSchool.LoginCount.ToString();
                txtlastLoginDate.Text = objJSchool.LastLoginDate.Substring(0, 10);
            }
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {

            string result = objJSchool.UpdateSchoolInformation(txtUsername.Text, Convert.ToInt32(txtAccountPin.Text),
                 txtPrimaryEmail.Text, txtSecondaryEmail.Text, CurrentUser.AuthorizedID,
                 Convert.ToInt32(ddlCountry.SelectedValue), Convert.ToInt32(ddlCity.SelectedValue),
                 Convert.ToInt32(txtPostalCode.Text), objJSchool.LocationID, txtSchoolName.Text,
                 txtOwnerName.Text, txtFoundedIn.Text, FileName, txtContactPrimary.Text, txtContactSecondary.Text,
                 JSchool.SchoolID);
            if (result == "true")
            {
                Response.Write("<script>alert('Record Updated');</script>");
                if (JFunctions.UploadSingleFile(fuLogo, "images/registeredSchools/") == "true")
                    Response.Write("<script>alert('File has been uploaded');</script>");
            }
        }
    }
}