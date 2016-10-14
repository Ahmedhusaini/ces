using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;

namespace FinalTemplate
{
    public partial class ViewAllTachers : System.Web.UI.Page
    {
        public string school_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            ClassSchoolRegistration schoolRegistration = new ClassSchoolRegistration();
            school_id = schoolRegistration.GetSchoolIDByAuthorizedID(CurrentUser.AuthorizedID);
        }
    }
}