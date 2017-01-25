using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace FinalTemplate
{
    public partial class parent_view_child : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");
        string a = ConfigurationManager.ConnectionStrings["ces"].ConnectionString;
        Database db = new Database("ces");
        string fullpath = "files/Lectures/";

        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "Date :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "Time :" + System.DateTime.Now.ToShortTimeString();
            //    Jfunctionparents.BindDropDownList(DropDownList2, "month", "month_id", "select * from tbl_month");
            lbldatetime.Text = DateTime.Now.ToString("yyyy/MM/dd");

            

            //if (this.Page.PreviousPage != null)
            //{
            //    int rowindex = int.Parse(Request.QueryString["RowIndex"]);
            //    GridView GridVie = (GridView)this.Page.PreviousPage.FindControl("GridView1");
            //    GridViewRow row = GridVie.Rows[rowindex];
            //    std.Text = row.Cells[0].Text;
            //}


            if (Session["userid"] != null)
            {

                string[] col = { "General_Id" };
                string[] colwhere = { "authorized_id" };
                string[] whereoperator = { "=" };
                string[] multiwhere = { "" };

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                //Parents.GetChildDetails(Session["userid"].ToString());


                string[] whereoperatorvale = { "'" + CurrentUser.AuthorizedID + "'" };

                string[,] parentid = myDatabase.SelectQuery("tbl_Parents", col, colwhere, whereoperator,
                    whereoperatorvale, multiwhere);

                CurrentUser.GetPersonalDetails(Convert.ToInt32(parentid[0, 0]));

                Label lbl = (Label)this.Master.FindControl("fname");
                if (lbl != null)
                {
                    lbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                }




            }
            std.Text = Request.QueryString["ID"].ToString();

            Parents.GetChildDetails(std.Text);

            //id.Text = Parents.std_id;   
            Parents.child_detail(std.Text);
            lblfl.Text = Parents.Firstname + " " + Parents.Lastname;
            lblclass.Text = Parents.sclass;
            lblsec.Text = Parents.sectionn;
            lblgen.Text = Parents.Gender;
            lblph.Text = Parents.Phone;
            lblsname.Text = Parents.Schoolname;
            lblcontact.Text = Parents.pemail;
           
            Image1.ImageUrl = "images/student/" + Parents.photo;

            if (!IsPostBack)
            {
                filldata2();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PdfPTable pdftable = new PdfPTable(GridView1.HeaderRow.Cells.Count);

            foreach (TableCell headerCell in GridView1.HeaderRow.Cells)
            {
                PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text));
                pdftable.AddCell(pdfCell);
            }

            foreach (GridViewRow gridViewRow in GridView1.Rows)
            {
                foreach (TableCell tableCell in gridViewRow.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text));
                    pdftable.AddCell(pdfCell);
                }
            }
            Document pdfDocument = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            pdfDocument.Open();
            pdfDocument.Add(pdftable);
            pdfDocument.Close();


            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-diposition", "attachment; filename=Timetable.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        public void filldata2()
        {
            DataTable dt = new DataTable();
            int lec_id = Convert.ToInt32(db.GetLastValueByColumnName("lec_id", "lecture_attandance_test"));
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("sp_lecture_test", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                dt.Load(reader);
            }
            if (dt.Rows.Count > 0)
            {
                GridView4.DataSource = dt;
                GridView4.DataBind();
            }
        }

        protected void OpenDocument(object sender, EventArgs e)
        {
            LinkButton li = (LinkButton)sender;
            GridViewRow gr = (GridViewRow)li.NamingContainer;

            int lec_id = int.Parse(GridView4.DataKeys[gr.RowIndex].Value.ToString());

            FileInfo fi = new FileInfo(download(lec_id));
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }

        private string download(int lec_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(a))
            {
                SqlCommand cmd = new SqlCommand("sp_lecture_test", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lec_id", SqlDbType.Int).Value = lec_id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            return dt.Rows[0]["fullpath"].ToString();
        }
    }
}