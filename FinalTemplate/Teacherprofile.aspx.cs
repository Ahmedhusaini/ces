using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class Teacherprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                if((FileUpload1.PostedFile.ContentType=="image/jpeg")||
                (FileUpload1.PostedFile.ContentType=="image/png")||
                (FileUpload1.PostedFile.ContentType=="image/bmp"))
                {
                    if(Convert.ToInt64(FileUpload1.PostedFile.ContentLength) < 1000000)
                    {
                        string folder = Path.Combine("~/images/", User.Identity.Name);
                        if (!Directory.Exists(folder))
                            Directory.CreateDirectory(folder);

                        string extension = Path.GetExtension(FileUpload1.FileName);
                        string uniquefilename = Path.ChangeExtension(FileUpload1.FileName, DateTime.Now.Ticks.ToString());

                        FileUpload1.SaveAs(Path.Combine(folder, uniquefilename + extension));
                        Label1.Text="SUCCESSFULLY UPLOADED" + FileUpload1.FileName;
                    }
                    else
                        Label1.Text = "FILE MUST BE LESS THAN 10 MB";
                }
                    else
                        Label1.Text="FILE MUST BE JPEG,JPG,BMP";
                    }
                   
                   else
                        Label1.Text="NO FILE SELECTED";
               
            }
        }
    }
