using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FinalTemplate.source.Functions;
using FinalTemplate.source.Database;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;

namespace FinalTemplate
{
    public partial class school_comparision : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            
           }
        public void comm() { 
            
            SSComparission.Comparission(DropDownList1.SelectedValue);
           

           
            School_Name.Text = SSComparission.school_name;
            found.Text = SSComparission.founnded;
            pos.Text = SSComparission.Schoool_type;
            coun.Text = SSComparission.country;
            city.Text = SSComparission.city;
            camp.Text = SSComparission.campus;
            reg.Text = SSComparission.registration;
            adm.Text = SSComparission.admission;
            sec.Text = SSComparission.security;
            ann.Text = SSComparission.annnaul;
            tut.Text = SSComparission.tution;
        }
        public void com() {
            SSComparission.Comparission(DropDownList2.SelectedValue);
            School_Name1.Text = SSComparission.school_name;
            found1.Text = SSComparission.founnded;
            pos1.Text = SSComparission.Schoool_type;
            coun1.Text = SSComparission.country;
            city1.Text = SSComparission.city;
            camp1.Text = SSComparission.campus;
            reg1.Text = SSComparission.registration;
            adm1.Text = SSComparission.admission;
            sec1.Text = SSComparission.security;
            ann1.Text = SSComparission.annnaul;
            tut1.Text = SSComparission.tution;
        
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        

        }

       

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
              
           

        }
    

        protected void Button1_Click(object sender, EventArgs e)
        {
            comm();
            com();
        }
    
        

    }
}