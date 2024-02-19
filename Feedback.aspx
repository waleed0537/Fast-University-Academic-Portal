<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedbackform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Label1
        {
           position:relative;
           
           
        }
          #Label2
        {
              position: relative;
    top: 120px;
    left: 931px;
        }
            #Label3
        {
               position: relative;
    top: 87px;
    
    left: 1075px;
        }
              #Label4
        {
                  position: relative;
    top: 54px;
    left: 1211px;
        }
              #Button1
              {
                   position:relative;
                    
             
             color: black;
  background-color:deepskyblue;
  border: 2px solid black;
  border-radius: 20px;
  padding: 10px 20px;
  transition: background-color 0.3s;
  width:70px;
              }
               #Button1:hover{
            background-color: blue;
            color: white;
        }
                #Button2
              {
                 position: relative;
                  top: 128px;
                      color: black;
  background-color:deepskyblue;
  border: 2px solid black;
  border-radius: 20px;
  padding: 10px 20px;
  transition: background-color 0.3s;
  width:70px;
              }
                 
                 #Button2:hover{
            background-color: blue;
            color: white;
        }
              TextBox1
              {
                   position:relative;
                   
              }
              TextBox2
              {
                   position:relative;
              }
              TextBox3
              {
                     position:relative;
              }
              TextBox4
              {
                   position:relative;
              }
              TextBox5
              {
                   position:relative;
              }
               #form1 {
            height: 630px;

        }
         
        body {
              background-color:aqua;
 
 
  
            
        }
        #form1 {
           background-color:slategrey;
            position:relative;
            width:1300px;
            border: 1px solid #ccc;
            padding: 20px;
              align-items:center;
              left:200px;
          top:100px;
       outline: 4px solid black;
  border-radius: 10px;
    transition: box-shadow 0.3s ease;
}
        #form1:hover
        {
             box-shadow: 0 0 10px 5px darkblue;
        }
        
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 41px">
        </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Course Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged1"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Show" />
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Q1 Points"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Q2 points"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Q3 points"></asp:Label>
        </p>
&nbsp;
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" GridLines="None" ForeColor="#333333" style="margin-left: 96px">
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
&nbsp;<br />
        <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
        <br />
        <br />
&nbsp;<br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
        <br />
        <br />
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        <br />
    </form>
</body>
</html>
