<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
       <div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="../../index2.html" class="h1"><b>DZ</b>Watchshop</a>
    </div>
    <div class="card-body">
      <h2 class="login-box-msg">Sign in Here</h2>

      <form action="../../index3.html" method="post">
        <div class="input-group mb-3">
          <!--  <input type="email" class="form-control" placeholder="Email"> -->
            <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" Font-Size="X-Large"></asp:Label>
            <asp:TextBox runat="server" class="form-control" ID="txtLoginEmail"  placeholder="Enter Email Id" TextMode="Email" ToolTip="Email Address"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Please Enter Email Address" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
             <asp:TextBox runat="server" class="form-control" ID="txtPassword" placeholder="Enter Password" TextMode="Password" ToolTip="Password"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <div class="row">
          <!-- /.col -->
          <div class="col-4">
           
              <asp:Button runat="server" ID="btnLogin"  class="btn btn-primary btn-block" Text="Sign in" OnClick="btnLogin_Click"/>
          </div>
          <!-- /.col -->
        </div>
      </form>
      <p class="mb-1">
        <a href="ForgetPassword.aspx">I forgot my password !!</a>
      </p>
      <p class="mb-0">
        <a href="RegistrationForm.aspx" class="text-center">You don't have Registered?</a>
      </p>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
  </div>

<!-- /.login-box -->

    </form>
    <!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
</body>
</html>
