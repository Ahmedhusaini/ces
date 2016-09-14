using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Database;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Registration;

namespace FinalTemplate
{
    public partial class ViewAllStudents : System.Web.UI.Page
    {
        public string schoolid;
        private ClassSchoolRegistration objSchool = new ClassSchoolRegistration();
        protected void Page_Load(object sender, EventArgs e)
        {
           schoolid = objSchool.GetSchoolIDByAuthorizedID(CurrentUser.AuthorizedID);
        }
       
    }
}