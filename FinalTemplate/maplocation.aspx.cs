using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class maplocation : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            MapMaper();
        }

        public string MapMaper()
        {
            Database database = new Database("ces");
            DataTable table = new DataTable();
            database.CreateConnection();
            database.InitializeSQLCommandObject(database.GetCurrentConnection, "select title=ml_id,lng=longitude,lat=latitude,school_name from View_locationmap");
            //database.OpenConnection();
            database.obj_adapter = new SqlDataAdapter();
            database.obj_adapter.SelectCommand = database.obj_sqlcommand;
            database.obj_adapter.Fill(table);
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow drRow in table.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in table.Columns)
                {
                            row.Add(col.ColumnName,drRow[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        
    }
}