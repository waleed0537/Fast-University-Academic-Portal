using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SetMarks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // Get the course ID from the query string

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Store the student IDs in session variables


        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Create a SqlCommand object to execute the stored procedure
            using (SqlCommand command = new SqlCommand("Mid1marks1", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add the faculty ID and course ID as parameters to the SqlCommand
                command.Parameters.AddWithValue("@faculty_id", facultyID);

                command.Parameters.AddWithValue("@course_id", courseID);

                // Execute the SqlCommand and load the results into a DataTable
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dtCourses = new DataTable();
                    adapter.Fill(dtCourses);

                    // Bind the DataTable to the GridView
                    GridView2.DataSource = dtCourses;
                    GridView2.DataBind();
                    string studentID1 = GridView2.Rows[0].Cells[0].Text;
                    string studentID2 = GridView2.Rows[1].Cells[0].Text;
                    Session["StudentID1"] = studentID1;
                    Session["StudentID2"] = studentID2;
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        // Get the course ID from the query string

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Store the student IDs in session variables


        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Create a SqlCommand object to execute the stored procedure
            using (SqlCommand command = new SqlCommand("Quizmarks", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add the faculty ID and course ID as parameters to the SqlCommand
                command.Parameters.AddWithValue("@faculty_id", facultyID);

                command.Parameters.AddWithValue("@course_id", courseID);

                // Execute the SqlCommand and load the results into a DataTable
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dtCourses = new DataTable();
                    adapter.Fill(dtCourses);

                    // Bind the DataTable to the GridView
                    GridView1.DataSource = dtCourses;
                    GridView1.DataBind();
                    string studentID1 = GridView1.Rows[0].Cells[0].Text;
                    string studentID2 = GridView1.Rows[1].Cells[0].Text;
                    Session["StudentID1"] = studentID1;
                    Session["StudentID2"] = studentID2;
                }
            }
        }


    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        //  string studentID1 = (string)Session["StudentID1"];
        //  string studentID2 = (string)Session["StudentID2"];
        string studentID1 = (string)Session["StudentID1"];
        string studentID2 = (string)Session["StudentID2"];

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm, cm1;
        string quiz1 = TextBox1.Text;
        string quiz2 = TextBox2.Text;
        string query1 = "UPDATE COURSE_MARKS_OBTAINED SET QUIZ_OBTAINED_MARKS = '" + quiz1 + "' WHERE STUDENT_ID = '" + studentID1 + "' AND COURSE_ID = '" + courseID + "'";


        string query2 = "UPDATE COURSE_MARKS_OBTAINED SET QUIZ_OBTAINED_MARKS = '" + quiz2 + "' WHERE STUDENT_ID = '" + studentID2 + "' AND COURSE_ID = '" + courseID + "'";


        cm = new SqlCommand(query1, conn);
        cm1 = new SqlCommand(query2, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        cm1.ExecuteNonQuery();
        cm1.Dispose();
        conn.Close();
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        //  string studentID1 = (string)Session["StudentID1"];
        //  string studentID2 = (string)Session["StudentID2"];
        string studentID1 = (string)Session["StudentID1"];
        string studentID2 = (string)Session["StudentID2"];

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm, cm1;
        string quiz1 = TextBox3.Text;
        string quiz2 = TextBox4.Text;
        string query1 = "UPDATE COURSE_MARKS_OBTAINED SET MID1_OBTAINED_MARKS = '" + quiz1 + "' WHERE STUDENT_ID = '" + studentID1 + "' AND COURSE_ID = '" + courseID + "'";


        string query2 = "UPDATE COURSE_MARKS_OBTAINED SET MID1_OBTAINED_MARKS = '" + quiz2 + "' WHERE STUDENT_ID = '" + studentID2 + "' AND COURSE_ID = '" + courseID + "'";


        cm = new SqlCommand(query1, conn);
        cm1 = new SqlCommand(query2, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        cm1.ExecuteNonQuery();
        cm1.Dispose();
        conn.Close();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        // Get the course ID from the query string

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Store the student IDs in session variables


        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Create a SqlCommand object to execute the stored procedure
            using (SqlCommand command = new SqlCommand("Mid2marks2", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add the faculty ID and course ID as parameters to the SqlCommand
                command.Parameters.AddWithValue("@faculty_id", facultyID);

                command.Parameters.AddWithValue("@course_id", courseID);

                // Execute the SqlCommand and load the results into a DataTable
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dtCourses = new DataTable();
                    adapter.Fill(dtCourses);

                    // Bind the DataTable to the GridView
                    GridView3.DataSource = dtCourses;
                    GridView3.DataBind();
                    string studentID1 = GridView3.Rows[0].Cells[0].Text;
                    string studentID2 = GridView3.Rows[1].Cells[0].Text;
                    Session["StudentID1"] = studentID1;
                    Session["StudentID2"] = studentID2;
                }
            }
        }
    }

    protected void Button8_Click1(object sender, EventArgs e)
    {
        //  string studentID1 = (string)Session["StudentID1"];
        //  string studentID2 = (string)Session["StudentID2"];
        string studentID1 = (string)Session["StudentID1"];
        string studentID2 = (string)Session["StudentID2"];

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm, cm1;
        string quiz1 = TextBox5.Text;
        string quiz2 = TextBox6.Text;
        string query1 = "UPDATE COURSE_MARKS_OBTAINED SET MID2_OBTAINED_MARKS = '" + quiz1 + "' WHERE STUDENT_ID = '" + studentID1 + "' AND COURSE_ID = '" + courseID + "'";


        string query2 = "UPDATE COURSE_MARKS_OBTAINED SET MID2_OBTAINED_MARKS = '" + quiz2 + "' WHERE STUDENT_ID = '" + studentID2 + "' AND COURSE_ID = '" + courseID + "'";


        cm = new SqlCommand(query1, conn);
        cm1 = new SqlCommand(query2, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        cm1.ExecuteNonQuery();
        cm1.Dispose();
        conn.Close();
    }

    protected void TextBox7_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        // Get the course ID from the query string

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Store the student IDs in session variables


        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Create a SqlCommand object to execute the stored procedure
            using (SqlCommand command = new SqlCommand("Finalmarks", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add the faculty ID and course ID as parameters to the SqlCommand
                command.Parameters.AddWithValue("@faculty_id", facultyID);

                command.Parameters.AddWithValue("@course_id", courseID);

                // Execute the SqlCommand and load the results into a DataTable
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dtCourses = new DataTable();
                    adapter.Fill(dtCourses);

                    // Bind the DataTable to the GridView
                    GridView4.DataSource = dtCourses;
                    GridView4.DataBind();
                    string studentID1 = GridView4.Rows[0].Cells[0].Text;
                    string studentID2 = GridView4.Rows[1].Cells[0].Text;
                    Session["StudentID1"] = studentID1;
                    Session["StudentID2"] = studentID2;
                }
            }
        }
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
       
        string studentID1 = (string)Session["StudentID1"];
        string studentID2 = (string)Session["StudentID2"];

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm, cm1;
        string quiz1 = TextBox7.Text;
        string quiz2 = TextBox8.Text;
        string query1 = "UPDATE COURSE_MARKS_OBTAINED SET FINAL_OBTAINED_MARKS = '" + quiz1 + "' WHERE STUDENT_ID = '" + studentID1 + "' AND COURSE_ID = '" + courseID + "'";


        string query2 = "UPDATE COURSE_MARKS_OBTAINED SET FINAL_OBTAINED_MARKS = '" + quiz2 + "' WHERE STUDENT_ID = '" + studentID2 + "' AND COURSE_ID = '" + courseID + "'";


        cm = new SqlCommand(query1, conn);
        cm1 = new SqlCommand(query2, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        cm1.ExecuteNonQuery();
        cm1.Dispose();
        conn.Close();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {


        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        int facultyID = (int)Session["FacultyID"];

        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Create a SqlCommand object to execute the stored procedure
            using (SqlCommand command = new SqlCommand("Assignmentmarks2", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Add the faculty ID and course ID as parameters to the SqlCommand
                command.Parameters.AddWithValue("@faculty_id", facultyID);

                command.Parameters.AddWithValue("@course_id", courseID);

                // Execute the SqlCommand and load the results into a DataTable
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    DataTable dtCourses = new DataTable();
                    adapter.Fill(dtCourses);

                    // Bind the DataTable to the GridView
                    GridView5.DataSource = dtCourses;
                    GridView5.DataBind();
                    string studentID1 = GridView5.Rows[0].Cells[0].Text;
                    string studentID2 = GridView5.Rows[1].Cells[0].Text;
                    Session["StudentID1"] = studentID1;
                    Session["StudentID2"] = studentID2;
                }
            }
        }
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
       
       
        string studentID1 = (string)Session["StudentID1"];
        string studentID2 = (string)Session["StudentID2"];

        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        
        int facultyID = (int)Session["FacultyID"];
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm, cm1;
        string quiz1 = TextBox9.Text;
        string quiz2 = TextBox10.Text;
        string query1 = "UPDATE COURSE_MARKS_OBTAINED SET ASSIGNMENT_OBTAINED_MARKS = '" + quiz1 + "' WHERE STUDENT_ID = '" + studentID1 + "' AND COURSE_ID = '" + courseID + "'";
        string query2 = "UPDATE COURSE_MARKS_OBTAINED SET ASSIGNMENT_OBTAINED_MARKS = '" + quiz2 + "' WHERE STUDENT_ID = '" + studentID2 + "' AND COURSE_ID = '" + courseID + "'";
        cm = new SqlCommand(query1, conn);
        cm1 = new SqlCommand(query2, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        cm1.ExecuteNonQuery();
        cm1.Dispose();
        conn.Close();
    }
}