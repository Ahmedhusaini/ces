<%@ Page Title="" Language="C#" MasterPageFile="~/parentpanel.Master" AutoEventWireup="true" CodeBehind="parentpanel.aspx.cs" Inherits="FinalTemplate.parentpanel1" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <script src="assets/js/jquery-2.2.3.js"></script>  

    <script type="text/javascript">


        $(document).ready(function () {

            $('#<%=DropDownList1.ClientID%>').css('display', 'none'),
            $('#<%=Label3.ClientID%>').css('display', 'none'),
                $('.table-row').css(' text-align', 'inherit'),

                check();

        });

        function check()
        {
            $('li a[title="time"]')
                .click(function (e) {
                var seectionID = e.currentTarget.id + "section";
                //alert("daba hai");

            })
            
        }





    </script>
    <style type="text/css">
       .header { text-align:inherit; }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section background-opacity page-title set-height-top">
        <div class="container">
            <div class="page-title-wrapper">
                <!--.page-title-content-->
                <div class="slider-banner-wrapper">
                    <h1 data-wow-delay="0.5s" class="sub-title wow fadeInUp">
                        <asp:Label Text="Date: " ID="lab1" runat="server" Font-Size="Large"></asp:Label>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;<asp:Label Text="Time:" ID="lab2" runat="server" Font-Size="Large"></asp:Label></h1>
                    <h2 class="captions">Parent's profile</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="#">Profile</a></li>
                    </ol>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9">
    <div class="news-page-wrapper">
           <div id="detail" class="edugate-layout-1" style="    background-color: rgba(144, 161, 174, 0.63)">
                                        <div class="edugate-image"><asp:Image ID="Image1" runat="server"  />
                                               <div>
               <asp:FileUpload ID="FileUpload1"  runat="server" />
               <asp:Button class="btn-green" BackColor="#86bc42" BorderColor="#86bc42" ID="btnSave" Text="upload" runat="server" Height="30px" Width="70px" OnClick="btnSave_Click"></asp:Button>
                                        <asp:Label ID="Label3"  runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label1" runat="server"></asp:Label>
                   </div>
                                        </div>
               <br/>
            
                                        <div class="edugate-content"><a href="news-detail.html" class="title">
                                                
                                                <asp:Label ID="headlbl" runat="server" Font-size="18"  ></asp:Label>
                                            </a>&nbsp;&nbsp;
                                            <a href="news-detail.html" class="title"> 
                                                 <asp:Label ID="headll" runat="server" Font-size="18"  ></asp:Label></a>
                                            <div class="info">
                                                <div class="author item"><a href="#">Gender: </a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="gender" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Contact NO: </a> &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="phone" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Address: </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="address" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Email ID: </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="pemail" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                            <div class="info">
                                                <div class="author item"><a href="#">Authorized ID : </a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="atype" Font-size="13" runat="server"></asp:Label></div>
                     
                                            </div>
                                           
                                            <div class="description"></div>
                                          <%-- <button class="btn btn-green"><span>read more</span></button>--%>

                                        </div>

                                    </div>

        </div>
        </div>
    
   <div class="container teacher-course-wrapper" style="width:1220px">
        <div class="group-title-index edu-ab-title"><h2 class="center-title">
            &nbsp;</h2>
           
            </div>
                       <div class="course-table" style="border-style: none; border-width: inherit; border-color: #FFFFFF">
                          
                        
                          
       </div>
                                    </div>
                            
      
        <!-- CHOOSE COURSES-->
    <br />
     <br />
     <br />
     <br />
     <br />
     <br />
                        <div class="group-title-index"> <div id="checkstudent"> <h4 class="top-title">Your Childerns </h4></div>

                            <h2 class="center-title" >check profile of your Child&nbsp;&nbsp;&nbsp;&nbsp; </h2>

                            <div class="bottom-title">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="GetParentid" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="authorized_id" SessionField="userid" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Parent_ID" DataValueField="Parent_ID">
                                </asp:DropDownList>
                                <i class="bottom-icon icon-a-1-01-01"></i>
                                <br />
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ces %>" SelectCommand="spchild" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="Parent_ID" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView1"  class="edu-table-responsive"  runat="server"  AutoGenerateColumns="False" Width="1220px  " AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource2"  ForeColor="#86BC42" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                          <asp:TemplateField  HeaderText="Firstname">
                                             <ItemTemplate>
                                                 <asp:LinkButton ID="LinkButton1"   OnClick="linkbutton" Text='<%#Eval("Firstname")%>'  runat="server">Link</asp:LinkButton>
                                             </ItemTemplate>
                                               <HeaderStyle BackColor="#737373" Font-Bold="True" ForeColor="#86bc42" />
                                         </asp:TemplateField>
                                        <asp:BoundField DataField="lastname" HeaderText="Lastname" SortExpression="lastname" />
                                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                        <asp:BoundField DataField="Guardian_Name" HeaderText="Guardian Name" SortExpression="Guardian_Name" />
                                        <asp:BoundField DataField="school_name" HeaderText="School" SortExpression="school_name" />
                                        <asp:BoundField DataField="school_type" HeaderText="School Type" SortExpression="school_type" />
                                        <asp:BoundField DataField="class" HeaderText="Class" SortExpression="class" />
                                        <asp:BoundField DataField="section" HeaderText="Section" SortExpression="section" />
                                        
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
                                <br />
                            </div>
                        </div>
              <div class="section choose-course-3">
                    <div class="choose-course-3-wrapper row">

                        <div class="item-course"  style=" width: 800px;   display:none  " >
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                
                                <div class="icon-course"><a href="#" class="name-course">

                                &nbsp; &nbsp; &nbsp; <asp:Label ID="Name" runat="server" Font-Size="18" ></asp:Label></a>

                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Guardian Name :&nbsp; <asp:Label ID="gname" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Gender :&nbsp; <asp:Label ID="cgender" runat="server" Font-Size="15"></asp:Label></div>
                                   
                                </div>
                                <br/>
                               
                                 <div class="info">
                                &nbsp; &nbsp; &nbsp;       School :&nbsp; <asp:Label ID="school" Text="dsada" runat="server" Font-Size="15"></asp:Label></div>
                                 <div class="info">
                             &nbsp; &nbsp; &nbsp;       Type : &nbsp;<asp:Label ID="stype" Text="dsada" runat="server" Font-Size="15"></asp:Label></div>
                            
                                 
                                <div class="icon-course"></div>
                                     <br/>
                                    
                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Class :&nbsp; <asp:Label ID="classsss" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Section :&nbsp; <asp:Label ID="section" runat="server" Font-Size="15"></asp:Label></div>                                                           
                                
                                   
                            </div>
                        </div>
                       <div class="item-course" style=" display:none" >
                            <div class="item-course-wrapper">
                               <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                              <%--  
                                <div class="icon-course"><a href="#" class="name-course">

                                &nbsp; &nbsp; &nbsp; <asp:Label ID="name2" runat="server" Font-Size="18"  ClientIDMode="Predictable" ></asp:Label></a>

                                     <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Guardian Name :&nbsp; <asp:Label ID="gname2" runat="server" Font-Size="15"></asp:Label></div>
                                    <div class="info">
                                   &nbsp; &nbsp; &nbsp;      Gender :&nbsp; <asp:Label ID="gender2" runat="server" Font-Size="15"></asp:Label></div>
                                   
                                </div>--%>
                        </div>
                        <div class="item-course" style="display:none">
                            <div class="item-course-wrapper">
                                <div class="icon-course"><i class="icons-img fa fa-male"></i></div>
                                <div class="info-course"><a href="#" class="name-course">siddique</a>

                                    <div class="info">check them out</div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>     
    <div class="section teacher-course section-padding">
                </div>
           <div class="section teacher-course section-padding">
                    <div class="container teacher-course-wrapper">
                        <div class="course-table">
                            <div class="outer-container">
                                <div class="inner-container">
                                    <div class="table-body">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
     <!-- SLIDER TALK ABOUT US-->                                        
                <%--<div class="section background-opacity slider-talk-about-us">
                    <div class="group-btn-slider"><a href="#people-talk" role="button" data-slide="prev">
                    </a><a href="#people-talk" role="button" data-slide="next">
                        <div class="btn-next carousel-control right"><i class="fa fa-angle-right"></i></div>
                    </a></div>
                </div>--%>
                    <!-- SLIDER LOGO-->
                <%--<div class="section slider-logo">
                    <div class="container">
                        <div class="slider-logo-wrapper">
                            <div class="slider-logo-content">
                                <div class="carousel-logos owl-carousel">
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-1.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-2.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-3.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-4.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-5.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-6.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-1.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-2.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-3.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-4.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-5.png" alt="" class="img-responsive"/></a></div>
                                    <div class="logo-iteam item"><a href="#"><img src="assets/images/logo/logo-carousel-6.png" alt="" class="img-responsive"/></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
              </div>
</asp:Content>
