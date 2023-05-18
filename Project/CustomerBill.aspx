<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerBill.aspx.cs" Inherits="Project.CustomerBill" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
        </div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="887px">
        </rsweb:ReportViewer>
    </form>
</body>
</html>
