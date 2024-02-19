using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

public partial class SetWeightage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        Button2.Visible = true;
        if (GridView1.Visible)
        {
            GridView1.Visible = false;
            if (Request.QueryString["courseID"] != null)
            {
                // Get the course ID from the query string

                int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

                // Get the faculty ID from the session
                int facultyID = (int)Session["FacultyID"];
                // Set the session variables for courseID and facultyID
                Session["courseID"] = Convert.ToInt32(Request.QueryString["courseID"]);
                Session["facultyID"] = (int)Session["FacultyID"];

                // Establish the database connection using the connection string from the web.config

                string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Create a SqlCommand object to execute the stored procedure
                    using (SqlCommand command = new SqlCommand("manageCourses1", connection))
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
                        }
                    }
                }
            }
        }
        else
        {
            GridView1.Visible = true;
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }





    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {


    }

    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }





    protected void Button2_Click(object sender, EventArgs e)
    {
        Button2.Visible = true;
        foreach (GridViewRow row in GridView1.Rows)
        {
            int a = 1;
            string studentID = row.Cells[0].Text;
            string attendance = "";
            RadioButton stpresent = (RadioButton)row.FindControl("Present");
            RadioButton stabsent = (RadioButton)row.FindControl("Absent");
            if (stpresent.Checked)
            {
                a = 2;

            }
            else if (stabsent.Checked)
            {
                a = 3;

            }
            if (a == 2)
            {
                attendance = "P";
            }
            else if (a == 3)
            {
                attendance = "A";
            }
            string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlConnection con1 = new SqlConnection(connectionString))
                {

                    con1.Open();
                    using (SqlCommand cmd = new SqlCommand("UpdateAttandenceAbesent3", con1))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@attendance", attendance);
                        cmd.Parameters.AddWithValue("@roll_no", studentID);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        
        // Get the course ID from the query string
        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        // Define a DataTable to hold the weightage data
        DataTable weightageData = new DataTable();
        weightageData.Columns.Add("EvalName");
        weightageData.Columns.Add("Weightage");

        // Add rows for each evaluation with the current weightage values
        weightageData.Rows.Add("QUIZ", 20);
        weightageData.Rows.Add("MID1", 20);
        weightageData.Rows.Add("MID2", 20);
        weightageData.Rows.Add("FINAL", 20);
        weightageData.Rows.Add("Assignment", 20);

        // Save the DataTable in a Session variable
        Session["WeightageData"] = weightageData;

        // Bind the GridView with the weightage data
        GridView2.DataSource = weightageData;
        GridView2.DataBind();

        // Show the GridView and hide Button3
        GridView2.Visible = true;
     //   Button3.Visible = false;
        Button4.Visible = true;
   
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        // Get the course ID from the query string
        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        // Retrieve the weightage data from the GridView
        DataTable weightageData = new DataTable();
        weightageData.Columns.Add("Component", typeof(string));
        weightageData.Columns.Add("Weightage", typeof(int));

        foreach (GridViewRow row in GridView2.Rows)
        {
            string component = ((TextBox)row.FindControl("txtEvalName")).Text;


            int weightage = Convert.ToInt32(((TextBox)row.FindControl("txtWeightage")).Text);

            weightageData.Rows.Add(component, weightage);
        }

        // Execute the update query using the retrieved weightage values
        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string query = "UPDATE COURSE_WEIGHTAGE1 SET QUIZ_WEIGHTAGE = @quiz, MID1_WEIGHTAGE = @MID1, MID2_WEIGHTAGE = @MID2,FINAL_WEIGHTAGE = @FINAL, ASSIGNMENT_WEIGHTAGE = @Ass WHERE COURSE_ID = @course_id AND FACULTY_ID = @faculty_id";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@faculty_id", facultyID);
                command.Parameters.AddWithValue("@course_id", courseID);
                command.Parameters.AddWithValue("@quiz", weightageData.Rows[0]["Weightage"]);
                command.Parameters.AddWithValue("@MID1", weightageData.Rows[1]["Weightage"]);
                command.Parameters.AddWithValue("@MID2", weightageData.Rows[2]["Weightage"]);
                command.Parameters.AddWithValue("@FINAL", weightageData.Rows[3]["Weightage"]);
                command.Parameters.AddWithValue("@Ass", weightageData.Rows[4]["Weightage"]);
                command.ExecuteNonQuery();
            }
        }

        // Hide the GridView and Button4, and show Button3
        GridView2.Visible = false;
        Button4.Visible = false;
        Button3.Visible = true;
    }







    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
    {

    }

    protected void Button4_Click1(object sender, EventArgs e)
    {
        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

        // Get the faculty ID from the session
        int facultyID = (int)Session["FacultyID"];

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm;
        string quiz = TextBox1.Text;
        string mid1 = TextBox2.Text;
        string mid2 = TextBox3.Text;
        string final = TextBox4.Text;
        string assignment = TextBox5.Text;
        string query = "UPDATE COURSE_WEIGHTAGE1 SET QUIZ_WEIGHTAGE = '" + quiz + "' , MID1_WEIGHTAGE = '" + mid1 + "' , MID2_WEIGHTAGE = '" + mid2 + "' , FINAL_WEIGHTAGE = '" + final + "' , ASSIGNMENT_WEIGHTAGE = '" + assignment + "' WHERE FACULTY_ID = '" + facultyID + "' AND COURSE_ID = '" + courseID + "'";
        cm = new SqlCommand(query, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();
        
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        int courseID = Convert.ToInt32(Request.QueryString["courseID"]);
        Response.Redirect("SetMarks.aspx?courseID=" + courseID);
    }

    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button6_Click1(object sender, EventArgs e)
    {
        if (GridView3.Visible)
        {
            GridView3.Visible = false;
            if (Request.QueryString["courseID"] != null)
            {
                // Get the course ID from the query string

                int courseID = Convert.ToInt32(Request.QueryString["courseID"]);

                // Get the faculty ID from the session
                int facultyID = (int)Session["FacultyID"];
                // Set the session variables for courseID and facultyID
                Session["courseID"] = Convert.ToInt32(Request.QueryString["courseID"]);
                Session["facultyID"] = (int)Session["FacultyID"];

                // Establish the database connection using the connection string from the web.config

                string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Create a SqlCommand object to execute the stored procedure
                    using (SqlCommand command = new SqlCommand("ShowFeedback", connection))
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
                        }
                    }
                }
            }
        }
        else
        {
            GridView3.Visible = true;
        }
        
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        //Response.Redirect("CGPA.aspx");
    }
}



