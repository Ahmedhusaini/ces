using FinalTemplate.source.Functions;
using System;

namespace FinalTemplate
{
    public partial class DefineFeesStructure : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SchoolRelatedFunction objSchoolRelatedFunction = new SchoolRelatedFunction();
            if (objSchoolRelatedFunction.DefineFeesStructure(txtRegistrationFees.Text, txtAddmissionFees.Text,
                txtSecurityFees.Text, txtAnnualFees.Text, txtTuitionFees.Text, txtTransportfees03km.Text,
                txtTransportfees48km.Text, txtTransportfees916km.Text, txtTransportfeesgreaterthan16km.Text) == 1)
            {
                Response.Write("<script>alert('Fee structure defined.');</script>");
            }
            else
            {
                Response.Write("<script>alert('error occured during the process. contact the CES service provider.');</script>");
            }
        }
    }
}