using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalTemplate
{
	public partial class EditMarksheet : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            int m, g, u, i, s, c;
            m = Convert.ToInt32(TextBox1.Text);
            g = Convert.ToInt32(TextBox2.Text);
            u = Convert.ToInt32(TextBox3.Text);
            i = Convert.ToInt32(TextBox4.Text);
            s = Convert.ToInt32(TextBox5.Text);
            c = Convert.ToInt32(TextBox6.Text);
            TextBox7.Text = Convert.ToString(((m + g + u + i + s + c) / 6));
        }
	}
}