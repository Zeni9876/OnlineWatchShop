<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyPassword.aspx.cs" Inherits="Project.VerifyPassword" EnableEventValidation="false"%>

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
      <p class="login-box-msg">Verify your OTP</p>

      <form action="../../index3.html" method="post">
        <div class="input-group mb-3">
          <!--  <input type="email" class="form-control" placeholder="Email"> -->
            <asp:TextBox runat="server" class="form-control" ID="txtPasswordOtp"  placeholder="Enter OTP" ToolTip="OTP"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
         
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
             <asp:TextBox runat="server" class="form-control" ID="txtFPassword"  placeholder="Enter Password" TextMode="Password" ToolTip="Password"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
             <asp:TextBox runat="server" class="form-control" ID="txtFConfirmPassword"  placeholder="Re-Enter Password" TextMode="Password" ToolTip="Re-Enter Password"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPasswordOtp" ErrorMessage="Please Enter OTP" ForeColor="#CC0000"></asp:RequiredFieldValidator>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" runat="server" ControlToValidate="txtFPassword" ErrorMessage="Please Enter password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorrepassword" runat="server" ControlToValidate="txtFConfirmPassword" ErrorMessage="Please Re-Enter password" ForeColor="#CC0000"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" runat="server" ControlToValidate="txtFPassword" ErrorMessage="Enter atleast 1 number,1 Uppercase and 1 Lowercase" ForeColor="#CC0000" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"></asp:RegularExpressionValidator>
          <div class="row">
         
          <!-- /.col -->
          <div class="col-4">
           
              <asp:Button runat="server" ID="btnSave"  class="btn btn-primary btn-block" Text="Save" OnClick="btnSave_Click" />
          </div>
          <!-- /.col -->
        </div>
      </form>
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
