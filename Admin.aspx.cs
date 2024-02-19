using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label6.Visible = false;
        TextBox1.Visible = false;
        TextBox2.Visible = false;
        TextBox3.Visible = false;
        TextBox4.Visible = false;
        TextBox5.Visible = false;
        TextBox6.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Studentsignup.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("facultysignup.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true;
        Label6.Visible = true;
        TextBox1.Visible = true;
        TextBox2.Visible = true;
        TextBox3.Visible = true;
        TextBox4.Visible = true;
        TextBox5.Visible = true;
        TextBox6.Visible = true;
    


    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        Label5.Visible = true;
        Label6.Visible = true;
        TextBox1.Visible = true;
        TextBox2.Visible = true;
        TextBox3.Visible = true;
        TextBox4.Visible = true;
        TextBox5.Visible = true;
        TextBox6.Visible = true;
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-3BR4UGH\\SQLEXPRESS;Initial Catalog=Project;Integrated Security=True");
        conn.Open();
     
        string id = TextBox1.Text;
        string name = TextBox2.Text;
        string credit = TextBox3.Text;
        string coor = TextBox4.Text;
        string offered = TextBox5.Text;
        string pre_req = TextBox6.Text;

        string query = "INSERT INTO COURSES1 (COURSE_ID, COURSE_NAME, CREDIT_HOURS, COURSE_COORDINATOR, COURSE_OFFERED, PRE_REQ) VALUES (@id, @name, @credit, @coor, @offered, @pre_req)";

        using (SqlCommand cm = new SqlCommand(query, conn))
        {
            cm.Parameters.AddWithValue("@id", id);
            cm.Parameters.AddWithValue("@name", name);
            cm.Parameters.AddWithValue("@credit", credit);
            cm.Parameters.AddWithValue("@coor", coor);
            cm.Parameters.AddWithValue("@offered", offered);
            cm.Parameters.AddWithValue("@pre_req", pre_req);
            cm.ExecuteNonQuery();
        }

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        
    }

    protected void Button5_Click1(object sender, EventArgs e)
    {
        Response.Redirect("AReport1.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("AReport2.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("AReport3.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowAudits.aspx");
    }
}