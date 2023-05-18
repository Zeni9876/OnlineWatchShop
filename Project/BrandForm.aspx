<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrandForm.aspx.cs" Inherits="Project.BrandForm" EnableEventValidation="false"%>

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
      <h2 class="login-box-msg">Add Product Brand's Here</h2>

      <form action="../../index3.html" method="post">
        <div class="input-group mb-3">
          <!--  <input type="email" class="form-control" placeholder="Email"> -->
          <%-- <asp:Label ID="lblBrandname" runat="server" Text="Brand Name &nbsp&nbsp"></asp:Label> --%>
            <asp:TextBox runat="server" class="form-control" ID="txtBrandname"  placeholder="Enter Brand Name" ToolTip="Product's Brand"></asp:TextBox>
          <div class="input-group-append">
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatoremail" runat="server" ControlToValidate="txtBrandname" ErrorMessage="Please Enter Product's Brand" ForeColor="#CC0000"></asp:RequiredFieldValidator> 
       
        <div class="input-group mb-3">
          <!-- <input type="password" class="form-control" placeholder="Password"> -->
           <%-- <asp:Label ID="lblBrandDesc" runat="server" Text="Brand Description &nbsp&nbsp"></asp:Label>--%> 
            <asp:TextBox runat="server" class="form-control" ID="txtBrandDescription"  placeholder="Enter Brand's Description" ToolTip="Brand's Description" TextMode="MultiLine" Height="100"></asp:TextBox>
          <div class="input-group-append">
          
          </div>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBrandDescription" ErrorMessage="Please Enter Brand's Description" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        
          <div class="row">
          <!-- /.col -->
          <div class="col-4">
           <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
              <asp:Button runat="server" ID="btnBrandSave"  class="btn btn-primary btn-block" Text="Save" OnClick="btnBrandSave_Click"/>
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


