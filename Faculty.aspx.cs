using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True"))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT FACULTY_ID, FACULTY_NAME, FACULTY_EMAIL, FT_PASSWORD FROM FACULTY3 WHERE FACULTY_ID = @FacultyID AND FT_PASSWORD = @FacultyPassword", connection))
                {
                    command.Parameters.AddWithValue("@FacultyID", TextBox1.Text);
                    command.Parameters.AddWithValue("@FacultyPassword", TextBox2.Text);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int FacultyID;
                            string FacultyName, FacultyPassword, FacultyGmail;

                            // Get the values from the database and store in variables
                            if (int.TryParse(reader["FACULTY_ID"].ToString(), out FacultyID))
                            {
                                FacultyName = reader["FACULTY_NAME"].ToString();
                                FacultyPassword = reader["FT_PASSWORD"].ToString();
                                FacultyGmail = reader["FACULTY_EMAIL"].ToString();

                                // Store the values in session variables
                                Session["FacultyID"] = FacultyID;
                                Session["FacultyName"] = FacultyName;
                                Session["FacultyPassword"] = FacultyPassword;
                                Session["FacultyGmail"] = FacultyGmail;
                                
                                // Redirect to faculty_info.aspx
                                Response.Redirect("Faculty_info.aspx");
                            }
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception or display an error message to the user
            Console.WriteLine(ex.Message);
        }
    }


   
}