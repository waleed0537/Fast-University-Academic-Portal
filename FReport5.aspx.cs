using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FReport5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = TextBox1.Text;


        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();


            using (SqlCommand command = new SqlCommand("STUDENT_EVALUATION_REPORT1", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@STUDENT_ID", id);

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
}