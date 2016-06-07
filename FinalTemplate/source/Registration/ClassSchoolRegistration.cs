using System;
using System.Data;
using System.Data.SqlClient;

namespace FinalTemplate.source.Registration
{
    public class ClassSchoolRegistration
    {
        private Database.Database myDatabase = new Database.Database("Data Source=JAHANGEER;Initial Catalog=ces;Persist Security Info=True;User ID=sa;Password=159abbasi789");
        public void RegisterSchool(int country_id, int city_id, string postalcode)
        {
            myDatabase.obj_sqlconnection.ConnectionString = myDatabase.GetCurrentConnection.ToString();
            myDatabase.obj_sqlcommand.CommandType = CommandType.StoredProcedure;
            myDatabase.obj_sqlcommand.CommandText = "spRegisterSchool";

            myDatabase.obj_sqlparameter = new SqlParameter[4];
            //setting the names for output parameters
            myDatabase.obj_sqlparameter[0].ParameterName = "@location_id_out";
            myDatabase.obj_sqlparameter[1].ParameterName = "authorized_id_out";
            myDatabase.obj_sqlparameter[2].ParameterName = "school_id_out";
            myDatabase.obj_sqlparameter[3].ParameterName = "campus_id";
            //setting the direction of the parameters
            myDatabase.obj_sqlparameter[0].Direction = ParameterDirection.Output;//location id
            myDatabase.obj_sqlparameter[1].Direction = ParameterDirection.Output;//authorized id
            myDatabase.obj_sqlparameter[2].Direction = ParameterDirection.Output;//school id
            myDatabase.obj_sqlparameter[3].Direction = ParameterDirection.Output;//campus id
            //setting the datatype for each parameter
            myDatabase.obj_sqlparameter[0].SqlDbType = SqlDbType.Int;//location id
            myDatabase.obj_sqlparameter[1].SqlDbType = SqlDbType.VarChar;
            myDatabase.obj_sqlparameter[1].Size = 20;
            myDatabase.obj_sqlparameter[2].SqlDbType = SqlDbType.VarChar;
            myDatabase.obj_sqlparameter[2].Size = 50;
            myDatabase.obj_sqlparameter[3].SqlDbType = SqlDbType.VarChar;
            myDatabase.obj_sqlparameter[3].Size = 50;
            //adding the parameters to sql command object
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[0]);
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[1]);
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[2]);
            myDatabase.obj_sqlcommand.Parameters.Add(myDatabase.obj_sqlparameter[3]);
            //adding intput parameters to the sql command object
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@location_id", myDatabase.GetLastValueByColumnName("loc_id", "tbl_location")));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@country_id", myDatabase.GetLastValueByColumnName("country_id", "tbl_country")));
            myDatabase.obj_sqlcommand.Parameters.Add(new SqlParameter("@city_id", myDatabase.GetLastValueByColumnName("city_id", "tbl_city")));

            try
            {


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}