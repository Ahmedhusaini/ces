using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class teacher
    {
        static private Database.Database mydatabse = new Database.Database("ces");
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
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "GetTeacherID", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = teacherid;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        teacherid = mydatabse.obj_reader["teacher_id"].ToString();
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
                mydatabse.CloseConnection();
                mydatabse.obj_reader.Close();
            }
        }
        static public void Teacher_detail(string com_stu)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "Teacher_detail", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = com_stu;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        teacher_class = mydatabse.obj_reader["class"].ToString();
                        teacher_section = mydatabse.obj_reader["section"].ToString();
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
                mydatabse.CloseConnection();
                mydatabse.obj_reader.Close();
            }
        }
    }
}