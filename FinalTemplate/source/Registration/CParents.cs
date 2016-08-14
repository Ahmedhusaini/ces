using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using FinalTemplate.source.Functions;
using System.Text;
using System.Data;
using System.EnterpriseServices;

namespace FinalTemplate.source.Registration
{
    public class CParents
    {
        private Database.Database mdata = new Database.Database("cesConnectionString3");

        public string Registerparents(int country_id, int city_id, int postalcode, int officeNo, string username,string postdesig,string officeaddress,string salary, string password,string address,string phone, int accountpin, string primaryemail,string nationality,string gender,string religion , string secondaryemail, string photo, string nicc, string firstname, string lastname, string designation)
        {
            String locationid = mdata.GetLastValueByColumnName("loc_id", "tbl_location");
            String genaralid = mdata.GetLastValueByColumnName("General_Id", "tbl_general");
            String dobid = mdata.GetLastValueByColumnName("dob_id", "tbl_dob");
            

            mdata.CreateConnection();
            mdata.InitializeSQLCommandObject(mdata.GetCurrentConnection, "SP_PARENTREGISTRATIONN", true);
            SqlParameter locidParameter = new SqlParameter("@loc_id", SqlDbType.Int);
            SqlParameter countryidParameter = new SqlParameter("@country_id", SqlDbType.Int);
            SqlParameter cityidparameter = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter postalcodeParameter = new SqlParameter("@postal_code", SqlDbType.Int);
            SqlParameter locidoutParamter = new SqlParameter("@loc_id_out", SqlDbType.Int);
            SqlParameter authorizedParameter = new SqlParameter("@authorized_id", SqlDbType.VarChar,20);
            SqlParameter usernameParameter = new SqlParameter("@username", SqlDbType.VarChar, 50);
            SqlParameter passwordParameter = new SqlParameter("@password", SqlDbType.VarChar, 50);
            SqlParameter accountpinParameter = new SqlParameter("@account_pin", SqlDbType.Int);
            SqlParameter primaryParameter = new SqlParameter("@primary_email ", SqlDbType.VarChar,50);
            SqlParameter secondaryParameter = new SqlParameter("@secondary_email ", SqlDbType.VarChar, 50);
            SqlParameter usertypeidParameter = new SqlParameter("@usertype_id", SqlDbType.Int);
            SqlParameter logincountParameter = new SqlParameter("@login_count", SqlDbType.Int);
            SqlParameter lastlogindateParameter = new SqlParameter("@last_login_date", SqlDbType.Date);
            SqlParameter authorizedioutParameter = new SqlParameter("@authorized_id_out", SqlDbType.VarChar,20);
            SqlParameter parentidParameter = new SqlParameter("@Parent_id", SqlDbType.VarChar, 50);
            SqlParameter postdesignationParameter = new SqlParameter("@Post_Designation", SqlDbType.VarChar, 50);
            SqlParameter cnicnoParameter = new SqlParameter("@CNIC_No", SqlDbType.VarChar, 20);
            SqlParameter officeaddressParameter = new SqlParameter("@office_address", SqlDbType.VarChar, 50);
            SqlParameter salaryParameter = new SqlParameter("@Salary_Anum ", SqlDbType.VarChar, 50);
            SqlParameter officenoParameter = new SqlParameter("@Office_no ", SqlDbType.VarChar, 50);
         //   SqlParameter studentidParameter = new SqlParameter("@std_id ", SqlDbType.VarChar, 50);
            SqlParameter parentidoutParameter = new SqlParameter("@parent_id_out ", SqlDbType.VarChar, 50);
            SqlParameter generalidParameter = new SqlParameter("@general_id ", SqlDbType.Int);
            SqlParameter firstnameParameter = new SqlParameter("@firstname", SqlDbType.VarChar,50);
            SqlParameter lastnameParameter = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter nationalityParameter = new SqlParameter("@nationality", SqlDbType.VarChar, 50);
            SqlParameter genderParameter = new SqlParameter("@gender", SqlDbType.VarChar, 7);
            SqlParameter photoParameter = new SqlParameter("@photo", SqlDbType.VarChar, 200);
            SqlParameter religonParameter = new SqlParameter("@religion ", SqlDbType.VarChar, 20);
            SqlParameter phoneParameter = new SqlParameter("@phone ", SqlDbType.VarChar, 50);
            SqlParameter addressParameter = new SqlParameter("@address ", SqlDbType.VarChar, 50);
            SqlParameter generalidoutParameter = new SqlParameter("@general_id_out ", SqlDbType.Int);
            SqlParameter dobidParameter = new SqlParameter("@dob_id ", SqlDbType.Int);
            SqlParameter dayParameter = new SqlParameter("@day ", SqlDbType.Int);
            SqlParameter monthParameter = new SqlParameter("@month ", SqlDbType.Int);
            SqlParameter yearParameter = new SqlParameter("@year ", SqlDbType.Int);
            SqlParameter dobidoutParameter = new SqlParameter("@dob_id_out ", SqlDbType.Int);


            locidParameter.Value = Convert.ToInt32(locationid) + 1;
            countryidParameter.Value = country_id;
            cityidparameter.Value = city_id;
            postalcodeParameter.Value = postalcode;
            locidoutParamter.Direction = ParameterDirection.Output;
            authorizedParameter.Value = GenerateAuthorizedID(username, accountpin.ToString());
            usernameParameter.Value = username;
            passwordParameter.Value = password;
            accountpinParameter.Value = accountpin;
            primaryParameter.Value = primaryemail;
            secondaryParameter.Value = secondaryemail;
            usertypeidParameter.Value = 1;
            logincountParameter.Value = 0;
            lastlogindateParameter.Value = Convert.ToDateTime(Jfunctionparents.GetSystemDate());
            authorizedioutParameter.Direction = ParameterDirection.Output;
            parentidParameter.Value = GenerateParentID(firstname, lastname);
            postdesignationParameter.Value = postdesig;
            cnicnoParameter.Value = nicc;
            officeaddressParameter.Value = officeaddress;
            salaryParameter.Value = salary;
            officenoParameter.Value = officeNo;
          //  studentidParameter.Value = std_id;
            parentidoutParameter.Direction = ParameterDirection.Output;
            generalidParameter.Value = Convert.ToInt32(genaralid) + 1;
            firstnameParameter.Value = firstname;
            lastnameParameter.Value = lastname;
            nationalityParameter.Value = nationality;
            religonParameter.Value = religion;
            phoneParameter.Value = phone;
            addressParameter.Value = address;
            photoParameter.Value = photo;
            genderParameter.Value = gender;
            generalidoutParameter.Direction = ParameterDirection.Output;
            dobidParameter.Value = Convert.ToInt32(dobid)+1;
            dayParameter.Value = Convert.ToInt32(Jfunctionparents.GetSystemDate().Substring(0, 1));
            monthParameter.Value = Convert.ToInt32(Jfunctionparents.GetSystemDate().Substring(2, 2));
            yearParameter.Value = Convert.ToInt32(Jfunctionparents.GetSystemDate().Substring(5, 4));
            dobidoutParameter.Direction = ParameterDirection.Output;

            ////////
            mdata.obj_sqlcommand.Parameters.Add(locidParameter);
            mdata.obj_sqlcommand.Parameters.Add(countryidParameter);
            mdata.obj_sqlcommand.Parameters.Add(cityidparameter);
            mdata.obj_sqlcommand.Parameters.Add(postalcodeParameter);
            mdata.obj_sqlcommand.Parameters.Add(locidoutParamter);
            mdata.obj_sqlcommand.Parameters.Add(authorizedParameter);
            mdata.obj_sqlcommand.Parameters.Add(usernameParameter);
            mdata.obj_sqlcommand.Parameters.Add(passwordParameter); 
            mdata.obj_sqlcommand.Parameters.Add(primaryParameter);
            mdata.obj_sqlcommand.Parameters.Add(secondaryParameter);
            mdata.obj_sqlcommand.Parameters.Add(accountpinParameter);
            mdata.obj_sqlcommand.Parameters.Add(usertypeidParameter);
            mdata.obj_sqlcommand.Parameters.Add(logincountParameter);
            mdata.obj_sqlcommand.Parameters.Add(lastlogindateParameter);
            mdata.obj_sqlcommand.Parameters.Add(authorizedioutParameter);
            mdata.obj_sqlcommand.Parameters.Add(parentidParameter);
            mdata.obj_sqlcommand.Parameters.Add(postdesignationParameter);
            mdata.obj_sqlcommand.Parameters.Add(cnicnoParameter);
            mdata.obj_sqlcommand.Parameters.Add(officeaddressParameter);
            mdata.obj_sqlcommand.Parameters.Add(salaryParameter);
            mdata.obj_sqlcommand.Parameters.Add(officenoParameter);
          //  mdata.obj_sqlcommand.Parameters.Add(studentidParameter);
            mdata.obj_sqlcommand.Parameters.Add(parentidoutParameter);
            mdata.obj_sqlcommand.Parameters.Add(generalidParameter);
            mdata.obj_sqlcommand.Parameters.Add(firstnameParameter);
            mdata.obj_sqlcommand.Parameters.Add(lastnameParameter);     
            mdata.obj_sqlcommand.Parameters.Add(nationalityParameter);
            mdata.obj_sqlcommand.Parameters.Add(religonParameter);
            mdata.obj_sqlcommand.Parameters.Add(genderParameter);
            mdata.obj_sqlcommand.Parameters.Add(photoParameter);
            mdata.obj_sqlcommand.Parameters.Add(phoneParameter);
            mdata.obj_sqlcommand.Parameters.Add(addressParameter);
            mdata.obj_sqlcommand.Parameters.Add(generalidoutParameter);
            mdata.obj_sqlcommand.Parameters.Add(dobidParameter);
            mdata.obj_sqlcommand.Parameters.Add(dayParameter);
            mdata.obj_sqlcommand.Parameters.Add(monthParameter);
            mdata.obj_sqlcommand.Parameters.Add(yearParameter);
            mdata.obj_sqlcommand.Parameters.Add(dobidoutParameter);


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
            id.Append(Jfunctionparents.GetSystemDate());
            id.Append("/");
            id.Append(Jfunctionparents.GetSystemDate());
            id.Append("/");
            id.Append(random.Next(3, 10));
            return id.ToString();
        }


        public string Registerparents(int countryId, int cityId, int toInt32, int officeNo, string username, string postdesig, string officeaddress, string salary, string password, string address, string fileName, int accountpin, string primaryemail, string nationality, int gender, string religion, int secondaryemail, string selectedValue, string text, string firstname, string lastname, string designation)
        {
            throw new NotImplementedException();
        }
    }
}