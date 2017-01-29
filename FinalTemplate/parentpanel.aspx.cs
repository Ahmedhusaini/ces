using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
    public partial class parentpanel1 : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        SqlConnection con = new SqlConnection(@"Data Source=SHAHERYAR\SQLEXPRESS;Initial Catalog=ces;Integrated Security=True");

        Parents objp = new Parents();
        studentid objstd = new studentid();
        private string studentexists;


        protected void Page_Load(object sender, EventArgs e)
        {


            lab1.Text = "Date :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "Time :" + System.DateTime.Now.ToShortTimeString();



            if (Session["userid"] != null)
            {

                string[] col = { "General_Id" };
                string[] colwhere = { "authorized_id" };
                string[] whereoperator = { "=" };
                string[] multiwhere = { "" };

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                //Parents.GetChildDetails(Session["userid"].ToString());


                string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };

                string[,] parentid = myDatabase.SelectQuery("tbl_Parents", col, colwhere, whereoperator, whereoperatorvale, multiwhere);

                CurrentUser.GetPersonalDetails(Convert.ToInt32(parentid[0, 0]));

                Label lbl = (Label)this.Master.FindControl("fname");
                if (lbl != null)
                {
                    lbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                }

                headlbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;

                gender.Text = CurrentUser.Gender;
                phone.Text = CurrentUser.Phone;
                address.Text = CurrentUser.Address;
                pemail.Text = CurrentUser.PrimaryEmailAddress;
                atype.Text = CurrentUser.AuthorizedID;
                Image1.ImageUrl = "~/images/" + CurrentUser.Photo;
                Label3.Text = CurrentUser.GeneralID.ToString();


                Parents.GetParentsID(Session["userid"].ToString());
                Label2.Text = Parents.parentschild;
                Parents.childern(Label2.Text);
            }

            else
            {
                Response.Redirect("~/Default.aspx");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }
        protected void linkbutton(object sender, EventArgs e)
        {
            Response.Redirect("~/parent_view_child.aspx?ID=" + ((LinkButton)sender).Text);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string filename = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath(".") + "//images//" + filename);
                    string filepath = Server.MapPath("~/images/" + filename.ToString());
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
                    string path = filename.ToString();
                    SqlCommand cmd = new SqlCommand("update tbl_general set photo='" + path + "' where General_Id='" + Label3.Text + "'", con);
                    Image1.ImageUrl = "~/images/" + FileUpload1.FileName;
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

        protected void Button1_Click2(object sender, EventArgs e)
        {

            objstd.students = "\'" + TextBox1.Text + "\'";

            studentexists = objstd.checkstudentid(objstd.students);



            if (studentexists == "true")
            {

                if (objp.parentchild(TextBox1.Text) > 0)
                {
                    Response.Write("<script>alert('Chid record has been added successfully.');</script>");
                    Response.Redirect("parentpanel.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Error.');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Not Exists .');</script>");
            }



        }

        protected void btnShow_Click(object sender, EventArgs e)
        {

            //Parents objp = new Parents();
            //if (
            //objp.parentc() > 0)
            //{
            //    Response.Write("<script>alert('Job successfully posted.');</script>");
            //}
            //else
            //{
            //    Response.Write("<script>alert('Error uccured while posting job.');</script>");
            //}




        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


    }







}
