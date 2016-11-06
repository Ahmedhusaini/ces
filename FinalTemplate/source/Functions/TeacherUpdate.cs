using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using FinalTemplate.source.Database;
using FinalTemplate.source.Validation;

namespace FinalTemplate.source.Functions
{
    public class TeacherUpdate
    {
        static private Database.Database mydatabse = new Database.Database("ces");

        //view teacher profile

        public string u_firstname { get; set; }
        public string u_lastname { get; set; }
        public int u_dobid { get; set; }
        public int u_day { get; set; }
        public int u_month { get; set; }
        public int u_year { get; set; }
        public string u_nationality { get; set; }
        public string u_gender { get; set; }
        public string u_photo { get; set; }
        public string u_religion { get; set; }
        public string u_phone { get; set; }
        public string u_address { get; set; }
        public int u_locid { get; set; }
        public int u_postalcode { get; set; }
        public string u_class { get; set; }
        public string u_section { get; set; }
        public int u_sectionid { get; set; }
        public int u_classid { get; set; }
        public int u_classsectioninfoid { get; set; }
        public string u_city { get; set; }       
        public string u_dateofjoin { get; set; }
        public string u_cnicno { get; set; }
        public int u_generalid { get; set; }        
        public string u_authorizeid { get; set; }
        public string u_schoolid { get; set; }
        public int u_teacherid { get; set; }
        public string u_username { get; set; }
        public string u_primaryemail { get; set; }
        public string u_secondaryemail { get; set; }

