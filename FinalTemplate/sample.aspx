<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="FinalTemplate.sample" %>


<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<script src="assets/js/jquery-2.2.3.js"></script>
<script src="assets/js/jquery.validate.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#form1").validate({


            rules: {
                nametxt: {
                    required: true,
                    minlength: 10
                },
                pass: "required",
                repass: {
                    required: true,
                    equalTo:"#pass"

                }
            },

            messages: {
                nametxt: {
                    required: "Please enter your name",
                    minlength: "The username is too short"
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
            <asp:Label ID="Label1" runat="server" Text="name"></asp:Label>
            <asp:TextBox ID="nametxt" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="pass" TextMode="Password" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="repass" TextMode="Password" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>

</body>
</html>
