using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;

namespace FinalTemplate
{
	public partial class view_attendance : System.Web.UI.Page
	{
         private Database myDatabase = new Database("ces");

	    protected void Page_Load(object sender, EventArgs e)
	    {

	        if (Session["userid"] != null)
	        {
	            string[] col = {"General_Id"};
	            string[] colwhere = {"authorized_id"};
	            string[] whereoperator = {"="};
	            string[] multiwhere = {""};

	            CurrentUser.GetAuthorizedDetails(Session["userid"].ToString());
	            string[] whereoperatorvale = {"'" + CurrentUser.AuthorizedID + "'"};
	            string[,] teacherid = myDatabase.SelectQuery("tbl_teacher", col, colwhere, whereoperator, whereoperatorvale,
	                multiwhere);
	        }
	    }

	    protected void Button1_Click(object sender, EventArgs e)
        {

        }
	}
}