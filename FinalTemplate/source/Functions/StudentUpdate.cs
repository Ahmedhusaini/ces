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
    public class StudentUpdate
    {
        static private Database.Database mydatabse = new Database.Database("ces");

        //view student profile

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
        public string u_gurdianname { get; set; }
        public string u_previousschool { get; set; }
        public int u_generalid { get; set; }
        public string u_lastclassattend { get; set; }
        public string u_authorizeid { get; set; }
        public string u_schoolid { get; set; }
        public string u_gurdiancontact { get; set; }
        public string u_stdid { get; set; }
        public string u_username { get; set; }
        public string u_primaryemail { get; set; }
        public string u_secondaryemail { get; set; }

        public string updatestudent(string _stdid)
        {
            string returnvalue = "true";
            if (_stdid != null)
            {
                string[] teacheridToBeFiltered = { _stdid };
                if (Jvalidate.FilterBlackLIstKeywords(teacheridToBeFiltered))
                {
                    string securestudentid = Jvalidate.RemoveHtmlTags( _stdid.ToString());
                    mydatabse.CreateConnection();
                    mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "select * from View_StudentProfile where authorized_id='" + CurrentUser.AuthorizedID + "';");
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
                                u_gurdianname = mydatabse.obj_reader["Guardian_Name"].ToString();
                                u_previousschool = mydatabse.obj_reader["Previous_school"].ToString();
                                u_generalid = Convert.ToInt32(mydatabse.obj_reader["General_Id"]);
                                u_lastclassattend = mydatabse.obj_reader["last_class_attended"].ToString();
                                u_authorizeid = mydatabse.obj_reader["authorized_id"].ToString();
                                u_schoolid = mydatabse.obj_reader["school_id"].ToString();
                                u_gurdiancontact = mydatabse.obj_reader["gurdian_contact"].ToString();
                                u_stdid = mydatabse.obj_reader["Std_id"].ToString();
                              
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

    }
}