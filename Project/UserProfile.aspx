<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Project.UserProfile" %>

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

  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
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
        <a href="#" class="nav-link">Contact us</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">About us</a>
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
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">   
          
        
        <!-- copy here-->
          


        <div class="container-xl px-4 mt-4">   
           
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">My Details</div>
                        <div class="card-body">
                            <form runat="server">
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (first name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputFirstName">First name</label>
                                        <asp:TextBox class="form-control" ID="txtFname" runat="server"></asp:TextBox>
                                    </div>
                                    <!-- Form Group (last name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputLastName">Last name</label>
                                        <asp:TextBox class="form-control" ID="txtLname" runat="server"></asp:TextBox>
                                    </div>
                                </div>     
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Phone number</label>
                                        <asp:TextBox class="form-control" ID="txtPhone" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <!-- Form Group (email)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                        <asp:TextBox class="form-control" ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <!-- Form Group -->
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputAddress">Address</label>
                                        <asp:Label class="form-control" ID="txtAddress" runat="server"></asp:Label>
                                    </div>
                                    <div class="mb-3">
                                        <label class="small mb-1" for="inputPincode">Pincode</label>
                                        <asp:TextBox class="form-control" ID="txtPin" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- Form Row -->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (area name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" id="area">Area Name</label>
                                        <asp:DropDownList class="form-control" ID="ddlArea" runat="server" style="padding: 10px;">
                                            <asp:ListItem Value="Varachha">Varachha</asp:ListItem>
                                            <asp:ListItem Value="Mota Varachha">Mota Varachha</asp:ListItem>
                                            <asp:ListItem Value="Adajan">Adajan</asp:ListItem>
                                          </asp:DropDownList>
                                    </div>
                                    <!-- Form Group (city name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" id="city" runat="server">City Name</label>
                                        <asp:DropDownList class="form-control" ID="ddlCity" runat="server" style="padding: 10px;">
                                            <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                            <asp:ListItem Value="Bardoli">Bardoli</asp:ListItem>
                                            <asp:ListItem Value="Navsari">Navsari</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!-- Save changes button-->
                                <asp:Button class="btn btn-primary" ID="btnupdate" runat="server" onclick="btnupdate_Click" Text="Save Changes"></asp:Button><br />
                            <a href="ChangePassword.aspx" >You Want to Change Your Password?</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <style type="text/css">
        body{margin-top:20px;
        background-color:#f2f6fc;
        color:#69707a;
        }
        .img-account-profile {
            height: 10rem;
        }
        .rounded-circle {
            border-radius: 50% !important;
        }
        .card {
            box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
        }
        .card .card-header {
            font-weight: 500;
        }
        .card-header:first-child {
            border-radius: 0.35rem 0.35rem 0 0;
        }
        .card-header {
            padding: 1rem 1.35rem;
            margin-bottom: 0;
            background-color: rgba(33, 40, 50, 0.03);
            border-bottom: 1px solid rgba(33, 40, 50, 0.125);
        }
        .form-control, .dataTable-input {
            display: block;
            width: 100%;
            padding: 0.875rem 1.125rem;
            font-size: 0.875rem;
            font-weight: 400;
            line-height: 1;
            color: #69707a;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #c5ccd6;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0.35rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        
        .nav-borders .nav-link.active {
            color: #0061f2;
            border-bottom-color: #0061f2;
        }
        .nav-borders .nav-link {
            color: #69707a;
            border-bottom-width: 0.125rem;
            border-bottom-style: solid;
            border-bottom-color: transparent;
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            padding-left: 0;
            padding-right: 0;
            margin-left: 1rem;
            margin-right: 1rem;
        }
        </style>
        
        <script type="text/javascript">

</script>


        <!-- copy here-->


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
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
</body>
</html>


