using FinalTemplate.source.Functions;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace FinalTemplate.source.Registration
{
    public class CParentsregistraion
    {
        private Database.Database mdata = new Database.Database("cesConnectionString3");

        public string Registerparents( string firstname, string lastname, string nationality, string gender, string photo,
            string religion,string phone, string address, string officeaddress, string officeno, string cnicno,
            string postdesignation, string salaryanum, int country_id, int city_id, int postalcode, string username,
            string password, int accountpin, string primaryemail, string secondaryemail)
        {
            string locationid = mdata.GetLastValueByColumnName("loc_id", "tbl_location");
            string genaralid = mdata.GetLastValueByColumnName("General_Id", "tbl_general");
            string dobid = mdata.GetLastValueByColumnName("dob_id", "tbl_dob");



            mdata.CreateConnection();
            mdata.InitializeSQLCommandObject(mdata.GetCurrentConnection, "SP_PARENTREGISTRATIONN", true);
            SqlParameter parentidParameter = new SqlParameter("@Parent_id ", SqlDbType.VarChar, 50);
            SqlParameter generalidParameter = new SqlParameter("@general_id  ", SqlDbType.Int);
            SqlParameter firstnameParameter = new SqlParameter("@firstname ", SqlDbType.VarChar, 50);
            SqlParameter lastnameParameter = new SqlParameter("@lastname ", SqlDbType.VarChar,50);
            SqlParameter nationalityParameter = new SqlParameter("@nationality ", SqlDbType.VarChar, 50);
            SqlParameter genderParameter = new SqlParameter("@gender ", SqlDbType.VarChar,7);
            SqlParameter photoParameter = new SqlParameter("@photo  ", SqlDbType.VarChar, 200);
            SqlParameter religionParameter = new SqlParameter("@religion  ", SqlDbType.VarChar, 20);
            SqlParameter phoneParameter = new SqlParameter("@phone   ", SqlDbType.VarChar, 50);
            SqlParameter addressParameter = new SqlParameter("@address  ", SqlDbType.VarChar, 50);
            SqlParameter officeaddressParameter = new SqlParameter("@office_address  ", SqlDbType.VarChar, 50);
            SqlParameter officenoParameter = new SqlParameter("@Office_no ", SqlDbType.VarChar, 50);
            SqlParameter cnicnoParameter = new SqlParameter("@CNIC_No   ", SqlDbType.VarChar, 20);
            SqlParameter postdesignationParameter = new SqlParameter("@Post_Designation ", SqlDbType.VarChar, 50);
            SqlParameter salaryanumParameter = new SqlParameter("@Salary_Anum    ", SqlDbType.VarChar, 20);
            SqlParameter generalidoutParameter = new SqlParameter("@general_id_out ", SqlDbType.Int);
            SqlParameter parentidoutParameter = new SqlParameter("@parent_id_out ", SqlDbType.VarChar,50);                  
            SqlParameter dobidParameter = new SqlParameter("@dob_id ", SqlDbType.Int);
            SqlParameter dayParameter = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter monthParameter = new SqlParameter("@month ", SqlDbType.Int);
            SqlParameter yearParameter = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter dobidoutParameter = new SqlParameter("@dob_id_out ", SqlDbType.Int);
            SqlParameter locidParameter = new SqlParameter("@loc_id", SqlDbType.Int);
            SqlParameter countryidParameter = new SqlParameter("@country_id", SqlDbType.Int);
            SqlParameter cityidParameter = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter postalParameter = new SqlParameter("@postal_code", SqlDbType.Int);                 
            SqlParameter locidoutidParameter = new SqlParameter("@loc_id_out ", SqlDbType.Int);
            SqlParameter authorizedidParameter = new SqlParameter("@authorized_id ", SqlDbType.VarChar,20);
            SqlParameter usernameParameter = new SqlParameter("@username", SqlDbType.VarChar,50);
            SqlParameter passwordParameter = new SqlParameter("@password", SqlDbType.VarChar, 50);
            SqlParameter accountpinParameter = new SqlParameter("@account_pin", SqlDbType.Int);
            SqlParameter primaryemailParameter = new SqlParameter("@primary_email", SqlDbType.VarChar, 50);
            SqlParameter secondaryemailParameter = new SqlParameter("@secondary_email", SqlDbType.VarChar, 50);
            SqlParameter usertypeParameter = new SqlParameter("@usertype_id", SqlDbType.Int);
            SqlParameter logincountParameter = new SqlParameter("@login_count", SqlDbType.Int);
            SqlParameter lastloginParameter = new SqlParameter("@last_login_date", SqlDbType.Date);
            SqlParameter authorizedidoutParameter = new SqlParameter("@authorized_id_out", SqlDbType.VarChar,20);




            parentidParameter.Value = GenerateParentID(firstname, lastname);
            generalidParameter.Value = Convert.ToInt32(genaralid)+1;
            firstnameParameter.Value = firstname;
            lastnameParameter.Value = lastname;
            nationalityParameter.Value = nationality;
            genderParameter.Value = gender;
            photoParameter.Value = photo;
            religionParameter.Value = religion;
            phoneParameter.Value = photo;
            addressParameter.Value = address;
            officeaddressParameter.Value = officeaddress;
            officenoParameter.Value = officeno;
            cnicnoParameter.Value = cnicno;
            postdesignationParameter.Value = postdesignation;
            salaryanumParameter.Value = salaryanum;
            generalidoutParameter.Direction= ParameterDirection.Output;
            parentidoutParameter.Direction=ParameterDirection.Output;
            dobidParameter.Value = Convert.ToInt32(dobid)+1;
            dayParameter.Value = Convert.ToInt32(Jfunctionparents.GetSystemDate().Substring(0, 1));
            monthParameter.Value =Convert.ToInt32(Jfunctionparents.GetSystemDate().Substring(2, 2));
            yearParameter.Value =Convert.ToInt32(Jfunctionparents.GetSystemDate().Substring(5, 4));
            dobidoutParameter.Direction=ParameterDirection.Output;
            locidParameter.Value = Convert.ToInt32(locationid) + 1;
            countryidParameter.Value = country_id;
            cityidParameter.Value = city_id;
            postalParameter.Value = postalcode;
            locidoutidParameter.Direction=ParameterDirection.Output;
            authorizedidParameter.Value = GenerateAuthorizedID(username, accountpin.ToString());
            usernameParameter.Value = username;
            passwordParameter.Value = password;
            accountpinParameter.Value = accountpin;
            primaryemailParameter.Value = primaryemail;
            secondaryemailParameter.Value = secondaryemail;
            usertypeParameter.Value = 3;
            logincountParameter.Value = 0;
            lastloginParameter.Value = Convert.ToDateTime(JFunctions.GetSystemDate());
            authorizedidoutParameter.Direction=ParameterDirection.Output;


            mdata.obj_sqlcommand.Parameters.Add(parentidParameter);
            mdata.obj_sqlcommand.Parameters.Add(generalidParameter);
            mdata.obj_sqlcommand.Parameters.Add(firstnameParameter);
            mdata.obj_sqlcommand.Parameters.Add(lastnameParameter);
            mdata.obj_sqlcommand.Parameters.Add(nationalityParameter);
            mdata.obj_sqlcommand.Parameters.Add(genderParameter);
            mdata.obj_sqlcommand.Parameters.Add(photoParameter);
            mdata.obj_sqlcommand.Parameters.Add(religionParameter);
            mdata.obj_sqlcommand.Parameters.Add(phoneParameter);
            mdata.obj_sqlcommand.Parameters.Add(addressParameter);
            mdata.obj_sqlcommand.Parameters.Add(officeaddressParameter);
            mdata.obj_sqlcommand.Parameters.Add(officenoParameter);
            mdata.obj_sqlcommand.Parameters.Add(cnicnoParameter);
            mdata.obj_sqlcommand.Parameters.Add(postdesignationParameter);
            mdata.obj_sqlcommand.Parameters.Add(salaryanumParameter);
            mdata.obj_sqlcommand.Parameters.Add(generalidoutParameter);
            mdata.obj_sqlcommand.Parameters.Add(parentidoutParameter);
            mdata.obj_sqlcommand.Parameters.Add(dobidParameter);
            mdata.obj_sqlcommand.Parameters.Add(dayParameter);
            mdata.obj_sqlcommand.Parameters.Add(monthParameter);
            mdata.obj_sqlcommand.Parameters.Add(yearParameter);
            mdata.obj_sqlcommand.Parameters.Add(dobidoutParameter);
            mdata.obj_sqlcommand.Parameters.Add(locidParameter);
            mdata.obj_sqlcommand.Parameters.Add(countryidParameter);
            mdata.obj_sqlcommand.Parameters.Add(cityidParameter);
            mdata.obj_sqlcommand.Parameters.Add(postalParameter);
            mdata.obj_sqlcommand.Parameters.Add(locidoutidParameter);
            mdata.obj_sqlcommand.Parameters.Add(authorizedidParameter);
            mdata.obj_sqlcommand.Parameters.Add(usernameParameter);
            mdata.obj_sqlcommand.Parameters.Add(passwordParameter);
            mdata.obj_sqlcommand.Parameters.Add(accountpinParameter);
            mdata.obj_sqlcommand.Parameters.Add(primaryemailParameter);
            mdata.obj_sqlcommand.Parameters.Add(secondaryemailParameter);
            mdata.obj_sqlcommand.Parameters.Add(usertypeParameter);
            mdata.obj_sqlcommand.Parameters.Add(logincountParameter);
            mdata.obj_sqlcommand.Parameters.Add(lastloginParameter);
            mdata.obj_sqlcommand.Parameters.Add(authorizedidoutParameter);
     

            try
            {
                mdata.OpenConnection();
                if (mdata.obj_sqlcommand.ExecuteNonQuery() > 0)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            catch (Exception ex)
            {
                return "false" + ex.ToString();
            }
            finally
            {
                mdata.obj_sqlcommand.Dispose();
                mdata.obj_sqlconnection.Dispose();
                mdata.obj_sqlcommand.Parameters.Clear();
                mdata.CloseConnection();
            }
        }



        private string GenerateAuthorizedID(string Username, string AccountPin)
        {
            return Convert.ToString(Username.Substring(0, 3) + AccountPin.Substring(0, 3));
        }

        private string GenerateParentID(string Firstname, string Lastname)
        {
            Random random = new Random();

            StringBuilder id = new StringBuilder();
            id.Append("C/");
            id.Append(Firstname.Substring(0, 3));
            id.Append("/E/");
            id.Append(Lastname.Substring(0, 3));
            id.Append("/S/");
            id.Append(JFunctions.GetSystemDate());
            id.Append("/");
            id.Append(JFunctions.GetSystemTime());
            id.Append("/");
            id.Append(random.Next(3, 10));
            return id.ToString();
        }


       
    }
}