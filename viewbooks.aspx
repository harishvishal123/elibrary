<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="WebApplication3.viewbooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
</script>


        
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Book Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryConnectionString %>" DeleteCommand="DELETE FROM [master_table] WHERE [book_id] = @book_id" InsertCommand="INSERT INTO [master_table] ([book_id], [book_name], [genre], [author_name], [publisher_name], [publish_date], [language1], [edition], [book_cost], [no_of_pages], [book_description], [actual_stock], [current_stock], [book_img_link]) VALUES (@book_id, @book_name, @genre, @author_name, @publisher_name, @publish_date, @language1, @edition, @book_cost, @no_of_pages, @book_description, @actual_stock, @current_stock, @book_img_link)" SelectCommand="SELECT * FROM [master_table]" UpdateCommand="UPDATE [master_table] SET [book_name] = @book_name, [genre] = @genre, [author_name] = @author_name, [publisher_name] = @publisher_name, [publish_date] = @publish_date, [language1] = @language1, [edition] = @edition, [book_cost] = @book_cost, [no_of_pages] = @no_of_pages, [book_description] = @book_description, [actual_stock] = @actual_stock, [current_stock] = @current_stock, [book_img_link] = @book_img_link WHERE [book_id] = @book_id">
                                 <DeleteParameters>
                                     <asp:Parameter Name="book_id" Type="String" />
                                 </DeleteParameters>
                                 <InsertParameters>
                                     <asp:Parameter Name="book_id" Type="String" />
                                     <asp:Parameter Name="book_name" Type="String" />
                                     <asp:Parameter Name="genre" Type="String" />
                                     <asp:Parameter Name="author_name" Type="String" />
                                     <asp:Parameter Name="publisher_name" Type="String" />
                                     <asp:Parameter Name="publish_date" Type="String" />
                                     <asp:Parameter Name="language1" Type="String" />
                                     <asp:Parameter Name="edition" Type="String" />
                                     <asp:Parameter Name="book_cost" Type="String" />
                                     <asp:Parameter Name="no_of_pages" Type="String" />
                                     <asp:Parameter Name="book_description" Type="String" />
                                     <asp:Parameter Name="actual_stock" Type="String" />
                                     <asp:Parameter Name="current_stock" Type="String" />
                                     <asp:Parameter Name="book_img_link" Type="String" />
                                 </InsertParameters>
                                 <UpdateParameters>
                                     <asp:Parameter Name="book_name" Type="String" />
                                     <asp:Parameter Name="genre" Type="String" />
                                     <asp:Parameter Name="author_name" Type="String" />
                                     <asp:Parameter Name="publisher_name" Type="String" />
                                     <asp:Parameter Name="publish_date" Type="String" />
                                     <asp:Parameter Name="language1" Type="String" />
                                     <asp:Parameter Name="edition" Type="String" />
                                     <asp:Parameter Name="book_cost" Type="String" />
                                     <asp:Parameter Name="no_of_pages" Type="String" />
                                     <asp:Parameter Name="book_description" Type="String" />
                                     <asp:Parameter Name="actual_stock" Type="String" />
                                     <asp:Parameter Name="current_stock" Type="String" />
                                     <asp:Parameter Name="book_img_link" Type="String" />
                                     <asp:Parameter Name="book_id" Type="String" />
                                 </UpdateParameters>
                             </asp:SqlDataSource>
                     <div class="col">
                            <Columns>
                                <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                

                                <asp:TemplateField>
                                    <ItemTemplate>
                                       
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                   <div class="row">
                                                       <div class="col-lg-12">
                                                           <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Italic="True"></asp:Label>

                                                </div>
                                                   </div>


                                                    <div class="row">
                                                       <div class="col-lg-12">


                                                           Author-<asp:Label ID="Label2" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                           &nbsp;|| Genere-<asp:Label ID="Label3" runat="server" Text='<%# Eval("genre") %>'></asp:Label>
                                                           &nbsp;|| languages -&nbsp;
                                                           <asp:Label ID="Label4" runat="server" Text='<%# Eval("language1") %>'></asp:Label>


                                                           &nbsp;||PublisherDate-<asp:Label ID="Label5" runat="server" Text='<%# Eval("publish_date") %>'></asp:Label>


                                                </div>
                                                   </div>



                                                    <div class="row">
                                                       <div class="col-lg-12">
                                                           Book_Description-<asp:Label ID="Label6" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>
                                                </div>
                                                   </div>



                                                    <div class="row">
                                                       <div class="col-lg-12">
                                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:HyperLink ID="HyperLink1" runat="server"> Download</asp:HyperLink>
                                                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;
                                                           <asp:HyperLink ID="HyperLink2" runat="server">Read</asp:HyperLink>
                                                           &nbsp;</div>
                                                   </div>



                                                </div>

                                                     <div class="col-lg-2">
                                                         <asp:Image class="img-fluid p-2" ID="images" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />

                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                

                            </Columns>
                         </asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
</asp:Content>