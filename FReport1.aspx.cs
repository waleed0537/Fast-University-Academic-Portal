using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FReport1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];
        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);
        // Establish the database connection using the connection string from the web.config
        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Create a SqlCommand object to execute the stored procedure
            using (SqlCommand command = new SqlCommand("TEACHER_FEEDBACK1", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add the faculty ID as a parameter to the SqlCommand
                command.Parameters.AddWithValue("@TEACHER_NAME", facultyID);

                // Execute the SqlCommand and load the results into a DataTable
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