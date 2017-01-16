using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class AddSchoolLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SchoolRelatedFunction objSchoolRelatedFunction = new SchoolRelatedFunction();
            if (objSchoolRelatedFunction.AddCoordinates(double.Parse(txtLongitude.Text), double.Parse(txtLatitude.Text)) > 0)
            {
                Response.Write("<script>alert('Coordinates are successfully set.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Error occured while setting the coordinates.');</script>");
            }
        }
    }
}