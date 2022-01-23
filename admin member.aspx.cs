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
    public partial class admin_member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data source=(localdb)\MSSQLLocalDB; Initial catalog =elibrary; Integrated security=true");

        protected void LinkButton4(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE member SET account_status WHERE author_id='" + TextBox1.Text.Trim() + "'", con);

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click1(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from member where member_id='" + TextBox1.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();


            if (dr.Read())
            {
                
                    TextBox2.Text = dr[1].ToString();
                    TextBox3.Text = dr[3].ToString();
                    TextBox4.Text = dr[4].ToString();
                    // TextBox5.Text = dr[4].ToString();
                    TextBox6.Text = dr[8].ToString();
                    TextBox7.Text = dr[10].ToString();
                    TextBox8.Text = dr[2].ToString();
                    TextBox9.Text = dr[5].ToString();

                    TextBox10.Text = dr[6].ToString();
                    TextBox11.Text = dr[7].ToString();


                    con.Close();
                }


            }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from member where member_id='" + TextBox1.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('delete sucess fully');</script>");
            clear();
            GridView1.DataBind();


        }
        void clear()
        {
            TextBox1.Text = " ";
            TextBox2.Text = " ";
            TextBox3.Text = " ";
            TextBox4.Text = " ";
          
            TextBox6.Text = " ";
            TextBox7.Text = " ";
            TextBox8.Text = " ";
            TextBox9.Text = " ";
            TextBox10.Text = " ";
            TextBox11.Text = " ";
        }
    }
    
    }
