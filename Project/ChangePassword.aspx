<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Project.ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formchange" runat="server">
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
      <h2 class="login-box-msg">Change Password</h2>

     
        <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:TextBox runat="server" ID="txtOldpass" class="form-control" TextMode="Password" placeholder="Enter Old Passwod" ToolTip="Old Password"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtOldpass" ErrorMessage="Required*" SetFocusOnError="true"></asp:RequiredFieldValidator>
        <div class="input-group mb-3">
            <asp:TextBox runat="server" ID="txtNewpass" class="form-control" TextMode="Password" placeholder="Enter New Password" ToolTip="New password"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div> <asp:RequiredFieldValidator ID="rfNpass" runat="server" ForeColor="Red" ControlToValidate="txtNewpass" ErrorMessage="Required*" SetFocusOnError="true"></asp:RequiredFieldValidator>
         <div class="input-group mb-3">
         <asp:TextBox runat="server" ID="txtCNewpass" class="form-control" placeholder="Re-Enter New Password" TextMode="Password" ToolTip="New Password"></asp:TextBox>
        <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtCNewpass" ErrorMessage="Required*" SetFocusOnError="true"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidatorpassword" runat="server" ControlToValidate="txtNewpass" ErrorMessage="Enter atleast 1 number,1 Uppercase and 1 Lowercase" ForeColor="#CC0000" ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"></asp:RegularExpressionValidator>

          <div class="social-auth-links text-center">
            <asp:Button  ID="btnChange" runat="server" class="btn btn-block btn-primary" Text="Save Password" OnClick="btnChange_Click"/>
      </div>
           <div class="social-auth-links text-center">
            <asp:Button  ID="btnCancel" runat="server" class="btn btn-block btn-primary" Text="Cancel" OnClick="btnCancel_Click"/><br />
               <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Both Password Should be Matched" ControlToValidate="txtCNewpass" ControlToCompare="txtNewpass" ForeColor="Red"></asp:CompareValidator><div class="input-group-append">
               <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" Font-Size="Medium"></asp:Label>
      </div>
    
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

