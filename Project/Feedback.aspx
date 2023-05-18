<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="Project.Feedback" EnableEventValidation="false" %>

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
      <h2 class="login-box-msg">Give Feedback Here</h2>

      <form action="../../index.html" method="post">
      <div class="input-group mb-3">
         Comment:  <asp:TextBox runat="server" ID="txtFeedback" class="form-control" placeholder="Give Comment Here" TextMode="MultiLine" ToolTip="Comment"></asp:TextBox>
          
              <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
           <asp:RequiredFieldValidator ID="rfContact" runat="server" ErrorMessage="Required" ControlToValidate="txtFeedback" ForeColor="Red"></asp:RequiredFieldValidator>
           <div class="social-auth-links text-center">
            <asp:Button  ID="btnGive" runat="server" class="btn btn-block btn-primary" Text="Send" OnClick="btnGive_Click"/>
                 
                       
          </div>
      </form>
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

