<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty_info.aspx.cs" Inherits="Faculty_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       
         .sidebar
           { 
               position: relative;
    background-color: black;
    height: 2000px;
    width: 247px;
    top: -389px;
    z-index:-1;
           }
      .heading
      {
         position: relative;
    left: 308px;
    top: -35px;
    text-decoration: underline;
    font-weight: bold;
    border: 0px solid black;
    padding: 10px;
    display: inline-block;
    outline: 5px solid black;
      }
        #form1 
        {
            height: 341px;
        }
         
        body 
        {
            background-color:white;
;
        }
        #form1 
        {
          height: 341px;
    position: relative;
    left: 273px;
            top: 4px;
        }
        #GridView1
        {
            position:relative;
            left:-18px;
            margin-bottom: 0px;
        }
        #Button1
        {
   z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    left: -245px;
    top: 110px;
        }
        #Button1:hover
        {
box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
        }
        #GridView2
        {
            position:relative;
            left:65px;
            
        }
         #Button2
        {
   z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    top: 480px;
    left: 92px;
}
        
        #Button2:hover
        {
box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
        }
         #Button3
        {
   z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
   top: 480px;
    left: 21px;
        }
        #Button3:hover
        {
box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
        }
        #Button4
        {
   z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    top: 480px;
    left: -50px;
        }
        #Button4:hover
        {
box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
        }
         #Button5
        {
   z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
  top: 480px;
    left: -125px;
        }
        #Button5:hover
        {
box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
        }
         #Button6
        {
   z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
 top: 480px;
    left: -206px;
        }
        #Button6:hover
        {
box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
        }
    </style>
</head>
<body>
 

    <form id="form1" runat="server">
     <h1 class="heading">&nbsp;Teachers Information</h1>   
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="FacultyID" HeaderText="Faculty ID" />
        <asp:BoundField DataField="FacultyPassword" HeaderText="Password" />
        <asp:BoundField DataField="FacultyGmail" HeaderText="Gmail" />
    </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
            

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Coarses" BorderWidth="1px" Height="70px" Width="200px" />
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Reviews" />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Grades" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Grades" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Attendance" />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Marks" />
    <asp:GridView ID="GridView2" runat="server" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" style="margin-right: 0px; top: 95px;" ForeColor="#333333" CellPadding="4" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:HyperLinkField DataTextField="Course_name" DataNavigateUrlFields="Course_Id" DataNavigateUrlFormatString="SetWeightage.aspx?courseid={0}" HeaderText="Course Name" />
    </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>


    &nbsp;
        <br />
        <br />


    </form>
       <div class="sidebar">

    </div>
</body>
</html>