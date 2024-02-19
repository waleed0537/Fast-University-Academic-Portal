using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class facultysignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm;
        string id = TextBox1.Text;
        string name = TextBox2.Text;
        string email = TextBox3.Text;
        string pass = TextBox4.Text;
        string query = "Insert into FACULTY3(FACULTY_ID,FACULTY_NAME,FACULTY_EMAIL,FT_PASSWORD) values ('" + id + "','" + name + "','" + email + "','" + pass + "')";
        cm = new SqlCommand(query, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();
    }
}