<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="Project.ViewCart" EnableEventValidation="false" %>

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
          <a href="#" class="d-block"><% Response.Write(Session["Firstname"]);%></a>
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
          <form runat="server" >
              <p style="text-align:center">
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  DataKeyNames="CartId" DataSourceID="SqlDataSource5" OnRowCommand="GridView1_RowCommand1">
                  
                  <Columns>
                      <asp:TemplateField SortExpression="CartId">
                          <ItemTemplate>
                              <asp:HiddenField runat="server" ID="CartId" Value='<%# Bind("CartId") %>' />
                          </ItemTemplate>
                      </asp:TemplateField>
                       <asp:TemplateField HeaderText="Image" SortExpression="Image1">
                         
                          <ItemTemplate>
                              <image src="Image/<%# Eval("Image1") %>" height="100" width="100"></image>
                          </ItemTemplate>
                      </asp:TemplateField>

                       <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                          
                          <ItemTemplate>
                              <asp:Label runat="server" Text='<%# Bind("ProductName") %>' ID="Label5"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Price" SortExpression="Price">
                          
                          <ItemTemplate>
                              <asp:Label runat="server" Text='<%# Bind("Price") %>' ID="Label6"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Date" SortExpression="cdate">
                        
                          <ItemTemplate>
                              <asp:Label runat="server" Text='<%# Bind("cdate") %>' ID="Label4"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                     
                      
                          <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        
                          <ItemTemplate>
                              <asp:TextBox ID="txtQuant" runat="server" TextMode="Number" Text='<%#Bind("Quantity") %>' ></asp:TextBox>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Total Price" SortExpression="">
                        
                          <ItemTemplate>
                              <asp:Label runat="server" Text='<%# Bind("ItemPrice") %>' ID="lblprice"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                     
                      <asp:TemplateField HeaderText="Edit Cart" SortExpression="">
                     <ItemTemplate>
                         <asp:LinkButton ID="update" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                     </ItemTemplate>
                          </asp:TemplateField>

                      <asp:TemplateField HeaderText="Delete Product" SortExpression="">
                        <ItemTemplate>
                            <asp:LinkButton ID="delete"  runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                        </ItemTemplate>
                          </asp:TemplateField>
                  </Columns>
              </asp:GridView>
                  </p>
              <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString10 %>' SelectCommand="ViewUserCart" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                      <asp:SessionParameter SessionField="cid" Name="CId" Type="Int32"></asp:SessionParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
              <asp:SqlDataSource runat="server" ID="SqlDataSource4"></asp:SqlDataSource>
              <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString9 %>' SelectCommand="ViewUserCart" SelectCommandType="StoredProcedure">
                  <SelectParameters>
                      <asp:SessionParameter SessionField="cid" Name="CId" Type="Int32"></asp:SessionParameter>
                  </SelectParameters>
              </asp:SqlDataSource>
              <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString8 %>' SelectCommand="ViewCart" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:SessionParameter SessionField="CId" Name="userid" Type="Int32"></asp:SessionParameter>
              </SelectParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Database1ConnectionString7 %>' SelectCommand="ViewCart" SelectCommandType="StoredProcedure">
              <SelectParameters>
                  <asp:SessionParameter SessionField="CId" Name="userid" Type="Int32"></asp:SessionParameter>
              </SelectParameters>
             
                  </asp:SqlDataSource>
              <p align="right">
              <asp:Button ID="btnBuynow" runat="server" BackColor="#00cc00" ForeColor="#ffffff" Text="Buy Now" OnClick="btnBuynow_Click" />
             </p>
                  </form>
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

