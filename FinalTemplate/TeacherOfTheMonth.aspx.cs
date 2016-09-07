using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;
using System;

namespace FinalTemplate
{
    public partial class TeacherOfTheMonth : System.Web.UI.Page
    {
        public string schoolID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ClassSchoolRegistration schoolRegistration = new ClassSchoolRegistration();
            schoolID = schoolRegistration.GetSchoolIDByAuthorizedID(CurrentUser.AuthorizedID);
        }
    }
}