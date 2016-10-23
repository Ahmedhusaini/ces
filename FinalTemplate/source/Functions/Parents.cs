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

        static public string parentschild { get; set; }

        static public string authorized { get; set; }

        static public string Firstname { get; set; }
        static public string Lastname { get; set; }
        static public string Gender { get; set; }

        static public string Guardianname { get; set; }
        static public string Schoolname { get; set; }
        static public string schooltype { get; set; }

        static public string sectionn { get; set; }

        public static string contactprimary { get; set; }
        static public string Phone { get; set; }
        static public string sclass { get; set; }
        static public string section { get; set; }
        static public string photo { get; set; }
      

        static public void GetChildDetails(string parentsid)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "select std_id from [tbl_P&S_relation] where Parent_ID ='"+Parents.parentschild+"';");
            try
            {
                mydatabse.OpenConnection();
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
                SqlParameter childern = new SqlParameter("@Parent_ID ", SqlDbType.VarChar, 50);
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

         static public void child_id(string firstname)
         {
             mydatabse.CreateConnection();
             mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "get_child_id", true);
             try
             {
                 mydatabse.OpenConnection();
                 SqlParameter child = new SqlParameter("@firstname", SqlDbType.VarChar, 50);
                 child.Value = firstname;
                 mydatabse.obj_sqlcommand.Parameters.Add(child);
                 mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                 if (mydatabse.obj_reader.HasRows)
                 {
                     int totalRows = mydatabse.obj_reader.RecordsAffected;
                     while (mydatabse.obj_reader.Read())
                     {
                         std_id = mydatabse.obj_reader["std_id"].ToString();
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
 
        static public void child_detail(string student_id)
         {
             mydatabse.CreateConnection();
             mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "sp_GetDetailChild", true);
             try
             {
                 mydatabse.OpenConnection();
                 SqlParameter child = new SqlParameter("@Std_id", SqlDbType.VarChar, 50);
                 child.Value = student_id;
                 mydatabse.obj_sqlcommand.Parameters.Add(child);
                 mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader(); 
                 if (mydatabse.obj_reader.HasRows)
                 {
                     int totalRows = mydatabse.obj_reader.RecordsAffected; 
                     while (mydatabse.obj_reader.Read())
                     {
                         Firstname = mydatabse.obj_reader["firstname"].ToString();
                         Lastname = mydatabse.obj_reader["lastname"].ToString();
                         sclass = mydatabse.obj_reader["class"].ToString();
                         sectionn = mydatabse.obj_reader["section"].ToString();
                         Gender = mydatabse.obj_reader["Gender"].ToString();
                         Phone = mydatabse.obj_reader["phone"].ToString();
                         Schoolname = mydatabse.obj_reader["school_name"].ToString();
                         //schooltypee = mydatabse.obj_reader["school_type "].ToString();
                         contactprimary  = mydatabse.obj_reader["contact_primary"].ToString();
                         photo = mydatabse.obj_reader["photo"].ToString();



                     }
                 }
                 else
                 {
                     HttpContext.Current.Response.Write("No records");
                 }
             }
             catch(Exception ex)
             {
                 HttpContext.Current.Response.Write(ex.ToString());
             }
             finally
             {
                 mydatabse.CloseConnection();
                 mydatabse.obj_reader.Close();
             }
         }
 
 
 
         

        static public void GetParentsID(string autho)
        {
            mydatabse.CreateConnection();
            mydatabse.InitializeSQLCommandObject(mydatabse.GetCurrentConnection, "GetParentid", true);
            try
            {
                mydatabse.OpenConnection();
                SqlParameter p_autho = new SqlParameter("@authorized_id", SqlDbType.VarChar, 20);
                p_autho.Value = autho;
                mydatabse.obj_sqlcommand.Parameters.Add(p_autho);
                mydatabse.obj_reader = mydatabse.obj_sqlcommand.ExecuteReader();
                if (mydatabse.obj_reader.HasRows)
                {
                    int totalRows = mydatabse.obj_reader.RecordsAffected;
                    while (mydatabse.obj_reader.Read())
                    {
                        parentschild = mydatabse.obj_reader["Parent_ID"].ToString();

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