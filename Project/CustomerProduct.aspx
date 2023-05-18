<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerProduct.aspx.cs" Inherits="Project.CustomerProduct" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DZ Watchshop</title>
    <style>
        .product {
            float: left;
            width: 240px;
            text-align: center;
            margin-left: 1%;
        }

        .lblproduct {
            display: block;
            margin-bottom: 5px;
            background-color: dimgray;
        }

        image {
            border: 1px solid black;
            padding: 5px;
            border-radius: 4px;
        }


        /*  div.product {
  border: 1px solid #ccc;
}

div.product:hover {
  border: 1px solid #777;
}

div.product image {
  width: 100%;
  height: auto;
}

div.desc {
  padding: 15px;
  text-align: center;
}

* {
  box-sizing: border-box;
}

.responsive {
  padding: 0 6px;
  float: left;
  width: 24.99999%;
}

@media only screen and (max-width: 700px) {
  .responsive {
    width: 49.99999%;
    margin: 6px 0;
  }
}

@media only screen and (max-width: 500px) {
  .responsive {
    width: 100%;
  }
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}*/
    </style>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
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
                        <a href="AfterLoginHome.aspx" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="Product.aspx" class="nav-link">Product</a>
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
                                <a href="#" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>Men</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>Women</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="fas fa-circle nav-icon"></i>
                                    <p>Kids</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
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
                        <asp:DataList ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" BackColor="#ffffcc" BorderWidth="2px"  BorderStyle="Groove">
                         
                                    <itemtemplate>                                        <%-- <asp:Image ID="photo" runat="server" ImageUrl="Image/<%# Bind("Image1") %>" />--%>
                                        <image src="Image/<%# Eval("Image1") %>" height="200" width="250"></image>
                                        <br />
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("Pid") %>' />
                                        <br />
                                        <%--Price: <asp:Label ID="pprice" runat="server" Text='<%# Eval("Price") %>' Class="lblproduct"></asp:Label><br />
                           <asp:Label ID="pstatus" runat="server" Text='<%# Eval("Status") %>' ForeColor="#000000" Class="lblproduct"></asp:Label>--%>
                                        <asp:LinkButton ID="LinkButton1" Class="btn" runat="server" BackColor="#ff5050" ForeColor="#ffffff" PostBackUrl='<%# "Addtocart.aspx?Pid=" + Eval("Pid") %>'>Add To Cart</asp:LinkButton>
                                        &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;
                                    </itemtemplate>
                          
                        </asp:DataList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString4 %>' SelectCommand="SELECT * FROM [tbl_Product]"></asp:SqlDataSource>
                        </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-12 col-sm-6 col-md-3">
                            </div>
                    </div>
                    <!-- Info boxes -->
                    <div class="row">
                        <!-- fix for small devices only -->
                        <div class="clearfix hidden-md-up"></div>


                        <!-- /.col -->
                        <div class="col-12 col-sm-6 col-md-3">
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
            </div>
            <!--/. container-fluid -->
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
