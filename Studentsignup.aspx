<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Studentsignup.aspx.cs" Inherits="Studentsignup" %>

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
            #TextBox3
        {   
             position:relative;
             left:125px;
            

           background: hsl(0deg 0% 100%);
            box-shadow: 0 0 2em hsl(231deg 62% 94%);
            padding: 1em;
            display: flex;
            flex-direction: column;
            gap: 0.5em;
            border-radius: 20px;
            color: hsl(0deg 0% 30%);
            margin-top: 0em;
             height:10px;
        }
             #TextBox4
        {   
             position:relative;
             left:125px;
            

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
              #TextBox5
        {   
             position:relative;
             left:125px;
            

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
               #TextBox6
        {   
             position:relative;
             left:125px;
            

           background: hsl(0deg 0% 100%);
            box-shadow: 0 0 2em hsl(231deg 62% 94%);
            padding: 1em;
            display: flex;
            flex-direction: column;
            gap: 0.5em;
            border-radius: 20px;
            color: hsl(0deg 0% 30%);
            margin-top: -2em;
             height:10px;
        }
                #TextBox7
        {   
             position:relative;
             left:125px;
            

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

                 #TextBox8
        {   
             position:relative;
             left:125px;
            

           background: hsl(0deg 0% 100%);
            box-shadow: 0 0 2em hsl(231deg 62% 94%);
            padding: 1em;
            display: flex;
            flex-direction: column;
            gap: 0.5em;
            border-radius: 20px;
            color: hsl(0deg 0% 30%);
            margin-top: -2em;
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
            height: 590px;
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
            <asp:Label ID="Label1" runat="server" Text="Welcome to the Student Sighnup form" ></asp:Label>
             <img src="4.png" alt="Your Image" class="icon"/>
            <br />
            <br />
          
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" placeholder="Stu-ID/21I-XXXX"></asp:TextBox>
            <br />
            <br />
          
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Name"></asp:TextBox>
            <br />
            <br />
          
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" placeholder="Password"></asp:TextBox>
            <br />
            <br />
          
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" placeholder="Section"></asp:TextBox>
            <br />
            <br />
          
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" placeholder="Email"></asp:TextBox>
            <br />
            <br />
          
            <asp:TextBox ID="TextBox6" runat="server" placeholder="Name"></asp:TextBox>
            <br />
            <br />
            
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox7" runat="server" placeholder="ARN"></asp:TextBox>
            <br />
            <br />
                       <asp:TextBox ID="TextBox8" runat="server" placeholder="Blood group"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" BackColor="#006699" ForeColor="White" Text="Signup" OnClick="Button1_Click2" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>