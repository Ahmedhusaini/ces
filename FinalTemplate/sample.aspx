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
                    lettersonly:true
                },
                lname: {
                    required: true,
                    lettersonly:true    
                },


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

   <%-- <style type="text/css">
        label.error {
            color: red;
            display: inline-flex;
        }
    </style>--%>
    <title></title>
</head>

<body>

    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="email"></asp:Label>
            <asp:TextBox ID="email" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="name"></asp:Label>
             <asp:TextBox ID="fname" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="2name"></asp:Label>
             <asp:TextBox ID="lname" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="pass" TextMode="Password" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="repass" TextMode="Password" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>

</body>
</html>
