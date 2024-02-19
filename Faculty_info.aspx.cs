using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Drawing;


public partial class Faculty_info : System.Web.UI.Page
{
    public int idglob;
    public int idglob2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["FacultyID"] != null)
            {
                int FacultyID = Convert.ToInt32(Session["FacultyID"]);
                string FacultyName = Session["FacultyName"].ToString();
                string FacultyPassword = Session["FacultyPassword"].ToString();
                
                string FacultyGmail = Session["FacultyGmail"].ToString();
            
                

                GridView1.DataSource = new[] { new { FacultyID = FacultyID, FacultyPassword = FacultyPassword, FacultyGmail = FacultyGmail } };
                GridView1.DataBind();
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Handle the selected index change event here
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Handle the selected index change event here
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // Get the faculty ID from the session
            int facultyID = (int)Session["FacultyID"];

            // Establish the database connection using the connection string from the web.config
            string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SqlCommand object to execute the stored procedure
                using (SqlCommand command = new SqlCommand("showCourses", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add the faculty ID as a parameter to the SqlCommand
                    command.Parameters.AddWithValue("@faculty_id", facultyID);

                    // Execute the SqlCommand and load the results into a DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dtCourses = new DataTable();
                        adapter.Fill(dtCourses);

              
                        foreach (DataRow row in dtCourses.Rows)
                        {
                            int courseID = Convert.ToInt32(row["COURSE_ID"]);
                            string courseName = row["COURSE_NAME"].ToString();

                            Session["COURSE_NAME"] = courseName;
                            Session["COURSE_ID"] = courseID;
                            idglob2 = courseID; ;

                        }

                        // Bind the DataTable to the GridView
                        GridView2.DataSource = dtCourses;
                        GridView2.DataBind();   
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
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = GridView2.Rows[index];
            TableCell courseIDCell = selectedRow.Cells[1];
            TableCell courseNameCell = selectedRow.Cells[2];
            TableCell facultyIDCell = selectedRow.Cells[3];
            string courseID = courseIDCell.Text;
            string courseName = courseNameCell.Text;
            int facultyID = int.Parse(facultyIDCell.Text);
            idglob = facultyID;
            // Set the session variables
            Session["COURSE_ID"] = courseID;
            Session["COURSE_NAME"] = courseName;
            Session["FacultyID"] = facultyID;

            // Redirect to the SetWeightage page
            Response.Redirect("SetWeightage.aspx?courseID=" + courseID);

        }
    }







    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("FReport5.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("FReport1.aspx?courseID=" + idglob);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("FReport2.aspx?courseID=" + idglob2);
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("FReport3.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("FReport4.aspx");
    }
}