<%@ Page Title="" Language="C#" MasterPageFile="~/parentchildpanel.Master" AutoEventWireup="true" CodeBehind="parent_view_child.aspx.cs" Inherits="FinalTemplate.parent_view_child" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

      <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
           
            // samesizeimage();

            $('#<%=Dp1.ClientID%>').css('display', 'none'),
                $('#<%=Dp2.ClientID%>').css('display', 'none'),
                $('#<%=Dp3.ClientID%>').css('display', 'none'),
            //$('li[title="time"]').attr("herf", "Time Table")
            $('#<%=Button1.ClientID%>').css('padding-right','112px')

            scroll();


        });

        function scroll() {
            $('li a[title="time"]')
                .click(function (e) {
                    var seectionID = e.currentTarget.id + "section";



                    //alert('button id' + seectionID);

                })
        }

    </Script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <div class="slider-banner-wrapper">
                    <h1 data-wow-delay="0.5s" class="sub-title wow fadeInUp">
                        <asp:Label Text="Date: " ID="lab1" runat="server" Font-Size="Large"></asp:Label>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;<asp:Label Text="Time:" ID="lab2" runat="server" Font-Size="Large"></asp:Label></h1>
                    <h2 class="captions">Child's profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="#">Child's</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    
    
    <div> <asp:label ID="id" Visible="False" runat="server"> </asp:label>  </div>
     <div> <asp:label ID="lblschool_id" Visible="False" runat="server"> </asp:label>  </div>
    <br/>
    <br/>
    <br/>
      <div class="style-show style-grid row" style="           margin-right: 598px;
    padding-left: 80px;">
    <div class="col-style">
                                            <div class="edugate-layout-2">
                                                <div class="edugate-layout-2-wrapper">
                                                    <div class="edugate-content"><a href="courses-detail.html" class="title"><asp:Label ID="lblfl" runat="server"></asp:Label></a>

                                                        <div class="info">
                                                            <div class="author item">Class : <asp:Label ID="lblclass" runat="server"></asp:Label></div>     
                                                            <div class="date-time item">Section : <asp:Label ID="lblsec" runat="server"></asp:Label></div>
                                                        </div>
                                                        <div class="info-more">
                                                           
                                                          Gender : <asp:Label ID="lblgen" runat="server"></asp:Label>
                                                                </div>
                                                         <div class="info-more">
                                                         Phone : <asp:Label ID="lblph" runat="server"></asp:Label>
                                                                     </div>
                                                        <div class="info-more">
                                                         School Name : <asp:Label ID="lblsname" runat="server"></asp:Label>
                                                                     </div>
                                                           <div class="info-more">
                                                         Contact School : <asp:Label ID="lblcontact" runat="server"></asp:Label>
                                                                     </div>
                                                                
                                                                
                                                           
                                                    
                                                    </div>
                                                    <div class="edugate-image"><asp:Image ID="Image1" runat="server" CssClass="img-responsive"  />
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
          </div>
     <asp:DropDownList ID="Dp1" runat="server" DataSourceID="SqlDataSource1" DataTextField="class" DataValueField="class"></asp:DropDownList>
    <asp:DropDownList ID="Dp2" runat="server" DataSourceID="SqlDataSource1" DataTextField="section" DataValueField="section"></asp:DropDownList>
    <asp:DropDownList ID="Dp3" runat="server" DataSourceID="SqlDataSource1" DataTextField="school_name" DataValueField="school_name"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_GetChildClassSec" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="id" Name="Std_id" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    

    <br />
    <br />
    <br />
    <br />
    <br />
     <br />
    <br />
    <br />
     <br />
    <br />
    <br />
        <div class="container" style="    margin-right: 450px;">
        <br/>
            <br/>
           
        <div id="myDiv" class="underline" style="height: 20px; text-align: left;">
                <h2> TIME TABLE&nbsp;&nbsp;&nbsp;&nbsp; </h2>
             
            </div>
           
    <br />
            <div >
    <asp:GridView ID="GridView1"  class="edu-table-responsive"  runat="server"  AutoGenerateColumns="False" Width="1220px"   ForeColor="#86BC42" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
            <asp:BoundField DataField="period_1" HeaderText="Unit 1" SortExpression="period_1" />
            <asp:BoundField DataField="period_2" HeaderText="Unit 2" SortExpression="period_2" />
            <asp:BoundField DataField="period_3" HeaderText="Unit 3" SortExpression="period_3" />
           
            
            <asp:BoundField DataField="period_4" HeaderText="Unit 4" SortExpression="period_4" />
            <asp:BoundField DataField="period_5" HeaderText="Unit 5" SortExpression="period_5" />
            <asp:BoundField DataField="period_6" HeaderText="Unit 6" SortExpression="period_6" />
            <asp:BoundField DataField="period_7" HeaderText="Unit 7" SortExpression="period_7" />
            <asp:BoundField DataField="period_8" HeaderText="Unit 8" SortExpression="period_8" />
           
            
        </Columns>
         <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />

        
    </asp:GridView>
            <br/>
            <asp:Button ID="Button1" class="btn btn-register btn-green" runat="server" Text="Download" OnClick="Button1_Click" />
                
                </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_chileTimetable" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="Dp2" Name="section" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Dp1" Name="class" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Dp3" Name="school_name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
  
       


            
             <br/>
             <br/>
             <br/>
             <br/>
             <br/>
            <br/>
            <br/>
 <br/>
            <br/>
                       
              <div id="homework" class="underline" style="height: 20px; text-align: left;">
                <h2> Home Work&nbsp;&nbsp;&nbsp;&nbsp; </h2>
             
            </div>
             <%-- <asp:Label ID="Label2" Visible="false" runat="server" Text="Label"></asp:Label>    
    <asp:Label ID="Label3"  Visible="false" runat="server" Text="Label"></asp:Label>    
    <asp:Label ID="Label4" runat="server" Visible="false" Text="Label"></asp:Label>--%>
 <%--   <asp:GridView ID="GridView4" class="edu-table-responsive" runat="server" DataKeyNames="lec_id" CellPadding="4" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="lectures" HeaderText="lectures" SortExpression="lectures" />
            <asp:BoundField DataField="lec_id" HeaderText="lec_id" ReadOnly="True" SortExpression="lec_id" />
            <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" Text="<%# Eval("lectures") %>"></asp:LinkButton>
        </EmptyDataTemplate>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#86bc42" Font-Bold="True" ForeColor="#86bc42" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="SELECT [content], [lectures], [lec_id], [extension] FROM [view_lecture_attandance_test] WHERE (([school_id] = @school_id) AND ([class] = @class) AND ([section] = @section))">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="lblschool_id" Name="school_id" PropertyName="Text" Type="String" />
                      <asp:ControlParameter ControlID="lblclass" Name="class" PropertyName="Text" Type="String" />
                      <asp:ControlParameter ControlID="lblsec" Name="section" PropertyName="Text" Type="String" />
                  </SelectParameters>
            </asp:SqlDataSource>--%>
            
            
    <asp:Label ID="Label2" Visible="false" runat="server" Text="Label"></asp:Label>    
    <asp:Label ID="Label3"  Visible="false" runat="server" Text="Label"></asp:Label>    
    <asp:Label ID="Label4" runat="server" Visible="false" Text="Label"></asp:Label>
    <asp:GridView ID="GridView4" class="edu-table-responsive" runat="server" DataKeyNames="lec_id" Width="1220px" ForeColor="#86BC42" CellPadding="4" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="DOWNLOAD">
                <ItemTemplate>
                            <%-- <asp:LinkButton ID="LinkButton1" OnClick="OpenDocument" runat="server" Text='<%# Eval("lectures") %>' Font-Size="Large" Font-Bold="True" Font-Names="'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"></asp:LinkButton>--%>
                            <%--<asp:Button CssClass="btn btn-green" Height="70%" Width="30%" ID="Button1"  runat="server" OnClick="OpenDocument" Text='<%# Eval("lectures") %>' />--%>
                            <asp:LinkButton ID="LinkButton1" ForeColor="#86bc42" Font-Bold="true" runat="server" CommandArgument='<%# Eval("fullpath") %>' Text='<%# Eval("fullpath") %>' OnClick="OpenDocument"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#86bc42" Font-Bold="True" ForeColor="#86bc42" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

              <br/>
             <br/>

              <br />
     <br />
    <br />
    <br />

                 <div id="atten" class="underline" style="height: 20px; text-align: left;">
                <h2> Attendance &nbsp;&nbsp;&nbsp;&nbsp;         <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
          
           <%-- <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Column1" DataValueField="Column1" AutoPostBack="True" >
            </asp:DropDownList>
           --%>
            <asp:Label ID="lbldatetime" runat="server"></asp:Label>
          <%--  <asp:TextBox ID="TextBox1" type="date" AutoPostBack="True" runat="server"></asp:TextBox>--%>

      <%--  Month    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                <asp:ListItem Value="1">January</asp:ListItem>
                <asp:ListItem Value="2">Feburary</asp:ListItem>
                <asp:ListItem Value="3">March</asp:ListItem>
                <asp:ListItem Value="4">April</asp:ListItem>
                <asp:ListItem Value="5">May</asp:ListItem>
                <asp:ListItem Value="6">June</asp:ListItem>
                <asp:ListItem Value="7">July</asp:ListItem>
                <asp:ListItem Value="8">August</asp:ListItem>
                <asp:ListItem Value="9">September</asp:ListItem>
                <asp:ListItem Value="10">Octuber</asp:ListItem>
                <asp:ListItem Value="11">November</asp:ListItem>
                <asp:ListItem Value="12">December</asp:ListItem>
            </asp:DropDownList>--%>




        <br />
        <br />
        <asp:GridView ID="GridView2" class="edu-table-responsive"  runat="server"  AutoGenerateColumns="False" Width="1220px"  ForeColor="#86BC42" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" DataSourceID="SqlDataSource3">
      
            
             <Columns>
                 <asp:BoundField DataField="Column1" HeaderText="Column1" SortExpression="Column1" ReadOnly="True" />
                 <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                 <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" />
             </Columns>
      
            
             <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
              </asp:GridView>
                 
        
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_Parents_view_attendance" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="id" Name="std_id" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lbldatetime" DbType="Date" Name="date" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                 
        
            <br />
        
            <br />
        
        </div>
   
</asp:Content>
