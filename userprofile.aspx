﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApplication3.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/generaluser.png" />

                                </center>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>  Your profile</h4>
                                    <span> Account Status - </span>
<asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="your status"></asp:Label>

                                </center>

                                </div>

                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>

                            </div>

                        </div>


                        
                        <div class="row">
                            <div class="cdl-md-6">
                                  <div class="form-group">
                                     <label> USER ID</label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>

                               </div>



                                                               

                            </div>

                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> USER NAME </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>

                               </div>

                                   
                               </div>

                                  <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> DATE OF BIRTH </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" TextMode="Date" ></asp:TextBox>

                               </div>

                                   
                               </div>

                            
                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> CONTACT NUMBER </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>

                               </div>

                                   
                               </div>








                             <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> STATE</label>

                                        <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">

                                            <asp:ListItem Text="-SELECTED-" Value="selected" /> 

                                            <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                              <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                              <asp:ListItem Text="Assam" Value="Assam" />
                              <asp:ListItem Text="Bihar" Value="Bihar" />
                              <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Goa" Value="Goa" />
                              <asp:ListItem Text="Gujarat" Value="Gujarat" />
                              <asp:ListItem Text="Haryana" Value="Haryana" />
                              <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                              <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                              <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                              <asp:ListItem Text="Karnataka" Value="Karnataka" />
                              <asp:ListItem Text="Kerala" Value="Kerala" />
                              <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                              <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                              <asp:ListItem Text="Manipur" Value="Manipur" />
                              <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                              <asp:ListItem Text="Mizoram" Value="Mizoram" />
                              <asp:ListItem Text="Nagaland" Value="Nagaland" />
                              <asp:ListItem Text="Odisha" Value="Odisha" />
                              <asp:ListItem Text="Punjab" Value="Punjab" />
                              <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                              <asp:ListItem Text="Sikkim" Value="Sikkim" />
                              <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                              <asp:ListItem Text="Telangana" Value="Telangana" />
                              <asp:ListItem Text="Tripura" Value="Tripura" />
                              <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                              <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                              <asp:ListItem Text="West Bengal" Value="West Bengal" />

                                        </asp:DropDownList>
                                 
                               </div>

                                   
                               </div>




















                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> EMAIL-ID </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" TextMode="Email"></asp:TextBox>

                               </div>

                                   
                               </div>








                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> CITY </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server"></asp:TextBox>

                               </div>

                                   
                               </div>






                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> PIN CODE  </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" ></asp:TextBox>

                               </div>

                                   
                               </div>






                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> ADDRESS </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server"></asp:TextBox>

                               </div>

                                   
                               </div>





                              <div class="cdl-md-6">
                                    <div class="form-group">
                                     <label> PASSWORD</label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" TextMode="Password"></asp:TextBox>

                               </div>

                                   
                               </div>

                       




                        

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



                         <div class="row">
                            <div class="col">
                                <center>
                                 <div class="form-group">
                                     <asp:Button Class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update" Width="461px" />
                                    
                               </div>
                                    </center>

                            </div>

                        </div>
                    
                    </div> 

                </div>
                

            </div>
                <a href="homepage.aspx"> Back to Home</a><br /> <br />


        </div>

            <div class="col col-md-7"> 
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="images/books.png" />

                                </center>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>  your books </h4>
                                    <span> Account Status - </span>
<asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text=""></asp:Label>

                                </center>

                                </div>

                        </div>


                        <div class="row">
                            <div class="col">
                                <hr>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col"> 
                                <hr />

                            </div>
                        </div>

                          <div class="row">
                            <div class  ="col"> 
                                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
 

                            </div>
                        </div>

                        
                      
                </div>
                

            </div>



            </div>
    </div>
        </div>

</asp:Content>
