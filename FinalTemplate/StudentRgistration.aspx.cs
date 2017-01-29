using System;
using FinalTemplate.source.Registration;
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
using FinalTemplate.source;


namespace FinalTemplate
{
    public partial class StudentRgistration : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        SqlConnection con = new SqlConnection(@"Data Source=ABBASI\JAHANGEER;Initial Catalog=ces;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
        //    if (Session["userid"] != null)
        //    {
                if (!IsPostBack)
                {
                    Jfunctionstudents.BindDropDownList(DropDownList2, "city", "city_id", "select * from tbl_city");
                    Jfunctionstudents.BindDropDownList(DropDownList3, "class", "class_id", "select * from tbl_class");
                    Jfunctionstudents.BindDropDownList(DropDownList4, "section", "Section_id", "select * from tbl_section");
                    Jfunctionstudents.BindDropDownList(DropDownList5, "school_name", "school_id", "select * from tbl_school");
                }
            //}
            //else
            //{ Response.Redirect("Defult.aspx"); }
        }

        private string EmailBody()
        {
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.Clear();
            stringBuilder.Append("<h1>Welcome to Centeralized Education System - CES</h1>");
            stringBuilder.Append("<p>Pakistan's only education portal which aims to gather education on single online platform for betterment of education.</p>");
            stringBuilder.Append("<h1>Your Account Details</h1>");
            stringBuilder.Append("<h2>Login Details</h2>");
            stringBuilder.Append("<br>");
            stringBuilder.Append("Username:");
            stringBuilder.Append(user.Text);
            stringBuilder.Append(" <br> ");
            stringBuilder.Append("Password:");
            stringBuilder.Append(pass.Text);
            return stringBuilder.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClassStudentRegistration classStudent = new ClassStudentRegistration();
            string result = string.Empty;
            try
            {
                if (JFunctions.UploadSingleFile(FileUpload1, "images/student/" + FileUpload1.FileName) == "true")
                {
                    result = classStudent.studentregister(name.Text, lname.Text, contact1.Text, guardian.Text,
                        gurcontact.Text, radiobut.SelectedValue,
                        dob.Text, nation.Text, religion.Text,1, Convert.ToInt32(DropDownList2.SelectedValue),
                        address.Text,
                        Convert.ToInt32(postal.Text), prevchool.Text, preclass.Text, FileUpload1.FileName,
                        DropDownList5.SelectedValue,
                        Convert.ToInt32(DropDownList3.SelectedValue), Convert.ToInt32(DropDownList4.SelectedValue),
                        user.Text, Convert.ToInt32(accountp.Text), pass.Text, pemail.Text, semail.Text);

                    if (result == "true")
                    {
                        Jfunctionstudents.SendEmail(pemail.Text, "CES - Registration", EmailBody());
                        //picture();
                        Response.Write("Register Successfully Complete Go To Login Page");
                        Response.Redirect("~/Default.aspx");

                    }
                    else
                    {
                        Response.Write("not register");
                    }
                }
                else
                {
                    Response.Write("Image not uploaded to server");
                }
            }
            catch (Exception exception)
            {
                result = exception.ToString();
                Response.Write(result);
            }

        }
        private void picture()
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
                    //Label1.Text = filepath;
                    int filesize = FileUpload1.PostedFile.ContentLength / 1024;
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
                    SqlCommand cmd = new SqlCommand("insert into tbl_general values photo='" + path + "'", con);
                    //shah.ImageUrl = @"~\images\" + FileUpload1.FileName;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "upload";
                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}