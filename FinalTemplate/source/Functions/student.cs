using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using FinalTemplate.source.Database;

namespace FinalTemplate.source.Functions
{
    public class student
    {
        static private Database.Database mydatabse = new Database.Database("cesConnectionString2");
        static public string studentid { get; set; }
        static public string gurdianname { get; set; }
        static public string previousschool { get; set; }
        static public int generalid { get; set; }
        static public int classsecinfoid { get; set; }
        static public string lastclassattended { get; set; }
        static public string authorizedid { get; set; }
        static public string schoolid { get; set; }
        static public string gurdiancontact { get; set; }

        static public string s_class { get; set; }
        static public string s_section { get; set; }

        static public void GetstudentlDetails(string stdlid)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "GetStudentID", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = stdlid;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        studentid = mydatabse.obj_reader["Std_id"].ToString();
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
        static public void Complete_Detail_Of_Student(string com_stu)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_Complete_Detail_Of_Student", true);
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
                        s_class = mydatabse.obj_reader["class"].ToString();
                        s_section = mydatabse.obj_reader["section"].ToString();
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