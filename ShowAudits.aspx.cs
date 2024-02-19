using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowAudits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string connectionString = ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();


            using (SqlCommand command = new SqlCommand("ShowAudit", connection))
            {
                command.CommandType = CommandType.StoredProcedure;


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