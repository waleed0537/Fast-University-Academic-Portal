<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
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
    top: 41px;
    left:-60px;
             width: 244px;
         }

               #Button1:hover {
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
             width: 246px;
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
               top: -56px;
               left: 2px;
             width: 245px;
         }
               #Button4:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                   #Button4
              {
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
             top: -14px;
    left: 712px;
             
         }
                       #Button5
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
            top: 354px;
    left: 1px;
             width: 245px;
         }
                           #Button6
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
               top: 367px;
    left: 1px;
             width: 245px;
         }
                               #Button7
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
                   top: 378px;
    left: 0px;
             width: 245px;
         }
               #Button3:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}

          .icon {
          position: relative;
    height: 50px;
    width: 52px;
    left: 72px;
    top: -13px;
    border-radius: 50%;
    border: 2px solid black;
   z-index:1;
        }

            .sidebar
           { 
               position: relative;
    background-color: black;
    height: 2000px;
    width: 247px;
    top: -626px;
           }

          #form1 {
            height: 341px;
        }
         
        body {
            background-color: #ADD8E6;

        }
        #form1 {
           background-color: #ADD8E6;

            border: 1px solid #ccc;
            padding: 20px;
        }
        #TextBox1
        {position:relative;
             left:50px;
        }
        #TextBox2
        {position:relative;
          left:49px;
        }
        #TextBox3
        {position:relative;
          left:48px;
        }
        #TextBox4
        {position:relative;

          left:49px;
        }
        #TextBox5
        {position:relative;
          left:49px;
        }
        #TextBox6
        {position:relative;
          left:52px;
        }
        .div1
        {
              border: 5px solid black;
    
    position: relative;
    left: 386px;
    background-color:gray;
    width: 368px;
        }
          #Button5:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
            #Button6:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
              #Button7:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
              #Button8{
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
               top: 387px;
             width: 246px;

              }
               #Button8:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img src="4.png" alt="Your Image" class="icon"/>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register Student" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Register faculty" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Offer courses" OnClick="Button3_Click" />
            <br />
            <br />
            <div class="div1">
            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Credit hrs"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Course Coordinator"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Offering"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Pre Req"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
                </div>
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Offer" />
        </div>
         <div class="sidebar">

             <asp:Button ID="Button5" runat="server" OnClick="Button5_Click1" Text="Students" />
             <asp:Button ID="Button6" runat="server" Text="Courses info" OnClick="Button6_Click" />
             <asp:Button ID="Button7" runat="server" Text="Courses offered" OnClick="Button7_Click" />
               <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Audit Trail" />

        </div>
      
    </form>
</body>
</html>