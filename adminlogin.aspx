<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication3.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="150px" src="images/adminuser.png" />

                                </center>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>  Admin Login</h3>

                                </center>

                            </div>

                        </div>


                         <div class="row">
                            <div class="col">
                               <div class="form-group">
                                   <label> ADMIN ID</label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Admin Login"></asp:TextBox>

                               </div>

                            </div>

                        </div>


                         <div class="row">
                            <div class="col">
                                 <div class="form-group">
                                     <label> PASSWORD </label>
                                   <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password"></asp:TextBox>

                               </div>

                            </div>

                        </div>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



                         <div class="row">
                            <div class="col">
                                 <div class="form-group">
                                     <asp:Button Class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="LOGIN" Width="510px" OnClick="Button1_Click" />
                                    
                               </div>

                            </div>

                        </div>
                       

                      








                    </div> 

                </div>
                <a href="homepage.aspx"> Back to Home</a><br /> <br />

            </div>

        </div>

    </div>

</asp:Content>
