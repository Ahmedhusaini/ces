//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using FinalTemplate.source.Database;
//using FinalTemplate.source.Functions;
//using iTextSharp.text;
//using iTextSharp.text.pdf;
//using iTextSharp.text.html.simpleparser;

//namespace FinalTemplate
//{
//    public partial class parent_view_child : System.Web.UI.Page
//    {
//        private Database myDatabase = new Database("cesConnectionString3");

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            lab1.Text = "Date :" + System.DateTime.Now.ToShortDateString();
//            lab2.Text = "Time :" + System.DateTime.Now.ToShortTimeString();
//        //    Jfunctionparents.BindDropDownList(DropDownList2, "month", "month_id", "select * from tbl_month");

//            if (Session["userid"] != null)
//            {

//                string[] col = {"General_Id"};
//                string[] colwhere = {"authorized_id"};
//                string[] whereoperator = {"="};
//                string[] multiwhere = {""};

//                CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
//                //Parents.GetChildDetails(Session["userid"].ToString());


//                string[] whereoperatorvale = {"'" + CurrentUser.AuthorizedID + "'"};

//                string[,] parentid = myDatabase.SelectQuery("tbl_Parents", col, colwhere, whereoperator,
//                    whereoperatorvale, multiwhere);

//                CurrentUser.GetPersonalDetails(Convert.ToInt32(parentid[0, 0]));

//                Label lbl = (Label) this.Master.FindControl("fname");
//                if (lbl != null)
//                {
//                    lbl.Text = CurrentUser.FirstName + " " + CurrentUser.LastName;
//                }


                

//            }
            
//            Parents.GetChildDetails(Parents.parentschild);

//            id.Text = Parents.std_id;
//            Parents.child_detail(id.Text);
//            lblfl.Text = Parents.Firstname + " " + Parents.Lastname;
//            lblclass.Text = Parents.sclass;
//            lblsec.Text = Parents.sectionn;
//            lblgen.Text = Parents.Gender;
//            lblph.Text = Parents.Phone;
//            lblsname.Text = Parents.Schoolname;
//            lblcontact.Text = Parents.contactprimary;



//        }

//        protected void Button1_Click(object sender, EventArgs e)
//        {
//            PdfPTable pdf = new PdfPTable(GridView1.HeaderRow.Cells.Count);

//            foreach (TableCell headercell in GridView1.HeaderRow.Cells)
//            {
//                Font font = new Font();
//                font.Color = new BaseColor(GridView1.HeaderStyle.ForeColor);

//                PdfPCell pdfcell = new PdfPCell(new Phrase(headercell.Text,font));
//                pdfcell.BackgroundColor = new BaseColor(GridView1.HeaderStyle.BackColor);
//                pdf.AddCell(pdfcell);
//            }

//            foreach(GridViewRow grid in GridView1.Rows)
//            {

//                foreach (TableCell tablecell in grid.Cells)
//                {
//                    Font font = new Font();
//                    font.Color = new BaseColor(GridView1.RowStyle.ForeColor);


//                    PdfPCell pdfcell = new PdfPCell(new Phrase(tablecell.Text));
//                    pdfcell.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor);
//                    pdf.AddCell(pdfcell);
//                }
//            }

//            Document pdfdoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
//            PdfWriter.GetInstance(pdfdoc, Response.OutputStream);

//            pdfdoc.Open();
//            pdfdoc.Add(pdf);
//            pdfdoc.Close();

//            Response.ContentType = "application/pdf";
//            Response.AppendHeader("content-disposition", "attachment;filename = Student's Time Table");
//            Response.Write(pdfdoc);
//            Response.Flush();
//            Response.End();

//        }

        
//    }
//}