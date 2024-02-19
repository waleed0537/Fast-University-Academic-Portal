<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetWeightage.aspx.cs" Inherits="SetWeightage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <style type="text/css">
           .icon{
              position: relative;
    height: 50px;
    width: 52px;
    left: 72px;
    top: -20px;
    border-radius: 50%;
    border: 2px solid black;
    z-index: 1;
           }
           .div3
           {
                position: relative;
    background-color: white;
    left: 248px;

           }
           .div2{
               position: relative;
    background-color: white;
    left: 248px;

           }
           .sidebar
           {
     position: relative;
    background-color: black;
    height: 2000px;
    width: 247px;
    top: -1511px;
    z-index:-1;
           }
           .Wbox
           {
 height: 247px;
    width: 198px;
    position: relative;
    left: 723px;
    top: -249px;
    background-color: blue;
    
           }
          .Wbox .UI {
               border-radius: 20px;
               position:relative;
               left:8px;

  margin-bottom: 17px; /* Change the value as per your requirement */
  border: 1px solid #ccc; /* Add border for better visibility */
  padding: 5px; /* Add padding for better spacing */
}
           #Button1
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
    top: 38px;
    left: -59px;
    height: 59px;
    width: 246px;
           }
           #GridView1
    {
                width: 268px;
    position: relative;
    left: 211px;
           }
           #GridView3
    {
              width: 268px;
    position: relative;
    left: 367px;
    top: -457px;
           }
           #lblStudentID
           {

           }
           #Button2
           {
    z-index: 1;
    border-style: none;
    border-color: inherit;
    border-width: medium;
    background-color: #4a14ef;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    border-radius: 14px;
    height: 37px;

    top: -35px;
    left: 766px;
   
    position: relative;
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
               top: 39px;
               left: 0px;
             height: 58px;
    width: 247px;
           }
           #GridView2
           {
              width: 268px;
    position: relative;
    left: 211px;

           }
             #Button4
           {
                 top: -263px;
    left: 776px;
     z-index: 1;
    border-style: none;
    border-color: inherit;
    border-width: medium;
    position: relative;
    background-color: #4a14ef;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
     height: 37px;
    border-radius: 14px;
           }
               #Button5
           {
             background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    top: -500px;
    left: 0px;
    height: 58px;
    width: 247px;
    position: relative;
}
           
                 #Button6
           {
                 border-width: medium;
    position: relative;
    background-color: #222;
    color: white;
    padding: 10px;
    margin-bottom: 20px;
    cursor: pointer;
    top: -445px;
    left: 0px;
    height: 58px;
    width: 247px;
           }
                   #Button1:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                     #Button2:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                       #Button3:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                         #Button4:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                           #Button5:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                             #Button6:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
            </style>
</head>
<body>
    <form id="form1" runat="server">
      
       

0        
            <br />
            <br />
         <img src="4.png" alt="Your Image" class="icon"/>
            <asp:Button ID="Button1" runat="server" Text="Attendance" OnClick="Button1_Click" />
     
        <div class="div3">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged2" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                <asp:BoundField DataField="student_name" HeaderText="Student Name" />
                <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                <asp:BoundField DataField="section_name" HeaderText="Section Name" />
                <asp:TemplateField HeaderText="Attendance">
                    <ItemTemplate>
                        <asp:RadioButton ID="Present" runat="server" GroupName='<%# Eval("student_id") %>' Text="Present" onclick="updateStudentIDLabel(this)" />
                        <asp:RadioButton ID="Absent" runat="server" GroupName='<%# Eval("student_id") %>' Text="Absent" onclick="updateStudentIDLabel(this)" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
            </div>
        <asp:Label ID="lblStudentID" runat="server" Text=""></asp:Label>

        <script type="text/javascript">
            function updateStudentIDLabel(radioButton) {
                var label = document.getElementById('<%= lblStudentID.ClientID %>');
                label.innerHTML = radioButton.parentNode.parentNode.cells[0].innerHTML;
            }
        </script>

        <br />
        <br />
        
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
        
        <br />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Set Weightage" />
        <br />
        <br />
        <div class="div2">
     <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
         <AlternatingRowStyle BackColor="#DCDCDC" />
    <Columns>
        <asp:BoundField DataField="EvalName" HeaderText="Eval Name" />
        <asp:TemplateField HeaderText="Weightage">
            <ItemTemplate>
                <asp:TextBox runat="server" ID="txtEvalWeightage" Text='<%# Eval("Weightage") %>'></asp:TextBox>
                <asp:Label runat="server" Text=" (1 to 100)" />
            </ItemTemplate>
            <HeaderStyle Width="150px" />
        </asp:TemplateField>
    </Columns>
         <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
         <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
         <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
         <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F1F1F1" />
         <SortedAscendingHeaderStyle BackColor="#0000A9" />
         <SortedDescendingCellStyle BackColor="#CAC9C9" />
         <SortedDescendingHeaderStyle BackColor="#000065" />
</asp:GridView>
   </div>


        <div id="Wbox" class="Wbox">
        <br />
        <asp:TextBox ID="TextBox1" runat="server" CssClass="UI"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" CssClass="UI"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox3" runat="server" CssClass="UI"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" CssClass="UI"></asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox5" runat="server" CssClass="UI"></asp:TextBox>
        <br />
        </div>



        <br />
        
        <asp:Button ID="Button4" runat="server" Text="Update" OnClick="Button4_Click1" />
        
        <br />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Set Marks" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click1" Text="Course feedback" />
        <br />
        <br />
        <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
          <div class="sidebar">

         </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        
        <br />
    </form>
    <script>
        function showDiv() {
            document.getElementById("Wbox").style.display = "block";
        }
    </script>
</body>
</html>
