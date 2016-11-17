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

namespace FinalTemplate
{
    public partial class parent_view_child : System.Web.UI.Page
    {
        private Database myDatabase = new Database("ces");

        protected void Page_Load(object sender, EventArgs e)
        {
            lab1.Text = "Date :" + System.DateTime.Now.ToShortDateString();
            lab2.Text = "Time :" + System.DateTime.Now.ToShortTimeString();
        //    Jfunctionparents.BindDropDownList(DropDownList2, "month", "month_id", "select * from tbl_month");



            if (Session["userid"] != null)
            {

                string[] col = {"General_Id"};
                string[] colwhere = {"authorized_id"};
                string[] whereoperator = {"="};
                string[] multiwhere = {""};

                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
                //Parents.GetChildDetails(Session["userid"].ToString());


                string[] whereoperatorvale = {"'" + CurrentUser.AuthorizedID + "'"};

                string[,] parentid = myDatabase.SelectQuery("tbl_Parents", col, colwhere, whereoperator,
                    whereoperatorvale, multiwhere);

                CurrentUser.GetPersonalDetails(Convert.ToInt32(parentid[0, 0]));

                Label lbl = (Label) this.Master.FindControl("fname");
                if (lbl != null)
                {
                    lbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
                }


                

            }
            
            Parents.GetChildDetails(Parents.parentschild);

            id.Text = Parents.std_id;
            Parents.child_detail(id.Text);
            lblfl.Text = Parents.Firstname + " " + Parents.Lastname;
            lblclass.Text = Parents.sclass;
            lblsec.Text = Parents.sectionn;
            lblgen.Text = Parents.Gender;
            lblph.Text = Parents.Phone;
            lblsname.Text = Parents.Schoolname;
            lblcontact.Text = Parents.contactprimary;



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
                foreach (TableCell  tableCell in gridViewRow.Cells)
                {
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text));
                    pdftable.AddCell(pdfCell);
                }
            }
            Document pdfDocument = new Document(PageSize.A4,10f,10f,10f,10f);
            PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            pdfDocument.Open();
            pdfDocument.Add(pdftable);
            pdfDocument.Close();


            Response.ContentType = "application/pdf";
            Response.AppendHeader("content-diposition","attachment; filename=Timetable.pdf");
            Response.Write(pdfDocument);
            Response.Flush();
            Response.End();


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

       

       

        
    }
}