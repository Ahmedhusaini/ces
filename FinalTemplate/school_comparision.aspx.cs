using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Database;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;

namespace FinalTemplate
{
    public partial class school_comparision : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        SqlConnection con = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (Session["userid"] != null)
            //    {
            //        Response.Redirect("~/Default.aspx");
            //    }
            //}
            Jfunctionstudents.BindDropDownList(DropDownList1, "school_name", "school_id", "select * from tbl_school");
           }

        protected void comp_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = con)
                {
                    SqlCommand command =
                    new SqlCommand("select * from comparison WHERE school_name='" + DropDownList1.SelectedItem + "'", connection);
                    connection.Open();
                    SqlDataReader read = command.ExecuteReader();
                    while (read.Read())
                    {
                        school_name.Text = (read["school_name"].ToString());
                        new1.Text = (read["school_name"].ToString());
                        //CustName.Text = (read["Customer_Name"].ToString());
                        //Add1.Text = (read["Address_1"].ToString());
                        //Add2.Text = (read["Address_2"].ToString());
                        //PostBox.Text = (read["Postcode"].ToString());
                        //PassBox.Text = (read["Password"].ToString());
                        //DatBox.Text = (read["Data_Important"].ToString());
                        //LanNumb.Text = (read["Landline"].ToString());
                        //MobNumber.Text = (read["Mobile"].ToString());
                        //FaultRep.Text = (read["Fault_Report"].ToString());
                    }
                    read.Close();
                }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Convert.ToInt32(DropDownList1.SelectedItem);
            DropDownList1.Items.Insert(0, new ListItem("-Choose school-", "-Choose school-"));   
        }
    }
}