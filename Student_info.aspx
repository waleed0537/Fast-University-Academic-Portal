<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student_info.aspx.cs" Inherits="Student_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
         
    </title>
       
       <style type="text/css">
      .icon {
          position: relative;
    height: 50px;
    width: 52px;
    left: 72px;
    top: -70px;
    border-radius: 50%;
    border: 2px solid black;
   z-index:1;
        }
           .divGridView1{
               position:relative;
               background-color:#ADD8E6;
               width:1165px;
                overflow:hidden;
           }
           .sidebar
           { 
               position: relative;
    background-color: black;
    height: 2000px;
    width: 247px;
    top: -850px;
           }
           #btnShowCourses
        {  
    z-index: 1;
    border-style: none;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    top: 40px;
    left: -57px;
}
           
           #btnShowCourses:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}

           #GridView1
           {
                 position:relative;
                 left:255px;
               top: 0px;
               width: 1086px;
           }
              #Button4
        {
                   z-index:1;
            border-style: none;
               border-color: inherit;
               border-width: medium;
               position:relative;
               background-color: #222;
               color: white;
               padding: 10px;
               margin-bottom: 20px;
               cursor: pointer;
               top: 1px;
               left: 2px;
           }
               #Button4:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
              #Button2
              {
                   z-index:1;
            border-style: none;
               border-color: inherit;
               border-width: medium;
               position:relative;
               background-color: #222;
               color: white;
               padding: 10px;
               margin-bottom: 20px;
               cursor: pointer;
               top: 1px;
               left: 2px;
           }
#Button2:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
               #Button3
              {
                    z-index:1;
            border-style: none;
               border-color: inherit;
               border-width: medium;
               position:relative;
               background-color: #222;
               color: white;
               padding: 10px;
               margin-bottom: 20px;
               cursor: pointer;
               top: 1px;
               left: 2px;
           }
               #Button3:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}

                 #Button7
              {
                   z-index: 1;
    border-style: none;
    border-color: inherit;
    border-width: medium;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    top: 105px;
    left: -203px;
           }
               #Button7:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}

           #Label1
        {   position:relative;
            top:-3px;
            left:450px;
            color:blue;
          text-decoration: underline;
			font-weight: bold;
			border: 1px solid black;
			padding: 10px;
			display: inline-block;
			outline: 2px solid black;

        }

        #form1 {
            height: 341px;
        }
         
        body {
            background-color: #ADD8E6;
;
        }
        #form1 {
           background-color: #ADD8E6;

            border: 1px solid #ccc;
            padding: 20px;
        }
           #gvCourses 
           {

           }
       
    </style>
</head>
<body>

    <form id="form1" runat="server">
        
        
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Welcome to the flex"></asp:Label>
        <p>
            &nbsp;</p>
              <img src="4.png" alt="Your Image" class="icon"/>
        <asp:Button ID="btnShowCourses" runat="server" Text="Courses" OnClick="btnShowCourses_Click" BorderWidth="1px" Height="70px" Width="200px" />
        <br />
        <br />
        <asp:GridView ID="gvCourses" runat="server" CellPadding="4" GridLines="None" OnSelectedIndexChanged="gvCourses_SelectedIndexChanged" HorizontalAlign="Center" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
      
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Course Feedback" Height="70px" Width="200px"   
            border-style="none"
               border-color="inherit"
               border-width="medium"
               position="relative"
               background-color="#222"
               color="white"
               padding="10px"
               margin-bottom="20px"
               cursor="pointer"
               
               top="1px"
               left="2px"/>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Marks" Height="70px" Width="200px" />
       
        <div style="display: flex">
            <div class="divGridView1">
   <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" HorizontalAlign="Center">
       <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
        <asp:BoundField DataField="StudentFirstName" HeaderText="Name" />
        <asp:BoundField DataField="StudentPassword" HeaderText="Password" />
        <asp:BoundField DataField="Parentsection" HeaderText="Parent Section" />
        <asp:BoundField DataField="StudentGmail" HeaderText="Gmail" />
        <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
        <asp:BoundField DataField="ARN" HeaderText="ARN " />
        <asp:BoundField DataField="Blood_groups" HeaderText="Blood Group" />
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
                </div>



        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectConnectionString %>" SelectCommand="SELECT * FROM [STUDENTS1]"></asp:SqlDataSource>
</div>


        <p>
        <asp:Button ID="Button3" runat="server" Text="Attendance" OnClick="Button3_Click" Height="70px" Width="200px" />
          <asp:Button ID="Button7" runat="server" Height="70px"  Text="GPA-Chart" OnClick="Button7_Click" Width="200px" />
            </p>
        <p>
            &nbsp;</p>
            
   <div class="sidebar">

        </div>
    
    </form>
       
</body>
</html>