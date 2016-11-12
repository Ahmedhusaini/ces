using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Database;

namespace FinalTemplate
{
    public partial class UpdateNews : System.Web.UI.Page
    {
        Database objdb = new Database("ces");
        JNews objnews = new JNews();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                JFunctions.BindDropDownList(ddlNewsType, "news_type", "news_type_id", "select * from tbl_news_type");

            if (!string.IsNullOrWhiteSpace(Request.QueryString["NC"]))
                txtNewsID.Text = Request.QueryString["NC"];
        }
        protected void GetNewsDetailsOnClick(object sender, EventArgs e)
        {
            if (objnews.GetNewsDetails(Convert.ToInt32(txtNewsID.Text)) == "true")
            {
                txtTitle.Text = objnews.Title;
                txtDescription.Text = objnews.Description;
                imgNews.ImageUrl = "~/images/News/"+objnews.Image;
                ddlNewsType.ClearSelection();
                ddlNewsType.Items.FindByValue(objnews.NewsTypeID.ToString()).Selected = true;
                txtTags.Text = objnews.Tags;

            }
            else
                Response.Write("<script>alert('No Record found with this id.')</script>");
        }
        protected void btnUpdateNews_Click(object sender, EventArgs e)
        {
            if (objnews.UpdateNews(Convert.ToInt32(txtNewsID.Text), Convert.ToInt32(ddlNewsType.SelectedValue), txtTitle.Text, fuImage.FileName, txtDescription.Text, txtTags.Text) == "true")
            {
                Response.Write("<script>alert('News information updated.');</script>");
            }
            else
            {
                Response.Write("<script>alert('An Error Occured during updating news information.');</script>");
            }
        }
    }
}