using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication3
{
    public partial class adminmanagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data source=(localdb)\MSSQLLocalDB; Initial catalog =elibrary; Integrated security=true");


        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master(author_id,author_name) values(@author_id,@author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text);
                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert(' sucess');</script>");
                clear();
                GridView1.DataBind();
            }
            catch (Exception c)
            {
                Response.Write(c.Message);
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE author_master SET author_name=@author_name WHERE author_id='" + TextBox1.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Updated Successfully');</script>");
                clear();
                GridView1.DataBind();
            }
            catch (Exception c)
            {
                Response.Write(c.Message);
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from author_master where author_id='" + TextBox1.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('delete sucess fully');</script>");
                clear();
                GridView1.DataBind();
            }
            catch (Exception c)
            {
                Response.Write(c.Message);
            }
        }
        void clear()
        {
            TextBox1.Text = " ";
            TextBox2.Text = " ";
        }
    }
    
}