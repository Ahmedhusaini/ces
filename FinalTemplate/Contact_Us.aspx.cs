using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace FinalTemplate
{
    public partial class Contact_Us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
           try
            {
                 SmtpClient client=new SmtpClient ("smtp.gmail.com",587);
                 client.EnableSsl=true;
                 client.Timeout=10000;
                 client.DeliveryMethod=SmtpDeliveryMethod.Network;
                 client.UseDefaultCredentials=false;
                 client.Credentials = new NetworkCredential("jahangeer.ahmed11@gmail.com", "dovocgsfopxjqjko");
                 MailMessage msg = new MailMessage();
                 msg.From = new MailAddress("jahangeer.ahmed11@gmail.com");
                 msg.Subject=(TextBox1.Text);
                 msg.To.Add(TextBox2.Text);  
                 msg.Subject=(DropDownList1.SelectedValue);
                 msg.Body = TextBox3.Text;
                 client.Send(msg);
                 Response.Write("mail Send");

            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
                
            }
        }
    }


