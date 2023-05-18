<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewBill.aspx.cs" Inherits="Project.ViewBill" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DZ Watchshop</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <link rel="stylesheet" href="./Admin/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./Admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="Admin/css/style.css" rel="stylesheet">

  <style>
   .gradient-custom {
  /* fallback for old browsers */
  background: #dad9db;

  /* Chrome 10-25, Safari 5.1-6 */
  background: -webkit-linear-gradient(to top left, #dad9db, rgba(246, 243, 255, 1));

  /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  background: linear-gradient(to top left, #dad9db, rgba(246, 243, 255, 1))
}
  </style>  

</head>
<body>
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__wobble" src="dist/img/AdminLTELogo.png" alt="Logo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="AfterLoginHome.aspx" class="nav-link">Home</a>
      </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a href="CustomerProduct.aspx" class="nav-link">Product</a>
      </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact Us</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">About Us</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
     <li class="nav-item d-none d-sm-inline-block">
        <a href="ViewCart.aspx" class="nav-link"><i class="fas fa-cart-plus"></i></a>

      </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a href="MyOrder.aspx" class="nav-link">MyOrder</a></li>
         <li class="nav-item d-none d-sm-inline-block">
        <a href="ViewBill.aspx" class="nav-link">Bill</a>
      </li>
                   <li class="nav-item d-none d-sm-inline-block">
        <a href="Home.aspx" class="nav-link">LogOut</a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="loading.." class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">DZ Watchshop</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="UserProfile.aspx" class="d-block"><% Response.Write(Session["Firstname"]);%></a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="TypeProduct.aspx" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Men</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="Womenproduct.aspx" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Women</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="Kidsproduct.aspx" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Kids</p>
            </a>
          </li>
            <li class="nav-item">
            <a href="Coupleproduct.aspx" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Couple</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Info boxes -->
         

         <form runat="server">
                             
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <asp:Button ID="btnFeedback" runat="server" Text="Give Feedback" style="float:right" OnClick="btnFeedback_Click1"></asp:Button>
                 
                                <h4 class="card-title">Bill</h4>
                                <div class="table-responsive">
                                   
        <div>
            <asp:GridView ID="billGrid" CssClass="table table-striped table-bordered zero-configuration" runat="server">
                <Columns>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <asp:LinkButton ID="linkdowload" runat="server" Text="Download" OnClick="linkdowload_Click" CommandArgument='<%# Eval("Billno") %>'> </asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField> 
                </Columns>
            </asp:GridView>
        </div>
   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      
      </div><!--/. container-fluid -->
       </form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2021-2022 <a href="#">DZ Watchshop</a></strong>
    All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->

</body>
</html>
