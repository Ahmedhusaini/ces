using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using System.Data;

namespace FinalTemplate
{
    public partial class Attendance_Student : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        SqlConnection con = new SqlConnection(@"Data Source=ABBASI\JAHANGEER;Initial Catalog=ces;Persist Security Info=True;User ID=sa;Password=159abbasi789");
        SqlConnection con1 = new SqlConnection(@"Data Source=ABBASI\JAHANGEER;Initial Catalog=ces;Persist Security Info=True;User ID=sa;Password=159abbasi789");

        protected void Page_Load(object sender, EventArgs e)
        {
            Label7.Text = DateTime.Now.ToString("yyyy/MM/dd");
            present_();
            absent_();
            total_();
            Label8.Text = student.studentid;
        }

        private void present_()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(remark_id) as totalcount from tbl_student_attendance where remark_id=1 and Std_id='" + student.studentid + "' and school_id='" + student.s_schoolid + "'", con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            present.Text = ds.Tables[0].Rows[0]["totalcount"].ToString() + " Days Present ";
        }

        private void absent_()
        {
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("select count(remark_id) as totalcount1 from tbl_student_attendance where remark_id=2 and Std_id='" + student.studentid + "' and school_id='" + student.s_schoolid + "'", con1);
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            con1.Close();
            absent.Text = ds1.Tables[0].Rows[0]["totalcount1"].ToString() + " Days Absent ";
        }

        private void total_()
        {
            con1.Open();
            SqlCommand cmd2 = new SqlCommand("select count(remark_id) as totalcount2 from tbl_student_attendance where Std_id='" + student.studentid + "' and school_id='" + student.s_schoolid + "'", con1);
            SqlDataAdapter da2 = new SqlDataAdapter();
            da2.SelectCommand = cmd2;
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            con1.Close();
            total.Text = ds2.Tables[0].Rows[0]["totalcount2"].ToString() + " Total Days ";
        }        
    }
}