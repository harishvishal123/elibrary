using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;


namespace WebApplication3
{
    public partial class adminbookinventry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            fillauthor();
            GridView1.DataBind();
        }
        SqlConnection con = new SqlConnection(@"Data source=(localdb)\MSSQLLocalDB; Initial catalog =elibrary; Integrated security=true");
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string genres = "";
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                genres = genres + ListBox1.Items[i] + ",";
            }

            genres = genres.Remove(genres.Length - 1);

            string filepath = "~/book_inventory/photo.jpg";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
            filepath = "~/book_inventory/" + filename;

            SqlCommand cmd = new SqlCommand("INSERT INTO master_table(book_id,book_name,genre,author_name,publisher_name,publish_date,language1,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language1,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)", con);

            cmd.Parameters.AddWithValue("@book_id", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@genre", genres);
            cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
            cmd.Parameters.AddWithValue("@language1", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
            cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
            cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
            cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
            cmd.Parameters.AddWithValue("@actual_stock", TextBox4.Text.Trim());
            cmd.Parameters.AddWithValue("@current_stock", TextBox4.Text.Trim());
            cmd.Parameters.AddWithValue("@book_img_link", filepath);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Book added successfully.');</script>");
            GridView1.DataBind();


        }
        void fillauthor()
        {
            SqlCommand cmd = new SqlCommand(" select author_name from author_master", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DropDownList3.DataSource = dt;
            DropDownList3.DataValueField = "author_name";
            DropDownList3.DataBind();


            cmd = new SqlCommand(" select publisher_name from publisher", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            DropDownList2.DataSource = dt;
            DropDownList2.DataValueField = "publisher_name";
            DropDownList2.DataBind();

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT * from master_table WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
                TextBox9.Text = dt.Rows[0]["edition"].ToString();
                TextBox10.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                TextBox11.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                TextBox4.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                TextBox5.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                TextBox6.Text = dt.Rows[0]["book_description"].ToString();
                TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                DropDownList1.SelectedValue = dt.Rows[0]["language1"].ToString().Trim();
                DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                ListBox1.ClearSelection();
                string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                for (int i = 0; i < genre.Length; i++)
                {
                    for (int j = 0; j < ListBox1.Items.Count; j++)
                    {
                        if (ListBox1.Items[j].ToString() == genre[i])
                        {
                            ListBox1.Items[j].Selected = true;

                        }
                    }
                }

                global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                global_issued_books = global_actual_stock - global_current_stock;
                global_filepath = dt.Rows[0]["book_img_link"].ToString();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE from master_table WHERE book_id='" + TextBox1.Text.Trim() + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Book Deleted Successfully');</script>");

            GridView1.DataBind();

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string genres = "";
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                genres = genres + ListBox1.Items[i] + ",";
            }
           
            string filepath = "~/book_inventory/books1";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            if (filename == "" || filename == null)
            {
                filepath = global_filepath;

            }
            else
            {
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;
            }

          
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE master_table set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language1=@language1, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description,book_img_link=@book_img_link where book_id='" + TextBox1.Text.Trim() + "'", con);

            cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@genre", genres);
            cmd.Parameters.AddWithValue("@author_name", DropDownList3.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@publisher_name", DropDownList2.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@publish_date", TextBox3.Text.Trim());
            cmd.Parameters.AddWithValue("@language1", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@edition", TextBox9.Text.Trim());
            cmd.Parameters.AddWithValue("@book_cost", TextBox10.Text.Trim());
            cmd.Parameters.AddWithValue("@no_of_pages", TextBox11.Text.Trim());
            cmd.Parameters.AddWithValue("@book_description", TextBox6.Text.Trim());
        //    cmd.Parameters.AddWithValue("@actual_stock", actual_stock.ToString());
          //  cmd.Parameters.AddWithValue("@current_stock", current_stock.ToString());
            cmd.Parameters.AddWithValue("@book_img_link", filepath);


            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            Response.Write("<script>alert('Book Updated Successfully');</script>");

        }
    }
}
    