        public string updatestudent(int _teacherid)
        {
            string returnvalue = "true";
            if (_teacherid != null)
            {
                string[] teacheridToBeFiltered = { _teacherid.ToString() };
                if (Jvalidate.FilterBlackLIstKeywords(teacheridToBeFiltered))
                {
                    string securestudentid = Jvalidate.RemoveHtmlTags(_teacherid.ToString());
                    mydatabse.CreateConnection();
                    mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "select * from View_TeacherProfile where authorized_id='" + CurrentUser.AuthorizedID + "';");
                    try
                    {
                        mydatabse.OpenConnection();
                        mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                        if (mydatabse.obj_reader.HasRows)
                        {
                            while (mydatabse.obj_reader.Read())
                            {
                                u_firstname = mydatabse.obj_reader["firstname"].ToString();
                                u_lastname = mydatabse.obj_reader["lastname"].ToString();
                                u_dobid = Convert.ToInt32(mydatabse.obj_reader["dob_id"]);
                                u_day = Convert.ToInt32(mydatabse.obj_reader["day"]);
                                u_month = Convert.ToInt32(mydatabse.obj_reader["month"]);
                                u_year = Convert.ToInt32(mydatabse.obj_reader["year"]);
                                u_nationality = mydatabse.obj_reader["Nationality"].ToString();
                                u_gender = mydatabse.obj_reader["Gender"].ToString();
                                u_religion = mydatabse.obj_reader["religion"].ToString();
                                u_photo = mydatabse.obj_reader["photo"].ToString();
                                u_phone = mydatabse.obj_reader["phone"].ToString();
                                u_address = mydatabse.obj_reader["address"].ToString();
                                u_locid = Convert.ToInt32(mydatabse.obj_reader["loc_id"]);
                                u_postalcode = Convert.ToInt32(mydatabse.obj_reader["postal_code"]);
                                u_class = mydatabse.obj_reader["class"].ToString();
                                u_section = mydatabse.obj_reader["section"].ToString();
                                u_sectionid = Convert.ToInt32(mydatabse.obj_reader["section_id"]);
                                u_classid = Convert.ToInt32(mydatabse.obj_reader["class_id"]);
                                u_classsectioninfoid = Convert.ToInt32(mydatabse.obj_reader["class_sec_info_id"]);
                                u_city = mydatabse.obj_reader["city"].ToString();
                                u_dateofjoin = mydatabse.obj_reader["date_of_join"].ToString();
                                u_cnicno = mydatabse.obj_reader["cnic_no"].ToString();
                                u_generalid = Convert.ToInt32(mydatabse.obj_reader["General_Id"]);
                                u_authorizeid = mydatabse.obj_reader["authorized_id"].ToString();
                                u_schoolid = mydatabse.obj_reader["school_id"].ToString();
                                u_teacherid =Convert.ToInt32( mydatabse.obj_reader["teacher_id"]);
                                u_username = mydatabse.obj_reader["username"].ToString();
                                u_primaryemail = mydatabse.obj_reader["primary_email"].ToString();
                                u_secondaryemail = mydatabse.obj_reader["secondary_email"].ToString();
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
                        mydatabse.CloseConnection();
                        mydatabse.obj_reader.Dispose();
                        mydatabse.obj_reader.Close();
                    }
                }
            }

            return returnvalue;
        }

        public string Updateacherdetail(int general_id, string firstname, string lastname, string nationality, string gender, string phone,
                                          string religion, string address, int dob_id, string _dateofbirth, int teacher_id, string date_of_join,
                                          string cnic_no, int loc_id, int city_id,int postal_code, string authorized_id, string username,
                                          string primary_email, string secoundary_email)
        {
            string formatedDateofJoin = Convert.ToDateTime(date_of_join).ToString("d");
            string returnvalue = string.Empty;
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_Update_TeacherInformation", true);

            SqlParameter t_general_id = new SqlParameter("@general_id", SqlDbType.Int);
            SqlParameter t_firstname = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
            SqlParameter t_lastname = new SqlParameter("@lastname", SqlDbType.VarChar, 50);
            SqlParameter t_dob_id = new SqlParameter("@dob_id", SqlDbType.Int);
            SqlParameter t_nationality = new SqlParameter("@nationality", SqlDbType.VarChar, 15);
            SqlParameter t_gender = new SqlParameter("@gender", SqlDbType.VarChar, 7);
            SqlParameter t_religion = new SqlParameter("@religion", SqlDbType.VarChar, 20);
            SqlParameter t_phone = new SqlParameter("@phone", SqlDbType.VarChar, 50);
            SqlParameter t_address = new SqlParameter("@address", SqlDbType.VarChar, 50);
            SqlParameter t_locid = new SqlParameter("@loc_id", SqlDbType.Int);
            SqlParameter t_day = new SqlParameter("@day", SqlDbType.Int);
            SqlParameter t_month = new SqlParameter("@month", SqlDbType.Int);
            SqlParameter t_year = new SqlParameter("@year", SqlDbType.Int);
            SqlParameter t_teacherid = new SqlParameter("@teacher_id", SqlDbType.Int);
            SqlParameter t_dateofjoin = new SqlParameter("@date_of_join", SqlDbType.Date);
            SqlParameter t_cnicno = new SqlParameter("@cnic_no", SqlDbType.VarChar, 20);
            SqlParameter t_cityid = new SqlParameter("@city_id", SqlDbType.Int);
            SqlParameter t_postalcode = new SqlParameter("@postal_code", SqlDbType.Int);
            SqlParameter t_authorizedid = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
            SqlParameter t_username = new SqlParameter("@username", SqlDbType.VarChar, 50);
            SqlParameter t_primaryemail = new SqlParameter("@primary_email", SqlDbType.VarChar, 50);
            SqlParameter t_secondaryemail = new SqlParameter("@secondary_email", SqlDbType.VarChar, 50);

            t_general_id.Value = general_id;
            t_firstname.Value = firstname;
            t_lastname.Value = lastname;
            t_dob_id.Value = dob_id;
            t_nationality.Value = nationality;
            t_gender.Value = gender;
            t_religion.Value = religion;
            t_phone.Value = phone;
            t_address.Value = address;
            t_locid.Value = loc_id;
            t_day.Value = Convert.ToInt32(_dateofbirth.Substring(0, 2));
            t_month.Value = Convert.ToInt32(_dateofbirth.Substring(3, 2));
            t_year.Value = Convert.ToInt32(_dateofbirth.Substring(_dateofbirth.Length - 4, 4));
            t_teacherid.Value = teacher_id;
            t_dateofjoin.Value = formatedDateofJoin;
            t_cnicno.Value = cnic_no;
            t_postalcode.Value = postal_code;
            t_cityid.Value = city_id;
            t_authorizedid.Value = authorized_id;
            t_username.Value = username;
            t_primaryemail.Value = primary_email;
            t_secondaryemail.Value = secoundary_email;

            mydatabse.obj_sqlcommand.Parameters.Add(t_general_id);
            mydatabse.obj_sqlcommand.Parameters.Add(t_firstname);
            mydatabse.obj_sqlcommand.Parameters.Add(t_lastname);
            mydatabse.obj_sqlcommand.Parameters.Add(t_dob_id);
            mydatabse.obj_sqlcommand.Parameters.Add(t_nationality);
            mydatabse.obj_sqlcommand.Parameters.Add(t_gender);
            mydatabse.obj_sqlcommand.Parameters.Add(t_religion);
            mydatabse.obj_sqlcommand.Parameters.Add(t_phone);
            mydatabse.obj_sqlcommand.Parameters.Add(t_address);
            mydatabse.obj_sqlcommand.Parameters.Add(t_locid);
            mydatabse.obj_sqlcommand.Parameters.Add(t_day);
            mydatabse.obj_sqlcommand.Parameters.Add(t_month);
            mydatabse.obj_sqlcommand.Parameters.Add(t_year);
            mydatabse.obj_sqlcommand.Parameters.Add(t_teacherid);
            mydatabse.obj_sqlcommand.Parameters.Add(t_dateofjoin);
            mydatabse.obj_sqlcommand.Parameters.Add(t_cnicno);
            mydatabse.obj_sqlcommand.Parameters.Add(t_cityid);
            mydatabse.obj_sqlcommand.Parameters.Add(t_postalcode);
            mydatabse.obj_sqlcommand.Parameters.Add(t_authorizedid);
            mydatabse.obj_sqlcommand.Parameters.Add(t_username);
            mydatabse.obj_sqlcommand.Parameters.Add(t_primaryemail);
            mydatabse.obj_sqlcommand.Parameters.Add(t_secondaryemail);
            try
            {
                mydatabse.OpenConnection();
                if (mydatabse.obj_sqlcommand.ExecuteNonQuery() > 0)
                    return "true";
                else
                    return "false";
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabse.CloseConnection();
                mydatabse.obj_sqlcommand.Dispose();
            }
            return returnvalue;
        }
    }
}