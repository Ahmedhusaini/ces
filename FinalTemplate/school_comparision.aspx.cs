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
         //   Jfunctionstudents.BindDropDownList(DropDownList1, "school_name", "school_id", "select * from tbl_school");
           }
    }
}