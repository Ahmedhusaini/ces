using FinalTemplate.source.Functions;
using FinalTemplate.source.Validation;
using System;

namespace FinalTemplate
{
    public partial class UpdateParentInformation : System.Web.UI.Page
    {
        private SParents objJParents = new SParents();
        private string gender = string.Empty;
        private int cityID = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

            
                
           
          

            if (!IsPostBack)
            {
                Jfunctionparents.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");
                JFunctions.BindDropDownList(ddlCountry, "country", "country_id", "select * from tbl_country");

                if (objJParents.showParent(Parents.parentschild) == "true")
                {
                    viewdetail();
                }

                else
                {

                    Response.Write("<script>alert('No record found . Try again with valid ID.');</script>");
                }
            
            }

           
            
        }

        private void viewdetail()
        {
            string dateofbirth = Convert.ToString(objJParents.Day + "/" + objJParents.Month + "/" + objJParents.Year);
            txtFirstName.Text = objJParents.FirstName;
            txtLastName.Text = objJParents.LastName;
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(3, 1) == "/"))
                txtDateofB.Text = "0" + dateofbirth.Substring(0, 1) + "/0" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateofB.Text = dateofbirth.Substring(0, 2) + "/0" + dateofbirth.Substring(3, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(1, 1) == "/" && dateofbirth.Substring(4, 1) == "/"))
                txtDateofB.Text = "0" + dateofbirth.Substring(0, 1) + "/" + dateofbirth.Substring(2, 1) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);
            if ((dateofbirth.Substring(2, 1) == "/" && dateofbirth.Substring(5, 1) == "/"))
                txtDateofB.Text = dateofbirth.Substring(0, 2) + "/" + dateofbirth.Substring(3, 2) + "/" + dateofbirth.Substring(dateofbirth.Length - 4, 4);


            ddlNationality.SelectedIndex = 0;
            if (objJParents.Gender.ToLower() == "male")
                rbtnMale.Checked = true;
            else
                rbtnFemale.Checked = true;

            txtuser.Text = objJParents.ParentID;
           
            txtDOB.Text = objJParents.DOBID.ToString();
            txtReligion.Text = objJParents.Religion;
            txtPhone.Text = objJParents.Phone;
            txtAddress.Text = objJParents.Address;
            txtofficeadd.Text = objJParents.office_address;
            txtofficeno.Text = objJParents.office_phone;
            txtdesig.Text = objJParents.Post;
            txtsal.Text = objJParents.Salary;
            ddlCity.ClearSelection();
           // ddlCity.Items.FindByValue(objJParents.CityID.ToString()).Selected = true;
            txtPostalCode.Text = objJParents.PostalCode.ToString();
            txtCNIC.Text = objJParents.CNIC;
            txtautho.Text = objJParents.AuthorizeID;
            txtUsername.Text = objJParents.username;
            txtPrimaryEmail.Text = objJParents.PrimaryEmail;
            txtSecondaryEmail.Text = objJParents.SecondaryEmail;
            txtGenealID.Text =objJParents.GeneralID.ToString();
            txtLocationID.Text = objJParents.LocationID.ToString();
        







        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string result = objJParents.UpdateParentInfo(Convert.ToInt32(txtGenealID.Text), txtofficeadd.Text,
                txtUsername.Text, txtPrimaryEmail.Text,
                txtSecondaryEmail.Text, txtautho.Text, txtofficeno.Text, txtdesig.Text, txtsal.Text, txtuser.Text,
                Convert.ToInt32(txtDOB.Text), Convert.ToInt32(txtLocationID.Text),
                txtFirstName.Text, txtLastName.Text, ddlNationality.SelectedItem.ToString(),txtCNIC.Text, gender, txtReligion.Text,
                txtPhone.Text, txtAddress.Text, txtDateofB.Text, Convert.ToInt32(ddlCity.SelectedValue),
                Convert.ToInt32(txtPostalCode.Text));
            if (result=="true")
            {
                Response.Write("<script> alert('Successfull');</script>");
            }
            else
            {
                Response.Write("<script>alert ('Not Successfull');</script>");
            }
        }
    }
}