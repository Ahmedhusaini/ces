using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    public partial class update_StudentDetail : System.Web.UI.Page
    {
        private string gender = string.Empty;
        private student update = new student();
        protected void Page_Load(object sender, EventArgs e)
        {
            JFunctions.BindDropDownList(ddlCity, "city", "city_id", "select * from tbl_city");

            if (Session["userid"] != null)
            {
                //txtFirstName.Text = CurrentUser.FirstName;
                //txtLastName.Text = CurrentUser.LastName;
                //txtPhone.Text = CurrentUser.Phone;
                //ddlNationality.Text = CurrentUser.Nationality;
                //txtReligion.Text = CurrentUser.Religion;
                //addresstxt.Text = CurrentUser.Address;

                //string dateofbirth = Convert.ToString(student.Day + "/" + student.Month + "/" + student.Year);

                //txtDateOfBirth.Text = dateofbirth;


                //gurdiannaametxt.Text = student.gurdianname;
                //gurdiancontacttxt.Text = student.gurdiancontact;
                //preschooltxt.Text = student.previousschool;
                //lastclasstxt.Text = student.lastclassattend;
                //postalcodetxt.Text = student.postalcode;
                //usernametxt.Text = CurrentUser.Username;
                //pemailtxt.Text = CurrentUser.PrimaryEmailAddress;
                //semailtxt.Text = CurrentUser.SecondaryEmailAddress;
                stdtxtid.Text = student.studentid;
                txtGenealID.Text = CurrentUser.GeneralID.ToString();
                txtDOBId.Text = CurrentUser.DateOfBirthID.ToString();
                txtLocationID.Text = CurrentUser.LocationID.ToString();
                authorizedidtxt.Text = CurrentUser.AuthorizedID;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //try
            //{
            ////string ab = CurrentUser.AuthorizedID;
            //    username.Text = "";
            //string update = ConfigurationManager.ConnectionStrings["cesConnectionString2"].ConnectionString;
            //SqlConnection connection = new SqlConnection(update);

            //SqlDataAdapter adp = new SqlDataAdapter("select authorized_id from tbl_authorized_users where authorized_id='" + authorizedid.Text + "'", connection);
            //DataTable dt = new DataTable();
            //adp.Fill(dt);
            //if (dt.Rows.Count.ToString() == "1")
            //{
            //    //if (authorizedid.Text == ab)
            //    //{
            //        connection.Open();
            //        SqlCommand command = new SqlCommand("update tbl_authorized_users set username='" + username.Text + "' where authorized_id='" + authorizedid.Text + "'",connection);                  
            //        command.ExecuteNonQuery();
            //        connection.Close();
            //        Label1.Text = "Successfully Update";
            //        Label1.ForeColor = System.Drawing.Color.DarkRed;
            //    }
            ////}
            //}
            //catch (Exception ex)
            //{
            //    Label1.Text = ex.Message;
            //}


            if (rbtnMale.Checked == true && rbtnFemale.Checked == false)
                gender = "male";
            else
                gender = "female";

            string result = string.Empty;

            result = update.Updatestudentdetail(Convert.ToInt32(txtGenealID.Text), txtFirstName.Text, txtLastName.Text,
                           ddlNationality.SelectedItem.ToString(), gender, txtPhone.Text, txtReligion.Text, addresstxt.Text, Convert.ToInt32(txtDOBId.Text),
                          txtDateOfBirth.Text, stdtxtid.Text, gurdiannaametxt.Text, gurdiancontacttxt.Text, preschooltxt.Text, lastclasstxt.Text,
                         Convert.ToInt32(txtLocationID.Text), Convert.ToInt32(ddlCity.SelectedValue), Convert.ToInt32(postalcodetxt.Text),
                         authorizedidtxt.Text, usernametxt.Text, pemailtxt.Text, semailtxt.Text);
            if (result == "true")
                Response.Write("<script>alert('Record Successfully updated'); </sc ript>");
            else
                Response.Write("<script>alert('Error occured during updation of data, the new information is rolled back to previous inforamtion and nothing is udpated.');</script>");
        }
    }
}