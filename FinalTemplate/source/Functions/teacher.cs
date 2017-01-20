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
        static public string schoolid { get; set; }
        static public string teacher_class { get; set; }
        static public string teacher_section { get; set; }

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
    }
}