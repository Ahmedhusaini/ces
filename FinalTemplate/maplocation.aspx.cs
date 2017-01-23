using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace FinalTemplate
{
    public partial class maplocation : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ConvertDataTabletoString();
        }
        public string ConvertDataTabletoString()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("select title=ml_id,lat=latitude,lng=longitude,school_name from View_locationmap", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }
                    return serializer.Serialize(rows);
                }
            }
        }
    }
}