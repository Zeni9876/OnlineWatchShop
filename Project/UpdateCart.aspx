<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCart.aspx.cs" Inherits="Project.UpdateCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Update Quantity:<asp:TextBox ID="txtquant" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="btnquant" runat="server" OnClick="btnquant_Click"  Text="Save" />
        </div>
    </form>
</body>
</html>
