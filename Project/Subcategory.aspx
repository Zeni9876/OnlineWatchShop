<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subcategory.aspx.cs" Inherits="Project.Subcategory" EnableEventValidation="false"%>

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
            <asp:TextBox runat="server" class="form-control" ID="txtSubCatname"  placeholder="Enter SubCategory" ToolTip="Product's SubCategory"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" ControlToValidate="txtSubCatname" ErrorMessage="Please Enter Product's SubCategory" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
             <asp:FileUpload ID="txtSubcatfile" runat="server" />
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" runat="server" ControlToValidate="txtSubcatfile" ErrorMessage="Please Upload the file" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
            <asp:TextBox runat="server" class="form-control" ID="txtSubCatdescription"  placeholder="Enter SubCategory's Description" ToolTip="SubCategory's Description" TextMode="MultiLine" Height="100"></asp:TextBox>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubCatdescription" ErrorMessage="Please Enter Category's Description" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        
          <div class="row">
          <!-- /.col -->
          <div class="col-4">
           <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
              <asp:Button runat="server" ID="btnSubcatsave"  class="btn btn-primary btn-block" Text="Save" OnClick="btnSubcatsave_Click"/>
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


