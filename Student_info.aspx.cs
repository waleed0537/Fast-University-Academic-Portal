using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_info : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
                if (Session["StudentID"] != null)
                {
                    int studentID = Convert.ToInt32(Session["StudentID"]);
                    string studentName = Session["StudentName"].ToString();
                    string studentPassword = Session["StudentPassword"].ToString();
                    string parentSection = Session["ParentSection"].ToString();
                    string studentGmail = Session["StudentGmail"].ToString();
                    string fatherName = Session["FatherName"].ToString();
                    int arn = Convert.ToInt32(Session["ARN"]);
                    string bloodgroups = Session["BloodGroups"].ToString();

                    GridView1.DataSource = new[] { new { StudentID = studentID, StudentPassword = studentPassword, Parentsection = parentSection, StudentFirstName = studentName, StudentGmail = studentGmail, FatherName = fatherName, ARN = arn, Blood_groups = bloodgroups } };
                    GridView1.DataBind();
                }
            }
        

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            // Get the roll number (StudentID) from the session
            int studentID = (int)Session["StudentID"];

            // Establish the database connection using the connection string from the web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SqlCommand object to execute the stored procedure
                using (SqlCommand command = new SqlCommand("SHOWMARKS1", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the roll number (StudentID) as a parameter to the SqlCommand
                    command.Parameters.AddWithValue("@student_id", studentID);

                    // Execute the SqlCommand and load the results into a DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dtCourses = new DataTable();
                        adapter.Fill(dtCourses);

                        // Bind the DataTable to the GridView
                        gvCourses.DataSource = dtCourses;
                        gvCourses.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception message
            // You can replace the following line with a proper logging mechanism
            Response.Write("Error: " + ex.Message);
        }
    }

    protected void btnShowCourses_Click(object sender, EventArgs e)
    {
        try
        {
            // Get the roll number (StudentID) from the session
            int studentID = (int)Session["StudentID"];

            // Establish the database connection using the connection string from the web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SqlCommand object to execute the stored procedure
                using (SqlCommand command = new SqlCommand("PreReqCheck12", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the roll number (StudentID) as a parameter to the SqlCommand
                    command.Parameters.AddWithValue("@roll_no", studentID);

                    // Execute the SqlCommand and load the results into a DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dtCourses = new DataTable();
                        adapter.Fill(dtCourses);

                        // Bind the DataTable to the GridView
                        gvCourses.DataSource = dtCourses;
                        gvCourses.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception message
            // You can replace the following line with a proper logging mechanism
            Response.Write("Error: " + ex.Message);
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }





    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            // Get the roll number (StudentID) from the session
            int studentID = (int)Session["StudentID"];

            // Establish the database connection using the connection string from the web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SqlCommand object to execute the stored procedure
                using (SqlCommand command = new SqlCommand("DisplayAttendance1", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the roll number (StudentID) as a parameter to the SqlCommand
                    command.Parameters.AddWithValue("@roll_no", studentID);

                    // Execute the SqlCommand and load the results into a DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dtCourses = new DataTable();
                        adapter.Fill(dtCourses);

                        // Bind the DataTable to the GridView
                        gvCourses.DataSource = dtCourses;
                        gvCourses.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception message
            // You can replace the following line with a proper logging mechanism
            Response.Write("Error: " + ex.Message);
        }
    }

    protected void gvCourses_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedback.aspx");    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("CGPA.aspx");
    }
}