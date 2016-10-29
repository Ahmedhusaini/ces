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
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;


namespace FinalTemplate
{
    public partial class studentpanel1 : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        SqlConnection con = new SqlConnection(@"Data Source=SHAHWAIZ\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "DATE :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "TIME :" + System.DateTime.Now.ToLongTimeString();
            //if (!IsPostBack)
            //{
            //    if (Session["userid"] != null)
            //    {
            //        namelab.Text = "Your User ID: " + Session["userid"].ToString();
            //    }
            //    else
            //    {
            //        Response.Redirect("~/Default.aspx");
            //    }
            //}
            if (Session["userid"] != null)
            {
                string[] col = { "General_Id" };
                string[] colwhere = { "authorized_id" };
                string[] whereoperator = { "=" };
                string[] multiwhere = { "" };

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };
                string[,] studentid = myDatabase.SelectQuery("tbl_Student_Reg", col, colwhere, whereoperator, whereoperatorvale, multiwhere);
                CurrentUser.GetPersonalDetails(Convert.ToInt32(studentid[0, 0]));
                if (Label2 != null)
                {
                    Label2.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                }
                student.GetstudentlDetails(Session["userid"].ToString());
                namelab.Text = CurrentUser.AuthorizedID.ToString();
                lab3.Text = CurrentUser.GeneralID.ToString();
                Label3.Text = student.studentid;
                student.Complete_Detail_Of_Student(Session["userid"].ToString());
                Label4.Text = student.s_class;
                Label5.Text = student.s_section;
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//images//" + filename);
                    string filepath = Server.MapPath(@"~\images\" + filename.ToString());
                    string fullfilepath = filepath + filename;
                    string extension = Path.GetExtension(filename);
                    Label1.Text = filepath;
                    int filesize = FileUpload1.PostedFile.ContentLength / 1024;
                    int i = 0;
                    if (extension == ".jpg" || extension == ".png")
                    {
                        if (filesize > 5000)
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
                    SqlCommand cmd = new SqlCommand("update tbl_general set photo='" + path + "' where General_Id='"+lab3.Text+"'", con);
                    shah.ImageUrl = @"~\images\" + FileUpload1.FileName;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "upload";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = (ex.Message);
            }
        }

        protected void clas(object sender, EventArgs e)
        {
            
        }
    }
}