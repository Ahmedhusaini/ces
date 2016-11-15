using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class update_teacherDetail : System.Web.UI.Page
    {
        public TeacherUpdate t_teacher = new TeacherUpdate();
        private string gender = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");

            //authorizedidtxt.Text =CurrentUser.AuthorizedID;
            //txtDOBId.Text=CurrentUser.DateOfBirthID.ToString();
            //txtLocationID.Text = CurrentUser.LocationID.ToString();
            //txtGenealID.Text = CurrentUser.GeneralID.ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                gender = "male";
            else
                gender = "female";

            string result = string.Empty;

            result = t_teacher.Updateacherdetail(Convert.ToInt32(txtGenealID.Text), txtFirstName.Text, txtLastName.Text,
                           ddlNationality.SelectedItem.ToString(), gender, txtPhone.Text, txtReligion.Text, addresstxt.Text, Convert.ToInt32(txtDOBId.Text),
                          txtDateOfBirth.Text,  Convert.ToInt32(teachertxtid.Text), DateOfJointxt.Text, cnicnotxt.Text,
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