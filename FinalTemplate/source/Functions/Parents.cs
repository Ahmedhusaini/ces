using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace FinalTemplate.source.Functions
{
    public class Parents 

    {
        static private Database.Database mydatabse = new Database.Database("cesConnectionString3");

        static public string std_id { get; set; }

        static public string authorized { get; set; }

        static public string Firstname { get; set; }
        static public string Lastname { get; set; }
        static public string Gender { get; set; }

        static public string Guardianname { get; set; }
        static public string Schoolname { get; set; }
        static public string schooltype { get; set; }

        static public string sclass { get; set; }
        static public string section { get; set; }
      

        static public void GetChildDetails(string _authorizedid)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "parents_child", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_authrizedID = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_authrizedID.Value = _authorizedid;
                mydatabse.obj_sqlcommand.Parameters.Add(p_authrizedID);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        std_id = mydatabse.obj_reader["Std_id"].ToString();
                       
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

        static public void childern(string child)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "spchild", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter childern = new SqlParameter("@Std_id", SqlDbType.VarChar, 50);
                childern.Value = child;
                mydatabse.obj_sqlcommand.Parameters.Add(childern);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        
                        Firstname = mydatabse.obj_reader["firstname"].ToString();
                        Lastname = mydatabse.obj_reader["lastname"].ToString();
                        Gender = mydatabse.obj_reader["Gender"].ToString();
                        Guardianname = mydatabse.obj_reader["Guardian_Name"].ToString();
                        Schoolname = mydatabse.obj_reader["school_name"].ToString();
                        schooltype = mydatabse.obj_reader["school_type"].ToString();
                        sclass = mydatabse.obj_reader["class"].ToString();
                        section = mydatabse.obj_reader["section"].ToString();

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