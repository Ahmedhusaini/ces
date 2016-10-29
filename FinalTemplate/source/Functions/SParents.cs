using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FinalTemplate.source.Database;
using FinalTemplate.source.Validation;
using FinalTemplate.source.Functions;
using System.Data;
using System.Data.SqlClient;
namespace FinalTemplate.source.Functions
{
    public class SParents
    {
      //  public Database data = new Database("ces");
        public Database.Database data = new Database.Database("ces");

        #region parents

        public int CountryID { get; set; }
        public string Country { get; set; }
        public string ParentID { get; set; }
        public string Post { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Nationality { get; set; }
        public string Gender { get; set; }

        public string Religion { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public int DOBID { get; set; }
        public int LocationID { get; set; }
        public int CityID { get; set; }
        public string City { get; set; }
        public int PostalCode { get; set; }

        public string PrimaryEmail { get; set; }
        public string SecondaryEmail { get; set; }
        public string office_address { get; set; }
        public string office_phone { get; set; }

        public string Salary { get; set; }

        public string username { get; set; }

        public int GeneralID { get; set; }
        public string AuthorizeID { get; set; }

        public string CNIC { get; set; }

        #endregion


        public string showParent(string _ParentID)
        {
            string returnval = "true";
            if (_ParentID != null)
            {
                string[] parentfilter = {_ParentID};
                if (Jvalidate.FilterBlackLIstKeywords(parentfilter))
                {
                    data.CreateConnection();
                    data.InitializeSQLCommandObject(data.GetCurrentConnection,
                        "select * from view_ParentsProfile where Parent_ID ='" + Parents.parentschild + "' ;");
                    try
                    {
                        data.OpenConnection();
                        data.obj_reader = data.obj_sqlcommand.ExecuteReader();
                        if (data.obj_reader.HasRows)
                        {
                            while (data.obj_reader.Read())
                            {
                                ParentID = data.obj_reader["Parent_id"].ToString();
                                GeneralID = Convert.ToInt32(data.obj_reader["general_id"]);
                                FirstName = data.obj_reader["firstname"].ToString();
                                LastName = data.obj_reader["lastname"].ToString();
                                Nationality = data.obj_reader["nationality"].ToString();
                                Gender = data.obj_reader["gender"].ToString();
                                Religion = data.obj_reader["religion"].ToString();
                                Phone = data.obj_reader["phone"].ToString();
                                Address = data.obj_reader["address"].ToString();
                                office_address = data.obj_reader["office_address"].ToString();
                                office_phone = data.obj_reader["Office_no"].ToString();
                                CNIC = data.obj_reader["CNIC_No"].ToString();
                                Post = data.obj_reader["Post_Designation"].ToString();
                                Salary = data.obj_reader["Salary_Anum"].ToString();
                                Day = Convert.ToInt32(data.obj_reader["day"]);
                                Month = Convert.ToInt32(data.obj_reader["month"]);
                                Year = Convert.ToInt32(data.obj_reader["year"]);
                                DOBID = Convert.ToInt32(data.obj_reader["dob_id"]);
                                LocationID = Convert.ToInt32(data.obj_reader["loc_id"]);
                                CityID = Convert.ToInt32(data.obj_reader["city_id"]);
                                City = data.obj_reader["city"].ToString();
                                PostalCode = Convert.ToInt32(data.obj_reader["postal_code"]);
                                PrimaryEmail = data.obj_reader["primary_email"].ToString();
                                SecondaryEmail = data.obj_reader["secondary_email"].ToString();
                                GeneralID = Convert.ToInt32(data.obj_reader["General_Id"]);
                              
                                Country = data.obj_reader["country"].ToString();
                                AuthorizeID = data.obj_reader["authorized_id"].ToString();
                                username = data.obj_reader["username"].ToString();
                                //CountryID = Convert.ToInt32(data.obj_reader["country_id"]);

                            }
                        }
                        else

                            returnval = "false";

                    }
                    catch (Exception ex)
                    {

                        HttpContext.Current.Response.Write(ex.ToString());
                    }
                    finally
                    {
                        data.CloseConnection();
                        data.obj_reader.Dispose();
                        data.obj_reader.Close();
                    }

                }
            }
            return returnval;

        }

        public string UpdateParentInfo(int _generalid, string _officcadd,string _username,string _pemail,
            string _semail,string _autho, string _offino, string _post ,string _sal, string _parentID,int _dobid,
            int _locationid,string _firstname, string _lastname, string _nationality,string _nic,
            string _gender, string _religion, string _phone, string _address, string _dateofbirth,
             int _city_id, int _postal_code)
        {

            string returnval = string.Empty;
            data.CreateConnection();
            data.InitializeSQLCommandObject(data.GetCurrentConnection, "spUpdateParentInformation",true);

            SqlParameter p_general_id = new SqlParameter("@general_id",SqlDbType.Int);
            SqlParameter p_parent_id = new SqlParameter("@Parent_id",SqlDbType.VarChar,50);
            SqlParameter p_firstname = new SqlParameter("@firstname ",SqlDbType.VarChar,50);
            SqlParameter p_lastname = new SqlParameter("@lastname",SqlDbType.VarChar,50);
            SqlParameter p_nationality = new SqlParameter("@nationality",SqlDbType.VarChar,50);
            SqlParameter p_gender = new SqlParameter("@gender",SqlDbType.VarChar,7);
            SqlParameter p_religion = new SqlParameter("@religion",SqlDbType.VarChar,20);
            SqlParameter p_phone = new SqlParameter("@phone",SqlDbType.VarChar,50);
            SqlParameter p_address = new SqlParameter("@address",SqlDbType.VarChar,50); 
             SqlParameter p_offadd = new SqlParameter("@office_address",SqlDbType.VarChar,50); 
             SqlParameter p_offno = new SqlParameter("@Office_no",SqlDbType.VarChar,50); 
            SqlParameter p_post = new SqlParameter("@Post_Designation",SqlDbType.VarChar,50); 
            SqlParameter p_sal = new SqlParameter("@Salary_Anum",SqlDbType.VarChar,50);
            SqlParameter p_nic = new SqlParameter("@CNIC_No",SqlDbType.VarChar,20);
             SqlParameter p_dob_id = new SqlParameter("@dob_id",SqlDbType.Int);
             SqlParameter p_day = new SqlParameter("@day",SqlDbType.Int);
             SqlParameter p_month = new SqlParameter("@month",SqlDbType.Int);
             SqlParameter p_year = new SqlParameter("@year", SqlDbType.Int);
             SqlParameter p_loc_id = new SqlParameter("@loc_id",SqlDbType.Int);
          
             SqlParameter p_city_id = new SqlParameter("@city_id",SqlDbType.Int);
             SqlParameter p_postal = new SqlParameter("@postal_code",SqlDbType.Int);
            SqlParameter p_autho = new SqlParameter("@authorized_id ",SqlDbType.VarChar,20); 
            SqlParameter p_username = new SqlParameter("@username",SqlDbType.VarChar,50);
              SqlParameter p_pemail = new SqlParameter("@primary_email",SqlDbType.VarChar,50);
            SqlParameter p_semail = new SqlParameter("@secondary_email", SqlDbType.VarChar, 50);

            p_general_id.Value = _generalid;
            p_parent_id.Value = _parentID;
            p_firstname.Value = _firstname;
            p_lastname.Value = _lastname;
            p_nationality.Value = _nationality;
            p_gender.Value = _gender;
            p_religion.Value = _religion;
            p_phone.Value = _phone;
            p_address.Value = _address;
            p_offadd.Value = _officcadd;
            p_offno.Value = _offino;
            p_post.Value = _post;
            p_sal.Value = _sal;
            p_nic.Value = _nic;
            p_dob_id.Value = _dobid;
            p_day.Value= Convert.ToInt32(_dateofbirth.Substring(0, 2));
            p_month.Value = Convert.ToInt32(_dateofbirth.Substring(3, 2));
            p_year.Value = Convert.ToInt32(_dateofbirth.Substring(_dateofbirth.Length - 4, 4));            
            p_loc_id.Value=_locationid;

            p_city_id.Value = _city_id;
            p_postal.Value = _postal_code;
            p_autho.Value = _autho;
            p_username.Value = _username;
            p_pemail.Value = _pemail;
            p_semail.Value = _semail;

            data.obj_sqlcommand.Parameters.Add(p_general_id);
            data.obj_sqlcommand.Parameters.Add(p_parent_id);
            data.obj_sqlcommand.Parameters.Add(p_firstname);
            data.obj_sqlcommand.Parameters.Add(p_lastname);
            data.obj_sqlcommand.Parameters.Add(p_nationality);
            data.obj_sqlcommand.Parameters.Add(p_gender);
            data.obj_sqlcommand.Parameters.Add(p_religion);
            data.obj_sqlcommand.Parameters.Add(p_phone);
            data.obj_sqlcommand.Parameters.Add(p_address);
            data.obj_sqlcommand.Parameters.Add(p_offadd);
            data.obj_sqlcommand.Parameters.Add(p_offno);
            data.obj_sqlcommand.Parameters.Add(p_post);
            data.obj_sqlcommand.Parameters.Add(p_sal);
            data.obj_sqlcommand.Parameters.Add(p_nic);
            data.obj_sqlcommand.Parameters.Add(p_dob_id);
            data.obj_sqlcommand.Parameters.Add(p_day);
            data.obj_sqlcommand.Parameters.Add(p_month);
            data.obj_sqlcommand.Parameters.Add(p_year);
            data.obj_sqlcommand.Parameters.Add(p_loc_id);
            data.obj_sqlcommand.Parameters.Add(p_city_id);
            data.obj_sqlcommand.Parameters.Add(p_postal);
            data.obj_sqlcommand.Parameters.Add(p_autho);
            data.obj_sqlcommand.Parameters.Add(p_username);
            data.obj_sqlcommand.Parameters.Add(p_pemail);
            data.obj_sqlcommand.Parameters.Add(p_semail);

            try
            {
                data.OpenConnection();
                if (data.obj_sqlcommand.ExecuteNonQuery() > 0)
                    returnval = "true";
                else
                    returnval = "false";
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                data.CloseConnection();
                data.obj_sqlcommand.Dispose();
            }
            return returnval;






        }
    }
}
        
        
    


