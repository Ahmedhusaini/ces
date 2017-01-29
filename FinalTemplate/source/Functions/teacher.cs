using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class teacher
    {
        static private Database.Database mydatabase = new Database.Database("ces");
        static public string teacherid { get; set; }
        static public int generalid { get; set; }
        static public int username { get; set; }
        static public int classsecinfoid { get; set; }
        static public string authorizedid { get; set; }
        static public string schoolid { get { return TeacherSchoolID(); } }
        static public string teacher_class { get; set; }
        static public string teacher_section { get; set; }

        private static string TeacherSchoolID()
        {
            string returnSchoolID = string.Empty;
            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select school_id from tbl_teacher where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        returnSchoolID = mydatabase.obj_reader["school_id"].ToString();
                    }
                }
            }
            catch (Exception ex)
            { HttpContext.Current.Response.Write(ex.ToString()); }
            finally { mydatabase.CloseConnection(); mydatabase.obj_reader.Close(); mydatabase.obj_reader.Dispose(); }
            return returnSchoolID;
        }

        static public void GetTeacherlDetails(string teacherid)
        {
            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "GetTeacherID", true);
            try
            {
                mydatabase.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = teacherid;
                mydatabase.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    int totalRows = mydatabase.obj_reader.RecordsAffected;
                    while (mydatabase.obj_reader.Read())
                    {
                        teacherid = mydatabase.obj_reader["teacher_id"].ToString();
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No records");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Close();
            }
        }




        static public void Teacher_detail(string com_stu)
        {
            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "Teacher_detail", true);
            try
            {
                mydatabase.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = com_stu;
                mydatabase.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    int totalRows = mydatabase.obj_reader.RecordsAffected;
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_class = mydatabase.obj_reader["class"].ToString();
                        teacher_section = mydatabase.obj_reader["section"].ToString();
                    }
                }
                else
                {
                    HttpContext.Current.Response.Write("No records");
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Close();
            }
        }
        public static string teacher_id

        { get { return GetTeacherid(); } }


        private static string GetTeacherid()
        {
            string teacher_id = string.Empty;



            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select teacher_id from tbl_Teacher where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_id = mydatabase.obj_reader["teacher_id"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No Teacher id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return teacher_id;

        }



        public static string class_id
        { get { return Getclassid(); } }

        private static string Getclassid()
        {

            string class_id = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select class_sec_info_id from tbl_teacher where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {

                        class_id = mydatabase.obj_reader["class_sec_info_id"].ToString();
                    }
                }
                else
                { HttpContext.Current.Response.Write("No Teacher id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }

            return class_id;

        }
        public static string student_id

        { get { return Getstudentid(); } }

        public static DataTable AllStudentsBySchoolID(string _schoolid)
        {
            DataTable table = new DataTable();
            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "sp_GetAllStudentsBySchoolID", true);
            mydatabase.obj_sqlcommand.Parameters.AddWithValue("@school_id", SqlDbType.VarChar).Value = _schoolid;
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_adapter.SelectCommand = mydatabase.obj_sqlcommand;
                mydatabase.obj_adapter.Fill(table);
                return table;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
            }
            if (table != null)
                return table;
            else
                return null;

        }

        private static string Getstudentid()
        {
            string student_id = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, " select std_id from tbl_Student_Reg as student inner join tbl_school as school on student.school_id=school.school_id inner join tbl_teacher as teacher on teacher.school_id=school.school_id  where teacher.authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        student_id = mydatabase.obj_reader["std_id"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return student_id;
        }
        public static string teacher_cnic

        { get { return Getcnic(); } }


        private static string Getcnic()
        {
            string teacher_cnic = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select cnic_no from tbl_Teacher where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_cnic = mydatabase.obj_reader["cnic_no"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return teacher_cnic;
        }
        public static string teacher_dateofjoin

        { get { return Getdateofjoin(); } }


        private static string Getdateofjoin()
        {
            string teacher_dateofjoin = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select date_of_join from tbl_Teacher where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_dateofjoin = mydatabase.obj_reader["date_of_join"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return teacher_dateofjoin;
        }
        public static string teacher_dob

        { get { return Getdob(); } }


        private static string Getdob()
        {
            string teacher_dob = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select dob_id from View_TeacherProfile where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_dob = mydatabase.obj_reader["dob_id"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return teacher_dob;
        }
        public static string teacher_Nationality

        { get { return Getnationality(); } }


        private static string Getnationality()
        {
            string teacher_Nationality = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select Nationality from View_TeacherProfile where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_Nationality = mydatabase.obj_reader["Nationality"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return teacher_Nationality;
        }
        public static string teacher_postalcode

        { get { return Getpostalcode(); } }


        private static string Getpostalcode()
        {
            string teacher_postalcode = string.Empty;

            mydatabase.CreateConnection();
            mydatabase.InitializeSQLCommandObject(mydatabase.GetCurrentConnection, "select postal_code from View_TeacherProfile where authorized_id='" + CurrentUser.AuthorizedID + "'");
            try
            {
                mydatabase.OpenConnection();
                mydatabase.obj_reader = mydatabase.obj_sqlcommand.ExecuteReader();
                if (mydatabase.obj_reader.HasRows)
                {
                    while (mydatabase.obj_reader.Read())
                    {
                        teacher_postalcode = mydatabase.obj_reader["postal_code"].ToString();

                    }
                }
                else
                { HttpContext.Current.Response.Write("No id is Found"); }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex.ToString());
            }
            finally
            {
                mydatabase.CloseConnection();
                mydatabase.obj_reader.Dispose();
                mydatabase.obj_reader.Close();
            }
            return teacher_postalcode;
        }

    }
}