﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FinalTemplate
{
    public partial class StudentUpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Session.Remove("userid");
            bool sessiongone = (Session["userid"] == null);
            //if (sessiongone)
            //{
            //    Response.Redirect("~/Default.aspx");
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string confstu = ConfigurationManager.ConnectionStrings["cesConnectionString2"].ConnectionString;
                SqlConnection con = new SqlConnection(confstu);
                SqlDataAdapter sda = new SqlDataAdapter("select username,password from tbl_authorized_users where username='" + txt_username1.Text + "' and password='" + change_password.Text + "'", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count.ToString() == "1")
                {
                    if (txt_password.Text == conform_password.Text)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("update tbl_authorized_users set password='" + txt_password.Text + "' where password='" + change_password.Text + "' and username='" + txt_username1.Text + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Label1.Text = "Successfully";
                        Label1.ForeColor = System.Drawing.Color.DarkRed;
                    }
                }
                else
                {
                    Label1.Text = "Please correct the both Password";
                }
            }
            else
            {
                Label1.Text = "UnSuccessfull";
            }
        }
    }
}