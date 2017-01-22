﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
	public partial class mark_attendance : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] != null)
            {
                string[] col = { "General_Id" };
                string[] colwhere = { "authorized_id" };
                string[] whereoperator = { "=" };
                string[] multiwhere = { "" };

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };
                string[,] teacherid = myDatabase.SelectQuery("tbl_teacher", col, colwhere, whereoperator, whereoperatorvale, multiwhere);
                CurrentUser.GetPersonalDetails(Convert.ToInt32(teacherid[0, 0]));

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
                string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
                Database db = new Database("ces");
                int std_attend_id = Convert.ToInt32(db.GetLastValueByColumnName("std_attend_id", "tbl_student_attendance"));
                var std_id = Convert.ToString(db.GetLastValueByColumnName("std_id", "tbl_Student_Reg"));

                using (SqlConnection con = new SqlConnection(a))
                { 
                 

                   
                    foreach (GridViewRow g in GridView1.Rows)
                    {
                        if (g.RowType == DataControlRowType.DataRow)
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("sp_Mark_std_attendance", con);
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            string value = ((DropDownList)g.FindControl("remark")).SelectedValue;



                            cmd.Parameters.AddWithValue("@std_id", SqlDbType.VarChar).Value = std_id;
                            cmd.Parameters.AddWithValue("@std_id_out", SqlDbType.VarChar).Direction = ParameterDirection.Output;



                            cmd.Parameters.AddWithValue("@std_attend_id", SqlDbType.Int).Value = std_attend_id + 1;
                            cmd.Parameters.AddWithValue("@std_attend_id_out", SqlDbType.Int).Direction = ParameterDirection.Output;
                            cmd.Parameters.AddWithValue("@date", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                            cmd.Parameters.AddWithValue("@time", SqlDbType.VarChar).Value = DateTime.Now.ToString("");
                            cmd.Parameters.AddWithValue("@day_id", SqlDbType.Int).Value = DropDownList1.SelectedValue;
                            cmd.Parameters.AddWithValue("@month_id", SqlDbType.Int).Value = DropDownList2.SelectedValue;
                            cmd.Parameters.AddWithValue("@remark_id", SqlDbType.Int).Value = value;
                            cmd.Parameters.AddWithValue("@teacher_id", SqlDbType.Int).Value = teacher.teacher_id;


                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }
        }
	}