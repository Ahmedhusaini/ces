using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Database;
using FinalTemplate.source.Validation;

namespace FinalTemplate
{
    public partial class update_teacherDetail : System.Web.UI.Page
    {
        //private string gender = string.Empty;
        //public TeacherUpdate update = new TeacherUpdate();
        //public teacher t_update = new teacher();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
                Response.Redirect("Default.aspx");
            if (!IsPostBack)
                ShowDataToForm();
        }

        private void ShowDataToForm()
        {
            txtFirstName.Text = CurrentUser.FirstName;
            txtLastName.Text = CurrentUser.LastName;
            ddlNationality.Text = ddlNationality.SelectedValue;
            addresstxt.Text = CurrentUser.Address;
            ddlCity.ClearSelection();
            postalcodetxt.Text =teacher.teacher_postalcode;
            usernametxt.Text = CurrentUser.Username;
            passwordtxt.Text = CurrentUser.Password;
            pemailtxt.Text = CurrentUser.PrimaryEmailAddress;
            semailtxt.Text = CurrentUser.SecondaryEmailAddress;
            teachertxtid.Text = teacher.teacher_id;
            txtGenealID.Text = CurrentUser.GeneralID.ToString();
            txtLocationID.Text = CurrentUser.LocationID.ToString();
            txtDOBId.Text = CurrentUser.DateOfBirthID.ToString();
            authorizedidtxt.Text = CurrentUser.AuthorizedID;
            cnicnotxt.Text = teacher.teacher_cnic;
            DateOfJointxt.Text = teacher.teacher_dateofjoin;
            txtPhone.Text = CurrentUser.Phone;
            txtReligion.Text = CurrentUser.Religion;

        }



        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
            Database db = new Database("ces");
            
                using (SqlConnection con = new SqlConnection(a))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_Update_TeacherInformation", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@firstname", SqlDbType.VarChar).Value = txtFirstName.Text;
                    cmd.Parameters.AddWithValue("@lastname", SqlDbType.VarChar).Value = txtLastName.Text;
                    cmd.Parameters.AddWithValue("@nationality", SqlDbType.VarChar).Value = ddlNationality.SelectedValue;
                    cmd.Parameters.AddWithValue("@religion", SqlDbType.VarChar).Value = txtReligion.Text;
                    cmd.Parameters.AddWithValue("@phone", SqlDbType.VarChar).Value = txtPhone.Text;
                    cmd.Parameters.AddWithValue("@address", SqlDbType.VarChar).Value =addresstxt.Text;
                    cmd.Parameters.AddWithValue("@city_id", SqlDbType.Int).Value =Convert.ToInt32(ddlCity.SelectedValue);
                    cmd.Parameters.AddWithValue("@postal_code", SqlDbType.Int).Value =Convert.ToInt32(postalcodetxt.Text);
                    cmd.Parameters.AddWithValue("@username", SqlDbType.VarChar).Value = usernametxt.Text;
                    cmd.Parameters.AddWithValue("@password", SqlDbType.VarChar).Value = passwordtxt.Text;
                    cmd.Parameters.AddWithValue("@primary_email", SqlDbType.VarChar).Value = pemailtxt.Text;
                    cmd.Parameters.AddWithValue("@secondary_email", SqlDbType.VarChar).Value = semailtxt.Text;
                    cmd.Parameters.AddWithValue("@date_of_join", SqlDbType.Date).Value = DateOfJointxt.Text;
                    cmd.Parameters.AddWithValue("@cnic_no", SqlDbType.VarChar).Value = cnicnotxt.Text;
                    cmd.Parameters.AddWithValue("@General_Id",SqlDbType.Int).Value=CurrentUser.GeneralID;
                    cmd.Parameters.AddWithValue("@loc_id", SqlDbType.Int).Value = CurrentUser.LocationID;
                    cmd.Parameters.AddWithValue("@authorized_id", SqlDbType.VarChar).Value = CurrentUser.AuthorizedID;
                    cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacher_id;
                    try {
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Record Successfully updated'); </script>");         
                        }
                    }catch(Exception ex)
                    {
                        HttpContext.Current.Response.Write(ex.ToString());
                        Response.Write("<script>alert('Error occured during updation of data, the new information is rolled back to previous inforamtion and nothing is updated.');</script>");
                    }
                    finally
                    {
                        con.Close();
                        cmd.Dispose();
                    }                    
                }
        }
    }
}