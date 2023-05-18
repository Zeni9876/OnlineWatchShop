<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCheckout.aspx.cs" Inherits="Project.AddCheckout" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Product Entry Page</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="#" class="h1"><b>DZ</b>Watchshop</a>
    </div>
    <div class="card-body">
      <h2 class="login-box-msg">Residential Entry Form</h2>

      <form action="../../index.html" method="post">
        <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            Address: <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
             
          <div class="input-group-append">
          
          </div>
        </div>
           <asp:RequiredFieldValidator ID="rfAddress" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtAddress" SetFocusOnError="true"></asp:RequiredFieldValidator>
          
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
          Area: <asp:DropDownList ID="ddlArea" runat="server">
              <asp:ListItem Value="null">Select Area--</asp:ListItem>
                <asp:ListItem Value="Varachha">Varachha</asp:ListItem>
                <asp:ListItem Value="Mota Varaccha">Mota Varachha</asp:ListItem>
                <asp:ListItem Value="Adajan">Adajan</asp:ListItem>
            </asp:DropDownList>
          <div class="input-group-append">
          
          </div>
        </div>
          <asp:RequiredFieldValidator ID="rfArea" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ddlArea" SetFocusOnError="true"></asp:RequiredFieldValidator>
            
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            City: <asp:DropDownList ID="ddlCity" runat="server">
                <asp:ListItem Value="null">Select City</asp:ListItem>
                <asp:ListItem Value="Surat">Surat</asp:ListItem>
                <asp:ListItem Value="Bardoli">Bardoli</asp:ListItem>
                <asp:ListItem Value="Navsari">Navsari</asp:ListItem>
            </asp:DropDownList>
            
          <div class="input-group-append">
           
          </div>
               </div>
           <asp:RequiredFieldValidator ID="rfCity" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ddlCity" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <div class="input-group mb-3">
                <div class="input-group-append">
           <%--Pincode:<asp:TextBox ID="txtPincode" runat="server" TextMode="Number"></asp:TextBox> </div>--%>
               <asp:TextBox ID="txtPincode" runat="server" TextMode="Number"></asp:TextBox>
                </div>
  <asp:RequiredFieldValidator ID="rfPin" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPincode" SetFocusOnError="true"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="rePin" runat="server" ErrorMessage="Enter Valid Pincode" ControlToValidate="txtPincode" ValidationExpression="^[1-9]{1}[0-9]{2}[0-9]{3}$" SetFocusOnError="true" ForeColor="Red"></asp:RegularExpressionValidator>
      
            <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
           
          <div class="input-group-append">
                <asp:DropDownList ID="ddlPType" runat="server">
                   <asp:ListItem Value="null">Select Payment Type</asp:ListItem>
                   <asp:ListItem Value="Online">Online</asp:ListItem>
                   <asp:ListItem Value="Cash On Delivery">Cash On Delivery</asp:ListItem>
               </asp:DropDownList>
          </div></div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ddlPType" SetFocusOnError="true"></asp:RequiredFieldValidator>
              
            <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
           
          <div class="input-group-append">
          <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
            </form>
         </div>
    </form>
</body>
</html>
