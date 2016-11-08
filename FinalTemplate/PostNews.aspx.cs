using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
    public partial class PostNews : System.Web.UI.Page
    {
        private JNews objnews = new JNews();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                JFunctions.BindDropDownList(ddlnewstype, "news_type", "news_type_id", "select * from tbl_news_type");
            }
        }

        protected void btnPostNews_Click(object sender, EventArgs e)
        {
            if (objnews.AddNews(Convert.ToInt32(ddlnewstype.SelectedValue), txtNewsTitle.Text, fileuploadnewsimage.FileName, txtNewsContent.Text, txtTags.Text) == "true")
            {
                if (JFunctions.UploadSingleFile(fileuploadnewsimage, "images/News/",".jpg|.png") == "true")
                {
                    Response.Write("<script>alert('News Addes successfully.');</script>");
                }
                else
                {
                    Response.Write("<script>alert('News Addes successfully, but image/video may not uploaded.');</script>");
                }
            }
        }
    }
}