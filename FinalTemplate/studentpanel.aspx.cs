using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;

namespace FinalTemplate
{
    public partial class studentpanel1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string filename = FileUpload1.FileName;
            string filepath = Server.MapPath("images" + "//");
            string fullfilepath = filepath + filename;
            string extension = Path.GetExtension(filename);
            Label1.Text = filepath;
            int filesize = FileUpload1.PostedFile.ContentLength / 1024;
            int i = 0;
            if (extension == ".jpg" || extension == ".gif")
            {
                if (filesize < 5000)
                {
                    FileUpload1.SaveAs(fullfilepath);
                    i = 1;
                }
                else
                {
                    Label1.Text = "Filesize Exceed 1MB.";
                }
            }
            else
            {
                Label1.Text = extension;
            }
            //if (i == 1)
            //{
            //    Image1.ImageUrl = "~/images/" + filename;

            //}
        }
    }
}