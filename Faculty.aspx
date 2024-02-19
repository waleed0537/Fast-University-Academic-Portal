<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Faculty.aspx.cs" Inherits="Faculty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #HyperLink1
        {
            position:relative;
            left:140px
        }
        #Button1 
        {
                position:relative;
             left:180px;
             color: black;
  background-color:white;
  border: 2px solid black;
  border-radius: 20px;
  padding: 10px 20px;
  transition: background-color 0.3s;
        }
        #Button1:hover{
            background-color: blue;
            color: white;
        }
        #TextBox1 {
              position:relative;
             left:125px;


             top:35px;
            background: hsl(0deg 0% 100%);
            box-shadow: 0 0 2em hsl(231deg 62% 94%);
            padding: 1em;
            display: flex;
            flex-direction: column;
            gap: 0.5em;
            border-radius: 20px;
            color: hsl(0deg 0% 30%);
            margin-top: -3em;
            height:10px;
        }
        
         #TextBox2
        {   
             position:relative;
             left:125px;
             top:35px;

           background: hsl(0deg 0% 100%);
            box-shadow: 0 0 2em hsl(231deg 62% 94%);
            padding: 1em;
            display: flex;
            flex-direction: column;
            gap: 0.5em;
            border-radius: 20px;
            color: hsl(0deg 0% 30%);
            margin-top: -3em;
             height:10px;
        }
          .icon {
     position: relative;
    height: 50px;

    width: 52px;
    left: -68px;
    top: 33px;
    border-radius: 50%;
    border: 2px solid black;
    z-index: 1;
        }
        #Label1
        {
          position: relative;
    top: -44px;
    left: 95px;
    color: black;
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
              background-image: url('FF.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
            
        }
        #form1 {
           background-color:slategrey;
            position:relative;
            width:450px;
            border: 1px solid #ccc;
            padding: 20px;
              align-items:center;
              left:350px;
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
        <div style="height: 335px">
            <asp:Label ID="Label1" runat="server" Text="Welcome to the Faculity login form" ></asp:Label>
             <img src="4.png" alt="Your Image" class="icon"/>
            <br />
            <br />
            <br />
   
<asp:TextBox ID="TextBox1" runat="server" placeholder="Stu-ID/21I-XXXX" CssClass="textbox-design"></asp:TextBox>

            <br />
            <br />
            <br />
            
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Password*"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" BackColor="#006699" Text="Login" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server"  Font-Bold="True"  Font-Names="Bahnschrift SemiBold" Font-Size="Small" ForeColor="Black"  NavigateUrl="~/Studentsignup.aspx">Not registered? Register now</asp:HyperLink>
        </div>
    </form>
</body>
</html>
</body>
</html>
