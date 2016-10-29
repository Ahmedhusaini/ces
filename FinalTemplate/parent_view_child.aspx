<%@ Page Title="" Language="C#" MasterPageFile="~/parentchildpanel.Master" AutoEventWireup="true" CodeBehind="parent_view_child.aspx.cs" Inherits="FinalTemplate.parent_view_child" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

      <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
           
            // samesizeimage();

            $('#<%=Dp1.ClientID%>').css('display', 'none'),
                 $('#<%=Dp2.ClientID%>').css('display', 'none'),
              $('#<%=Dp3.ClientID%>').css('display', 'none')
            //$('li[title="time"]').attr("herf", "Time Table")
        });
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
    
    
    <div> <asp:label ID="id" runat="server"> </asp:label>  </div>
      <div class="style-show style-grid row" style="        padding-right: 998px;
    margin-left: 179px;">
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
                                                    <div class="edugate-image"><img src="assets/images/courses/courses-4.jpg" alt="" class="img-responsive"/></div>
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
        <div class="container" style="    margin-right: 450px;">
        <div id="check_timetable" class="underline" style="height: 20px; text-align: left;">
                <h2> TIME TABLE&nbsp;&nbsp;&nbsp;&nbsp; </h2>
             
            </div>
           
    <br />
    <asp:GridView ID="GridView1"  class="edu-table-responsive"  runat="server"  AutoGenerateColumns="False" Width="1220px"   ForeColor="#86BC42" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
            <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
            <asp:BoundField DataField="starting_time" HeaderText="starting_time" SortExpression="starting_time" />
            <asp:BoundField DataField="ending_time" HeaderText="ending_time" SortExpression="ending_time" />
           
            
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
            <asp:Button ID="Button1" runat="server" Text="Download" OnClick="Button1_Click" />
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


                 <div id="check_timetable" class="underline" style="height: 20px; text-align: left;">
                <h2> Attendance &nbsp;&nbsp;&nbsp;&nbsp; </h2>
             
            </div>
        <br />
            
       
       
            <asp:Label ID="Label1" runat="server" Text="Month"></asp:Label>
          
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Column1" DataValueField="Column1" AutoPostBack="True" >
            </asp:DropDownList>
           


            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="select DATENAME(MM,[date]) from tbl_student_attendance ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="id" Name="std" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
           


        <br />
        <br />
        <asp:GridView ID="GridView2" class="edu-table-responsive"  runat="server"  AutoGenerateColumns="False" Width="1220px"  ForeColor="#86BC42" AllowPaging="True" AllowSorting="True" CellPadding="4" GridLines="None" DataSourceID="SqlDataSource4">
      
            
             <Columns>
                 <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
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
                 
        
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="sp_Parents_view_attendance" SelectCommandType="StoredProcedure">
                <SelectParameters>
                   
                    <asp:ControlParameter ControlID="id" Name="std_id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                 
        
            <br />
        
            <br />
        
        </div>
   
</asp:Content>
