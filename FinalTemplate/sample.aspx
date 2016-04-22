<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="FinalTemplate.sample" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
   
<script src="assets/js/jquery-2.2.3.js"></script>
<script src="assets/js/jquery.validate.js"></script>
 <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script type="text/javascript">
    $.validator.addMethod("lettersonly", function (value, element) {
        return this.optional(element) || /^[a-z]+$/i.test(value);
    }, "Letters only please");
    $.validator.addMethod("phone", function (phone_number, element) {
        phone_number = phone_number.replace(/\s+/g, "");
        return this.optional(element) || phone_number.length > 9 &&
            phone_number.match(/^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$/);
    }, "Please specify a valid phone number with+92");


    $(document).ready(function () {
        $("#form1").validate({


            rules: {
                email: {
                    required: true,
                    email:true
                    },
                pass: "required",
                repass: {
                    required: true,
                    equalTo:"#pass"
                    },
                fname: {
                    required: true,
                    lettersonly: true
                    },
                lname: {
                        required: true,
                        lettersonly:true    
                    },
                phone: {
                        required: true,
                        phone:true
                    },
                ab: {
                        required: true,
                }
            },

            messages: {
                email: {
                    required: "Please enter your an email.",
                    email:"Please enter a <em>valid</em> email address."
                },
            }

        });
    });






</script>


<head runat="server">

    <style type="text/css">
        label.error {
            color: red;
            display: inline-flexbox;
            display:block;

           
        }
        input.error {
            border:1px solid red;
            float: none; color: red;
        padding-left: .3em; vertical-align: top;
        }
       

    </style>
    <title></title>
    
</head>

<body>

    <form id="form1" runat="server">
        
            <asp:Label ID="Label1" runat="server" Text="email"></asp:Label><br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox><br />

            <asp:Label ID="Label2" runat="server" Text="name"></asp:Label>
             <asp:TextBox ID="fname" runat="server" ></asp:TextBox><br />

            <asp:Label ID="Label3" runat="server" Text="2name"></asp:Label>
             <asp:TextBox ID="lname" runat="server"></asp:TextBox><br />
            
             <asp:Label ID="Label4" runat="server" Text="phone"></asp:Label>
             <asp:TextBox ID="phone" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="pass" TextMode="Password" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="repass" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
</form>
    </body>
   </html>