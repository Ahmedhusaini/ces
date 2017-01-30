using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class Teacherprofile : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        SqlConnection con = new SqlConnection(@"Data Source=ABBASI\JAHANGEER;Initial Catalog=ces;Integrated Security=True");
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
                    name.Text=CurrentUser.Username;
                    usertype.Text=CurrentUser.UserType;
                    Gender.Text=CurrentUser.Gender;
                    Nationality.Text=CurrentUser.Nationality;
                    Religion.Text=CurrentUser.Religion;
                    Phone.Text=CurrentUser.Phone;
                    Address.Text=CurrentUser.Address;
                    Email.Text=CurrentUser.PrimaryEmailAddress;
                    Email2.Text = CurrentUser.SecondaryEmailAddress;
                    Image1.ImageUrl = "images/teachers/" + CurrentUser.Photo;
                    

                }

                else
                {
                    Response.Redirect("~/Default.aspx");
                }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("images/teachers/"+FileUpload1.FileName));
                    string filepath = Server.MapPath("images/teachers/");
                    string fullfilepath = filepath + filename;
                    string extension = Path.GetExtension(filename);
                    Label1.Text = filepath;
                    int filesize = FileUpload1.PostedFile.ContentLength / 2048;
                    Convert.ToString(filesize);
                    int i = 0;
                    if (extension == ".jpg" || extension == ".png")
                    {
                        if (filesize > 10000)
                        {
                            FileUpload1.SaveAs(fullfilepath);
                            i = 1;
                        }
                        else
                        {
                            Label1.Text = "Filesize Exceed 1MB.";
                        }
                    }
                    con.Open();
                    string path = @"~\images\" + filename.ToString();
                    SqlCommand cmd = new SqlCommand("update tbl_general set photo='" + path + "' where General_Id='" + Label3.Text + "'", con);
                    Image1.ImageUrl = @"~\images\" + FileUpload1.FileName;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "upload";
                }
            }
            catch (Exception ex)
            {
                Response.Write("Make sure your Picture Name is Valid means proper name like 'PICTURE1'");
            }
        }
    }
}
