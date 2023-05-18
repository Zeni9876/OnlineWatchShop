<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Project.Category"  EnableEventValidation="false"%>

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
      <p class="login-box-msg">Add Product's Category Here</p>

      <form action="../../index3.html" method="post">
        <div class="input-group mb-3">
          <!--  <input type="email" class="form-control" placeholder="Email"> -->
            <asp:TextBox runat="server" class="form-control" ID="txtCatname"  placeholder="Enter Category" ToolTip="Product's Category"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" ControlToValidate="txtCatname" ErrorMessage="Please Enter Product's Category" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
             <asp:FileUpload ID="catfileupload" runat="server" />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" runat="server" ControlToValidate="txtCatname" ErrorMessage="Please Upload the file" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
            <asp:TextBox runat="server" class="form-control" ID="txtCatdescription"  placeholder="Enter Category's Description" ToolTip="Category's Description" TextMode="MultiLine" Height="100"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCatdescription" ErrorMessage="Please Enter Category's Description" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        
          <div class="row">
          <!-- /.col -->
          <div class="col-4">
           <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
              <asp:Button runat="server" ID="btncatsave"  class="btn btn-primary btn-block" Text="Save" OnClick="btncatsave_Click"/>
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

