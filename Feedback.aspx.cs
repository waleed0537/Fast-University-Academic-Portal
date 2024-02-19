using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class Feedbackform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }





    protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
    {


    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {
       
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string id = TextBox1.Text;
        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand("TAKEFEEDBACK4", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@course_name", id);

                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                   DataTable dtCourses = new DataTable();
                    adapter.Fill(dtCourses);
                    GridView1.DataSource = dtCourses;
                    GridView1.DataBind();
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       
        string id = TextBox1.Text;
        string ans1 = TextBox3.Text;
        string ans2 = TextBox4.Text;
        string ans3 = TextBox5.Text;
        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand("UPDATEFEEDBACK", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add parameters to the stored procedure
                command.Parameters.AddWithValue("@course_name", id);
                command.Parameters.AddWithValue("@p1", ans1);
                command.Parameters.AddWithValue("@p2", ans2);
                command.Parameters.AddWithValue("@p3", ans3);

              command.ExecuteNonQuery();

            }
        }

    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}