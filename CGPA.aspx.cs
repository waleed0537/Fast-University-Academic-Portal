using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CGPA : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get the student ID from the session variable
            int studentID = (int)Session["StudentID"];
            
            // Execute the query with the student ID parameter
            string query = "SELECT SEMESTER, CGPA FROM CGPA1 WHERE STUDENT_ID = @studentID";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True"))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@studentID", 5371);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            // Read the results
                            while (reader.Read())
                            {
                                object semesterObj = reader.GetValue(0);
                                string semester = semesterObj != null ? semesterObj.ToString() : "";

                                object cgpaObj = reader.GetValue(1);
                                float cgpa = cgpaObj != null ? (float)cgpaObj : 0;

                                // Do something with the results

                                Chart1.Series["Series1"].Points.AddXY(semester, cgpa);
                                  Chart1.DataBind();
                            }

                          
                        }
                       
                    }
                }
            }
          
        }
    }
 }