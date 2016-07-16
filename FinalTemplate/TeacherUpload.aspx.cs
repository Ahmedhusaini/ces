using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  System.IO;


namespace FinalTemplate
{
    public partial class TeacherUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("/files/") + FileUpload1.FileName);
            }
            DataTable d = new DataTable();
            d.Columns.Add("FILE", typeof(string));
            d.Columns.Add("SIZE", typeof(string));
            d.Columns.Add("EXTENSION", typeof(string));
            foreach (string files in Directory.GetFiles(Server.MapPath("/files/")) )
            {
                FileInfo f=new FileInfo(files);
                d.Rows.Add(f.Name, f.Length, f.Extension);
            }
            GridView1.DataSource = d;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
             
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("/files/") + e.CommandArgument);
                Response.End(); 
                }          
           
            else
            {
                Label1.ForeColor=System.Drawing.Color.Red;
                Label1.Text = "FILE NOT FOUND";
            }
        }
       }    
    }
