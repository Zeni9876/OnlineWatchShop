<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coupleproduct.aspx.cs" Inherits="Project.Coupleproduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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


     <style>
      * {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

  </style>  


</head>
<body>
    <form id="form1" runat="server">
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
        <a href="Home.aspx" class="nav-link">Home</a>
      </li>
        <li class="nav-item d-none d-sm-inline-block">
        <a href="CustomerProduct.aspx" class="nav-link">Product</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact us</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">About us</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                    
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
                 <li class="nav-item d-none d-sm-inline-block">
        <a href="ViewCart.aspx" class="nav-link"><i class="fas fa-cart-plus"></i></a>
      </li>
                  <li class="nav-item d-none d-sm-inline-block">
        <a href="MyOrder.aspx" class="nav-link">Order</a>
      </li>
                  <li class="nav-item d-none d-sm-inline-block">
        <a href="ViewBill.aspx" class="nav-link">Bill</a>
      </li>
                   <li class="nav-item d-none d-sm-inline-block">
        <a href="Home.aspx" class="nav-link">LogOut</a>
      </li>
              </div>
            </div>
          </form>
        </div>
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
          <a href="UserProfile.aspx" class="d-block"><% Response.Write(Session["Firstname"]); %></a>
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
           <div class="row">
                              <div class="clearfix hidden-md-up"></div>

                                <div class="col-12 col-sm-6 col-md-3">
                                    <asp:DataList ID="Repeater1" runat="server" RepeatColumns="4" BackColor="#ffffcc" BorderWidth="2px" BorderStyle="Groove" DataKeyField="Pid" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>

                                            <image src="Image/<%# Eval("Image1") %>" height="200" width="250"></image>
                                            <br />
                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Pid") %>' />
                                            <br />
                                            <%--Price: <asp:Label ID="pprice" runat="server" Text='<%# Eval("Price") %>' Class="lblproduct"></asp:Label><br />
                           <asp:Label ID="pstatus" runat="server" Text='<%# Eval("Status") %>' ForeColor="#000000" Class="lblproduct"></asp:Label>--%>
                                            <asp:LinkButton ID="LinkButton1" Class="btn" runat="server" BackColor="#ff5050" ForeColor="#ffffff" PostBackUrl='<%# "Addtocart.aspx?Pid=" + Eval("Pid") %>'>Add To Cart</asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString %>' SelectCommand="SELECT [Pid], [Image1] FROM [tbl_Product] WHERE ([Tid] = @Tid)">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="Couple" Name="Tid" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-12 col-sm-6 col-md-3">
                            </div>
          </div><!--/. container-fluid -->
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
    </form>

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
