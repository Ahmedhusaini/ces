﻿using System;
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
        SqlConnection con1 = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True");
        string str;
        SqlCommand com;
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


        public void drop()
        {
            SqlConnection con = con1;
            con.Open();
            str = "select * from comparison where school_name='"+DropDownList5.SelectedItem+"'";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            
            reader.Read();
            School_Name.Text = reader["school_name"].ToString();
            
            
            reader.Close();
            con.Close();
            
            con.Open();
            SqlDataReader reader1 = com.ExecuteReader();
            
            reader1.Read();
            pos.Text = reader1["school_type"].ToString();
            
            reader1.Close();
            con.Close();

            con.Open();
            SqlDataReader reader2 = com.ExecuteReader();

            reader2.Read();
            camp.Text = reader2["campus_name"].ToString();

            reader2.Close();
            con.Close();

            con.Open();
            SqlDataReader reader3 = com.ExecuteReader();

            reader3.Read();
            coun.Text = reader3["founded_in"].ToString();

            reader3.Close();
            con.Close();

            con.Open();
            SqlDataReader reader4 = com.ExecuteReader();

            reader4.Read();
            city.Text = reader4["founded_in"].ToString();

            reader4.Close();
            con.Close();

            con.Open();
            SqlDataReader reader5 = com.ExecuteReader();

            reader5.Read();
            reg.Text = reader5["founded_in"].ToString();

            reader5.Close();
            con.Close();

            con.Open();
            SqlDataReader reader6 = com.ExecuteReader();

            reader6.Read();
            adm.Text = reader6["founded_in"].ToString();

            reader6.Close();
            con.Close();

            con.Open();
            SqlDataReader reader7 = com.ExecuteReader();

            reader7.Read();
            sec.Text = reader7["founded_in"].ToString();

            reader7.Close();
            con.Close();

            con.Open();
            SqlDataReader reader8 = com.ExecuteReader();

            reader8.Read();
            ann.Text = reader8["founded_in"].ToString();

            reader8.Close();
            con.Close();

            con.Open();
            SqlDataReader reader9 = com.ExecuteReader();

            reader9.Read();
            tut.Text = reader9["founded_in"].ToString();

            reader9.Close();
            con.Close();

            con.Open();
            SqlDataReader reader10 = com.ExecuteReader();

            reader10.Read();
            found.Text = reader10["founded_in"].ToString();

            reader10.Close();
            con.Close();
        }

        public void drop1()
        {
            SqlConnection con = con1;
            con.Open();
            str = "select * from comparison where school_name='" + DropDownList6.SelectedItem + "'";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();

            reader.Read();
            School_Name1.Text = reader["school_name"].ToString();


            reader.Close();
            con.Close();

            con.Open();
            SqlDataReader reader1 = com.ExecuteReader();

            reader1.Read();
            pos1.Text = reader1["school_type"].ToString();

            reader1.Close();
            con.Close();

            con.Open();
            SqlDataReader reader2 = com.ExecuteReader();

            reader2.Read();
            camp1.Text = reader2["campus_name"].ToString();

            reader2.Close();
            con.Close();

            con.Open();
            SqlDataReader reader3 = com.ExecuteReader();

            reader3.Read();
            found1.Text = reader3["founded_in"].ToString();

            reader3.Close();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            drop();
            drop1();
        }
    }
}