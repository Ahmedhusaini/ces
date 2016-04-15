<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="FinalTemplate.sample" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
     <script src="assets/js/jquery-2.2.3.js"></script>
    <script src="assets/js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {  
            $("#form1").validate({  
                rules: {  
                    TextBox1: {
                        required: true,
                        minlength:10
                            
                    
                    },  
                },
                  
                    messages: {
                        TextBox1:{
                            required:"Please enter your name",
                            minlength:"The username is too short"
                    
                     
                        }, 
                    }
            });  
         }); 




    </script>
<head runat="server">
   
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="name"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </div>
    </form>
</body>
</html>
