<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CityForm.aspx.cs" Inherits="Project.CityForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <center>
               <h1>City Form</h1>
            <table>
                <tr>
                    <td>City Name:</td>
                    <td> <asp:TextBox runat="server" ID="txtCityname" placeholder="Enter CityName" ToolTip="City name"></asp:TextBox></td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCityname" ErrorMessage="Please Enter City Name" ForeColor="#CC0000"></asp:RequiredFieldValidator>  

                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
           </center>
        </div>
    </form>
</body>
</html>
