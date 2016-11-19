﻿using System;
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
        SqlConnection con = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True");
        SqlConnection con1 = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            Label7.Text = DateTime.Now.ToString("yyyy/MM/dd");
            present_();
            absent_();
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
    }
}