using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Studentsignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click2(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
        SqlCommand cm;
        string id = TextBox1.Text;
        string name = TextBox2.Text;
        string pass = TextBox3.Text;
        string section = TextBox4.Text;
        string email = TextBox5.Text;
        string father = TextBox6.Text;
        string arn = TextBox7.Text;
        string blood_groups = TextBox8.Text;


        string query = "Insert into STUDENTS1(STUDENT_ID,STUDENT_NAME,ST_PASSWORD,PARENT_SECTION,EMAIL,FatherName,ARN,Blood_groups) values ('" + id + "','" + name + "','" + pass + "','" + section + "','" + email + "','" + father + "','" + arn + "','" + blood_groups  + "')";
        cm = new SqlCommand(query, conn);
        cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();
    }
}