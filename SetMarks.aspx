<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetMarks.aspx.cs" Inherits="SetMarks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style type="text/css">
           .icon {
          position: relative;
    height: 50px;
    width: 52px;
    left: 72px;
    top: -10px;
    border-radius: 100%;
    border: 2px solid black;
   z-index:1;
        }
                  .sidebar
           {
     position: relative;
    background-color: black;
    height: 3000px;
    width: 247px;
    top: -2500px;
    z-index:-1;
           }
          #Button1
        {
            position:relative;
              top: 108px;
              left: -60px;
               z-index: 1;
                border-style: none;
                background-color: #222;
                color: white;
                padding: 10px;
                margin-bottom: 20px;
                cursor: pointer;
              width: 252px;
              height: 64px;
          }
          #Button2 
          {
               position:relative;
              top: 54px;
              left: 6px;
              z-index: 1;
                border-style: none;
                background-color: #222;
                color: white;
                padding: 10px;
                margin-bottom: 20px;
                cursor: pointer;
                 width: 246px;
              height: 64px;
          }
          #Button3 
          {
               position:relative;
              top: 76px;
              left: 4px;
              z-index: 1;
                border-style: none;
                background-color: #222;
                color: white;
                padding: 10px;
                margin-bottom: 20px;
                cursor: pointer;
                 width: 252px;
              height: 64px;
          }
          #Button4 
          {
               position:relative;
              top: 57px;
              left: 10px;
              z-index: 1;
                border-style: none;
                background-color: #222;
                color: white;
                padding: 10px;
                margin-bottom: 20px;
                cursor: pointer;
                 width: 242px;
              height: 64px;
          }
          #Button5 
          {
               position:relative;
              top: 74px;
              left: -5px;
              z-index: 1;
                border-style: none;
                background-color: #222;
                color: white;
                padding: 10px;
                margin-bottom: 20px;
                cursor: pointer;
                 width: 260px;
              height: 64px;
          }
          #Button6 
          {
               position:relative;
              top: -60px;
              left: 979px;
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
          }
          #Button7 
          {
               position:relative;
              top: -63px;
              left:  979px;
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
          }
          #Button8 
          {
               position:relative;
              top: -63px;
              left:  979px;
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
          }
          #Button9 
          {
               position:relative;
              top: -43px;
              left:  979px;
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
          }
          #Button10 
          {
               position:relative;
              top: -83px;
              left:  979px;
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
          }
          #TextBox1{ position:relative;
              top: -67px;
              left: 1150px;

          }
          #TextBox2{ position:relative;
              top: -79px;
              left: 1150px;
          }
          #TextBox3{ position:relative;
              top: -76px;
              left: 1150px;
          }
          #TextBox4{ position:relative;
              top: -70px;
              left: 1150px;
          }
          #TextBox5{ position:relative;
              top: -73px;
              left: 1150px;
          }
          #TextBox6{ position:relative;
              top: -79px;
              left: 1150px;
          }
          #TextBox7{ position:relative;
              top: -66px;
              left: 1150px;
          }
          #TextBox8{ position:relative;
              top: -71px;
              left: 1150px;
          }
          #TextBox9{ position:relative;
              top: -93px;
              left: 1150px;
          }
          #TextBox10{ position:relative;
              top: -87px;
              left: 1150px;
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

                                             #Button7:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                                                  #Button8:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                                                       #Button9:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}
                                                            #Button10:hover {
     box-shadow: 0 0 10px 3px rgba(0, 255, 0, 0.5);
}

          </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <img src="4.png" alt="Your Image" class="icon"/>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Quiz" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" style="margin-left: 558px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Update Quiz" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Mid 1" />
            <br />
            <asp:GridView ID="GridView2" runat="server" style="margin-left: 563px" CellPadding="4" GridLines="None" ForeColor="#333333">
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
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Update Mid1" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Mid 2" />
            <br />
            <br />
            <asp:GridView ID="GridView3" runat="server" style="margin-left: 563px" CellPadding="4" GridLines="None" ForeColor="#333333">
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
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click1" Text="Update Mid2" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Final" />
            <br />
            <asp:GridView ID="GridView4" runat="server" style="margin-left: 567px" CellPadding="4" GridLines="None" ForeColor="#333333">
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
            <asp:TextBox ID="TextBox7" runat="server" OnTextChanged="TextBox7_TextChanged"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Update Final" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Assignment" />
            <asp:GridView ID="GridView5" runat="server" style="margin-left: 566px" CellPadding="4" GridLines="None" ForeColor="#333333">
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
            <br />
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Update" />
            <br />
            <br />
        </div>
        <div class="sidebar">
            </div>
    </form>

</body>
</html>
