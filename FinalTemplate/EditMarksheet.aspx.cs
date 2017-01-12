using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace FinalTemplate
{
	public partial class EditMarksheet : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}


        protected void Button1_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/files/") + FileUpload1.FileName);
            }

            DataTable dt = new DataTable();
            dt.Columns.Add("Files", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));

            //foreach(string strfile in Directory.GetFiles(Server.MapPath("~/files/")));
            //{
            //    FileInfo fi = new FileInfo(strfile);
            //    dt.Rows.Add(fi.Name, fi.Length, fi.Extension);

            //}
            GridView1.DataSource = dt;
            GridView1.DataBind();
        } 

        //private string getfiletypebyextension(string extension)
	}
}