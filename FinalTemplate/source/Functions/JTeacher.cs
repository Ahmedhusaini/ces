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
    public class JTeacher
    {
        public Database.Database mydb = new Database.Database("cesConnectionString");
        #region Properties of teacher
        public int CountryID { get; set; }
        public string Country { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Nationality { get; set; }
        public string Gender { get; set; }
        public string Photo { get; set; }
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
        public string Username { get; set; }
        public string Password { get; set; }
        public int AccountPin { get; set; }
        public string PrimaryEmail { get; set; }
        public string SecondaryEmail { get; set; }
        public int UserTypeID { get; set; }
        public int LoginCount { get; set; }
        public string LastLoginDate { get; set; }
        public string UserType { get; set; }
        public int TeacherID { get; set; }
        public int GeneralID { get; set; }
        public string AuthorizeID { get; set; }
        public string DateOfJoin { get; set; }
        public string CNIC { get; set; }
        public string SchoolID { get; set; }
        #endregion
        public string PopulateTeacherProfileInformationByID(int _teacherID, string _schoolID)
        {
            string returnvalue = "true";
            if (_teacherID != null)
            {
                string[] teacheridToBeFiltered = { _teacherID.ToString(), _schoolID };
                if (Jvalidate.FilterBlackLIstKeywords(teacheridToBeFiltered))
                {
                    string secureTeacherid = Jvalidate.RemoveHtmlTags(_teacherID.ToString());
                    mydb.CreateConnection();
                    mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "select * from View_TeacherProfile where teacher_id=" + _teacherID + " and school_id='" + JSchool.SchoolID + "';");
                    try
                    {
                        mydb.OpenConnection();
                        mydb.obj_reader = mydb.obj_sqlcommand.ExecuteReader();
                        if (mydb.obj_reader.HasRows)
                        {
                            while (mydb.obj_reader.Read())
                            {
                                CountryID = Convert.ToInt32(mydb.obj_reader["country_id"]);
                                Country = mydb.obj_reader["country"].ToString();
                                FirstName = mydb.obj_reader["firstname"].ToString();
                                LastName = mydb.obj_reader["lastname"].ToString();
                                Nationality = mydb.obj_reader["Nationality"].ToString();
                                Gender = mydb.obj_reader["Gender"].ToString();
                                Photo = mydb.obj_reader["photo"].ToString();
                                Religion = mydb.obj_reader["religion"].ToString();
                                Phone = mydb.obj_reader["phone"].ToString();
                                Address = mydb.obj_reader["address"].ToString();
                                Day = Convert.ToInt32(mydb.obj_reader["day"]);
                                Month = Convert.ToInt32(mydb.obj_reader["month"]);
                                Year = Convert.ToInt32(mydb.obj_reader["year"]);
                                DOBID = Convert.ToInt32(mydb.obj_reader["dob_id"]);
                                LocationID = Convert.ToInt32(mydb.obj_reader["loc_id"]);
                                CityID = Convert.ToInt32(mydb.obj_reader["city_id"]);
                                City = mydb.obj_reader["city"].ToString();
                                PostalCode = Convert.ToInt32(mydb.obj_reader["postal_code"]);
                                Username = mydb.obj_reader["username"].ToString();
                                Password = mydb.obj_reader["password"].ToString();
                                AccountPin = Convert.ToInt32(mydb.obj_reader["account_pin"]);
                                PrimaryEmail = mydb.obj_reader["primary_email"].ToString();
                                SecondaryEmail = mydb.obj_reader["secondary_email"].ToString();
                                UserTypeID = Convert.ToInt32(mydb.obj_reader["usertype_id"]);
                                LoginCount = Convert.ToInt32(mydb.obj_reader["login_count"]);
                                LastLoginDate = mydb.obj_reader["last_login_date"].ToString();
                                UserType = mydb.obj_reader["usertype"].ToString();
                                TeacherID = Convert.ToInt32(mydb.obj_reader["teacher_id"]);
                                GeneralID = Convert.ToInt32(mydb.obj_reader["General_Id"]);
                                AuthorizeID = mydb.obj_reader["authorized_id"].ToString();
                                DateOfJoin = mydb.obj_reader["date_of_join"].ToString();
                                CNIC = mydb.obj_reader["cnic_no"].ToString();
                                SchoolID = mydb.obj_reader["school_id"].ToString();
                            }
                        }
                        else
                            returnvalue = "false";
                    }
                    catch (Exception ex)
                    {
                        HttpContext.Current.Response.Write(ex.ToString());
                    }
                    finally
                    {
                        mydb.CloseConnection();
                        mydb.obj_reader.Dispose();
                        mydb.obj_reader.Close();
                    }
                }
            }

            return returnvalue;
        }
        public string UpdateTeacherInformation(int _generalid,int _dobid,int _locationid,int _teacherid,string _firstname, string _lastname, string _nationality, string _gender, string _religion, string _phone, string _address, string _dateofjoin, string _dateofbirth, int _city_id, int _postal_code)
        {
           //string formatedDateofBirth = Convert.ToDateTime(_dateofbirth).ToString("d");
            string formatedDateofJoin = Convert.ToDateTime(_dateofjoin).ToString("d");
            string returnvalue = string.Empty;
            mydb.CreateConnection();
            mydb.InitializeSQLCommandObject(mydb.GetCurrentConnection, "spUpdateTeacherInformationByAdmin", true);
            SqlParameter p_general_id = new SqlParameter("@general_id", SqlDbType.Int);
            SqlParameter P_firstname = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            SqlParameter p_lastname = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter p_dob_id = new SqlParameter("@dob_id", SqlDbType.Int);
            SqlParameter p_nationality = new SqlParameter("@nationality", SqlDbType.VarChar, 15);
            SqlParameter p_gender = new SqlParameter("@gender", SqlDbType.VarChar, 15);
            SqlParameter p_religion = new SqlParameter("@religion", SqlDbType.VarChar, 20);
            SqlParameter p_phone = new SqlParameter("@phone", SqlDbType.VarChar, 50);
            SqlParameter p_address = new SqlParameter("@address", SqlDbType.VarChar, 50);
            SqlParameter p_loc_id = new SqlParameter("@loc_id", SqlDbType.Int);
            SqlParameter p_day = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter p_month = new SqlParameter("@month", SqlDbType.Int);
            SqlParameter p_year = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter p_teacher_id = new SqlParameter("@teacher_id", SqlDbType.Int);
            SqlParameter p_dateofjoin = new SqlParameter("@dateofjoin", SqlDbType.Date);
            SqlParameter p_city_id = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter P_postal_code = new SqlParameter("@postal_code", SqlDbType.Int);

            p_general_id.Value = _generalid;
            P_firstname.Value = _firstname;
            p_lastname.Value = _lastname;
            p_dob_id.Value = _dobid;
            p_nationality.Value = _nationality;
            p_gender.Value = _gender;
            p_religion.Value = _religion;
            p_phone.Value = _phone;
            p_address.Value = _address;
            p_loc_id.Value = _locationid;
            p_day.Value = Convert.ToInt32(_dateofbirth.Substring(0, 2));
            p_month.Value = Convert.ToInt32(_dateofbirth.Substring(3, 2));
            p_year.Value = Convert.ToInt32(_dateofbirth.Substring(_dateofbirth.Length - 4, 4));
            p_teacher_id.Value = _teacherid;
            p_dateofjoin.Value = formatedDateofJoin;
            p_city_id.Value = _city_id;
            P_postal_code.Value = _postal_code;

            mydb.obj_sqlcommand.Parameters.Add(p_general_id);
            mydb.obj_sqlcommand.Parameters.Add(P_firstname);
            mydb.obj_sqlcommand.Parameters.Add(p_lastname);
            mydb.obj_sqlcommand.Parameters.Add(p_dob_id);
            mydb.obj_sqlcommand.Parameters.Add(p_nationality);
            mydb.obj_sqlcommand.Parameters.Add(p_gender);
            mydb.obj_sqlcommand.Parameters.Add(p_religion);
            mydb.obj_sqlcommand.Parameters.Add(p_phone);
            mydb.obj_sqlcommand.Parameters.Add(p_address);
            mydb.obj_sqlcommand.Parameters.Add(p_loc_id);
            mydb.obj_sqlcommand.Parameters.Add(p_day);
            mydb.obj_sqlcommand.Parameters.Add(p_month);
            mydb.obj_sqlcommand.Parameters.Add(p_year);
            mydb.obj_sqlcommand.Parameters.Add(p_teacher_id);
            mydb.obj_sqlcommand.Parameters.Add(p_dateofjoin);
            mydb.obj_sqlcommand.Parameters.Add(p_city_id);
            mydb.obj_sqlcommand.Parameters.Add(P_postal_code);
            try
            {
                mydb.OpenConnection();
                if (mydb.obj_sqlcommand.ExecuteNonQuery() > 0)
                    returnvalue = "true";
                else
                    returnvalue = "false";
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydb.CloseConnection();
                mydb.obj_sqlcommand.Dispose();
            }
            return returnvalue;
        }
    }
}