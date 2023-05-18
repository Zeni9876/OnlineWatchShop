<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AreaForm.aspx.cs" Inherits="Project.AreaForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
               <h1>Area Form</h1>
            <table>
                <tr>
                    <td>Area Name:</td>
                    <td> <asp:TextBox runat="server" ID="txtAreaname" placeholder="Enter Area Name" ToolTip="Area name"></asp:TextBox></td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAreaname" ErrorMessage="Please Enter Area Name" ForeColor="#CC0000"></asp:RequiredFieldValidator>  

                </tr>
                 <tr>
                    <td>City Name:</td>
                    <td>  
                        <asp:DropDownList runat="server" ID="ddlCityname">
                           
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click"  />
                    </td>
                </tr>
            </table>
           </center>
        </div>
    </form>
</body>
</html>
