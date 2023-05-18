<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Project.RegistrationForm" EnableEventValidation="false"%>

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
  <title>Registration Page</title>

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
      <h2 class="login-box-msg">Sign Up Here</h2>

      <form action="../../index.html" method="post">
        <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:TextBox runat="server" ID="txtFirstname" class="form-control" placeholder="Enter First name" ToolTip="First Name"></asp:TextBox>
            <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
           <asp:RequiredFieldValidator ID="rfFname" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtFirstname" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="reFname" runat="server" ControlToValidate="txtFirstname" ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" ForeColor="Red" ErrorMessage="Only Alphabet values are Allowed" SetFocusOnError="true"></asp:RegularExpressionValidator>

        <div class="input-group mb-3">
            <asp:TextBox runat="server" ID="txtLastname" class="form-control" placeholder="Enter Surname" ToolTip="Surname"></asp:TextBox>
            <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="rfLname" runat="server" ErrorMessage="Required" ControlToValidate="txtLastname" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="reLname" runat="server" ControlToValidate="txtLastname" ValidationExpression="^[a-zA-Z][a-zA-Z\\s]+$" ForeColor="Red" ErrorMessage="Only Alphabetic values are Allowed" SetFocusOnError="true"></asp:RegularExpressionValidator>

         <div class="input-group mb-3">
         <asp:TextBox runat="server" ID="txtEmailid" class="form-control" placeholder="Enter Email" TextMode="Email" ToolTip="Email Address"></asp:TextBox>
          
             <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="rfEmail" runat="server" ErrorMessage="Required" ControlToValidate="txtEmailid" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="txtEmailid" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ForeColor="Red" ErrorMessage="Email Entered in proper way" SetFocusOnError="true"></asp:RegularExpressionValidator>

          <div class="input-group mb-3">
         <asp:TextBox runat="server" ID="txtContact" class="form-control" placeholder="Enter Contact no" TextMode="number" ToolTip="Contact no"></asp:TextBox>
          
              <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
           <asp:RequiredFieldValidator ID="rfContact" runat="server" ErrorMessage="Required" ControlToValidate="txtContact" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="reContact" runat="server" ControlToValidate="txtContact" ValidationExpression="[6-9][0-9]{9}" ForeColor="Red" ErrorMessage="Contact no Entered in proper way" SetFocusOnError="true"></asp:RegularExpressionValidator>

          <div class="social-auth-links text-center">
            <asp:Button  ID="btnSendotp" runat="server" class="btn btn-block btn-primary" Text="Send OTP" OnClick="btnSendotp_Click"/>
                 
                       
          </div>
      </form>

        
       
      <a href="Login.aspx" class="text-center">I already have a Registered</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>

        </div>
    </form>
  </body>
</html>

