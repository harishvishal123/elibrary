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
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data source=(localdb)\MSSQLLocalDB; Initial catalog =elibrary; Integrated security=true");

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("select * from admin_login where username='" + TextBox1.Text + "' and pass='" + TextBox2.Text + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["username"] = dr[0];
                        Session["pass"] = dr[1];
                        Session["username"] = dr.GetValue(0).ToString();
                        Session["role"] = "admin";
                     //   Session["account_status"] = dr.GetValue(10).ToString();

                        Response.Write("<script>alert('login succesfully')</script>");
                    }
                    Response.Redirect("homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('invalid username')</script>");
                }
            }
            catch (Exception s)
            {
                Response.Write(s.Message);
            }
            con.Close();
        }
    }
}
    