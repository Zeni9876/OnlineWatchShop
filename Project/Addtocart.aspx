<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addtocart.aspx.cs" Inherits="Project.Addtocart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *{
            padding:0;
            margin:0;
        }
        .test
        {
            margin:auto;
            width:60%;
            text-align:center;
        }
        .product
        {
            float:left;
            width:100%;
            text-align:center;
            padding:20px 15px;

        }
        .price{
            font-weight:bold;
            font-size:20px;
        }
        .pimage{
            border-radius:50%;
            border:1px solid #EEE;
            padding:15px;
            margin-bottom:15px;
        }
        .left{
            float:left;
            border-right:1px solid #EEE;
            padding-right:23px;
        }
        .right{
            float:left;
            width:50%;
            padding-left:20px;
            text-align:left;
        }
        .success
        {
            display:block;
            text-align:center;
            color:#FF5729;
        }
        .clearfix{
            clear:both;
        }
        .btn
        {
            border:3px solid #FF5729;
            background-color:#FF5729;
            color:#FFF;
            border-radius:5px;
            font-weight:bold;
            padding:5px 10px;
            margin-left:5px;
            text-decoration:none;
            font-size:14px;
        }
        .pname{
            background-color:#EEE;
            font-weight:700;
            padding:8px 7px;
        }
        .qt{
            width:30px;
            height:24px;
            padding:3px;
            border-radius:5px;
            border:1px solid #EEE;
        }
        .desc{
            text-align:justify;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="test">

            <asp:Label ID="lblSuccess" class="success" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="lblid" class="success" runat="server" Text="" Visible="false"></asp:Label>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="product">
                        <div class="left">
                            <image src="Image/<%# Eval("Image1") %>" height="150" width="180" class="pimage"></image>
                        </div>
                        <div class="right">
                            <asp:HiddenField ID="HiddenField" runat="server" Value='<%# Eval("Pid") %>' />
                            Product: <asp:Label ID="lblname" runat="server" Text='<%# Eval("ProductName") %>' class="product pname"></asp:Label><br />
                    Price: <asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>' class="product price"></asp:Label><br />
                    Description: <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("Descripiton") %>' class="product desc"></asp:Label><br />
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Status") %>' ForeColor="#ff0000" class="product desc"></asp:Label><br />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clearfix"></div>
            <asp:Label ID="lblquantity" runat="server" Text="Select Quantity"></asp:Label><br />
            <asp:TextBox ID="txtquantity" runat="server" class="qt" TextMode="Number" value="1"></asp:TextBox><br />
            <asp:Button ID="btnaddtocart" runat="server" class="btn" Text="Add To Cart" OnClick="btnaddtocart_Click" />
            <%--<asp:Button ID="btnbuynow" runat="server" class="btn" Text="Buy Now" OnClick="btnbuynow_Click" />--%>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString5 %>' SelectCommand="SELECT * FROM [tbl_Product] WHERE ([Pid] = @Pid)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="Pid" Name="Pid" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
