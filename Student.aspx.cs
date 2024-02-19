using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      

    }


    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }



    protected void Button1_Click1(object sender, EventArgs e)
    {
        // Connect to the SQL Server database
        using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True"))
        {
            connection.Open();
            using (SqlCommand command = new SqlCommand("SELECT STUDENT_ID, STUDENT_NAME, ST_PASSWORD, PARENT_SECTION, EMAIL, FatherName ,ARN ,Blood_groups FROM STUDENTS1 WHERE STUDENT_ID = @StudentID AND ST_PASSWORD = @StudentPassword", connection))
            {
                command.Parameters.AddWithValue("@StudentID", TextBox1.Text);
                command.Parameters.AddWithValue("@StudentPassword", TextBox2.Text);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int studentID, arn;
                        string studentName, studentPassword, parentSection, studentGmail, fatherName, bloodgroups;

                        // Get the values from the database and store in variables
                        if (int.TryParse(reader["STUDENT_ID"].ToString(), out studentID) &&
                            int.TryParse(reader["ARN"].ToString(), out arn))
                        {
                            studentName = reader["STUDENT_NAME"].ToString();
                            studentPassword = reader["ST_PASSWORD"].ToString();
                            parentSection = reader["PARENT_SECTION"].ToString();
                            studentGmail = reader["EMAIL"].ToString();
                            fatherName = reader["FatherName"].ToString();
                            bloodgroups = reader["Blood_groups"].ToString();

                            // Store the values in session variables
                            Session["StudentID"] = studentID;
                            Session["StudentName"] = studentName;
                            Session["StudentPassword"] = studentPassword;
                            Session["ParentSection"] = parentSection;
                            Session["StudentGmail"] = studentGmail;
                            Session["FatherName"] = fatherName;
                            Session["ARN"] = arn;
                            Session["BloodGroups"] = bloodgroups;

                            // Redirect to student_info.aspx
                            Response.Redirect("student_info.aspx");
                        }
                    }
                }
            }
        }
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click2(object sender, EventArgs e)
    {
      

    }
}