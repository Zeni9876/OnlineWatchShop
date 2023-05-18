<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductAdmin.aspx.cs" Inherits="Project.ProductAdmin" EnableEventValidation="false"%>

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
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./Admin/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./Admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="Admin/css/style.css" rel="stylesheet">
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
        <a href="#" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact us</a>
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
              <asp:TextBox ID="txtPsearch" runat="server" class="form-control form-control-navbar" TextMode="Search" placeholder="Search Here....." aria-label="Search"></asp:TextBox>
              <div class="input-group-append">
                <asp:Button id="btnPSearch" runat="server" OnClick="btnPSearch_Click" Text="Search" class="btn btn-navbar">
                </asp:Button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
                   <li class="nav-item d-none d-sm-inline-block">
        <a href="Home.aspx" class="nav-link">Logout</a>
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
          <a href="#" class="d-block">Admin</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <asp:TextBox ID="txtSearch" runat="server" class="form-control form-control-sidebar" TextMode="Search" placeholder="Search Here..." aria-label="Search"></asp:TextBox>
          <div class="input-group-append">
            <asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-sidebar">
            </asp:Button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="Customer.aspx" class="nav-link">
              <i class="fas fa-users"></i>
              <p>Customers</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="ProductAdmin.aspx" class="nav-link">
              <i class="fa fa-product-hunt"></i>
              <p>Products</p>
            </a>
          </li>
           <li class="nav-item">
            <a href="Report.aspx" class="nav-link">
              <i class="fa fa-product-hunt"></i>
              <p>Report</p>
            </a>
          </li>
             <li class="nav-item">
            <a href="Review.aspx" class="nav-link">
              <i class="fa-solid fa-comments"></i>
              <p>Review</p>
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
      <a href="AdminProduct.aspx"  >Add Product Detail</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="BrandForm.aspx">Add Brand Deatil</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="Category.aspx">Add Category Deatil</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="Subcategory.aspx">Add SubCategory Detail</a><br />
     
        <h3 style="text-align:center">Product Details</h3>

      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered zero-configuration" DataKeyNames="Pid" DataSourceID="SqlDataSource1">
          
          <Columns>
              
              <asp:TemplateField HeaderText="Product Id" InsertVisible="False" SortExpression="Pid">
                  <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("Pid") %>' ID="Label1"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                  
                  <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("ProductName") %>' ID="Label2"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

             
              <asp:TemplateField HeaderText="Photo" SortExpression="Image1">
                 <ItemTemplate>
                      <image src="Image/<%# Eval("Image1") %>"  height="100" width="100"></image>
                  </ItemTemplate>
              </asp:TemplateField>
             
              <asp:TemplateField HeaderText="Descripiton" SortExpression="Descripiton">
                 <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("Descripiton") %>' ID="Label9"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Price" SortExpression="Price">
                 <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("Price") %>' ID="Label10"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Entry Date" SortExpression="EntryDate">
                <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("EntryDate") %>' ID="Label8"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Status" SortExpression="Status">
                 <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("Status") %>' ID="Label11"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                 <ItemTemplate>
                      <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Label12"></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:LinkButton ID="Edit" runat="server" Text="Edit" CommandArgument='<%# Bind("Pid") %>' OnClick="Edit_Click"></asp:LinkButton>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:LinkButton ID="Delete" runat="server" Text="Delete" CommandArgument='<%# Bind("Pid") %>' OnClick="Delete_Click"></asp:LinkButton>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
      </asp:GridView>
         </section>
      <!-- /.content -->
      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString11 %>' SelectCommand="SELECT * FROM [tbl_Product]"></asp:SqlDataSource>
 
      <asp:GridView ID="GridViewSearch" runat="server" Visible="false">
          <Columns>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:LinkButton ID="EditSearch" runat="server" Text="Edit" CommandArgument='<%# Bind("Pid") %>' OnClick="EditSearch_Click"></asp:LinkButton>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:LinkButton ID="DeleteSearch" runat="server" Text="Delete" CommandArgument='<%# Bind("Pid") %>' OnClick="DeleteSearch_Click"></asp:LinkButton>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
      </asp:GridView>
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

