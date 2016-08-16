using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FinalTemplate
{
    public partial class parentpanel1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cesConnectionString3"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
              
                
                //searchbox.Visible = true; // show button
                //GridView1.Visible = false;    // hide grid

            }

        }

        protected void Unnamed1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {



            string str = "select firstname tbl_general where '"+searchbox.Text+"'";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.Parameters.Add("@search", SqlDbType.NVarChar).Value = searchbox.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds, "firstname");
            GridView3.DataSource = ds;
            GridView3.DataBind();
            con.Close();


        }

        protected void searchbox_TextChanged(object sender, EventArgs e)
        {
                

        }

     

        
    }
}