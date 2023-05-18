<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="Project.AdminProduct" EnableEventValidation="false"%>

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
  <title>Product Entry Page</title>

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
      <h2 class="login-box-msg">Product Entry Form</h2>

      <form action="../../index.html" method="post">
        <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:TextBox runat="server" ID="txtProductName" class="form-control" placeholder="Enter Product name" ToolTip="Product Name"></asp:TextBox>
          <div class="input-group-append">
          
          </div>
        </div>
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
           <asp:Label ID="lblCategory" runat="server" Text="Category &nbsp&nbsp "></asp:Label> 
               <asp:DropDownList ID="ddlCategory" runat="server">
            </asp:DropDownList>
          <div class="input-group-append">
          
          </div>
        </div>
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:Label ID="lblSubcategory" runat="server" Text="SubCategory &nbsp&nbsp "></asp:Label>
               <asp:DropDownList ID="ddlSubcategory" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Select Subcategory.." Selected="True" Value=" ">Select Subcategory</asp:ListItem>
            </asp:DropDownList>
          <div class="input-group-append">
           
          </div>
        </div>
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:Label ID="lblBrand" runat="server" Text="Brand &nbsp&nbsp "></asp:Label> 
               <asp:DropDownList ID="ddlBrand" runat="server">

            </asp:DropDownList>
          <div class="input-group-append">
            
          </div>
        </div>
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:Label ID="lblType" runat="server" Text="Type &nbsp&nbsp "></asp:Label>
               <asp:DropDownList ID="ddlType" runat="server">

            </asp:DropDownList>
          <div class="input-group-append">
           
          </div>
        </div>
           <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:Label ID="lblImage1" runat="server" Text="Image1 &nbsp&nbsp "></asp:Label> 
               <asp:FileUpload ID="Image1" runat="server" AllowMultiple="true"/>

          <div class="input-group-append">
         
          </div>
        </div>
          <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:Label ID="lblImage2" runat="server" Text="Image2 &nbsp&nbsp "></asp:Label> <asp:FileUpload ID="Image2" runat="server" />

          <div class="input-group-append">
          
          </div>
        </div>
          <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
             <asp:Label ID="lblImage3" runat="server" Text="Image3 &nbsp&nbsp "></asp:Label><asp:FileUpload ID="Image3" runat="server" />

          <div class="input-group-append">
         
          </div>
        </div>
          <div class="input-group mb-3">
        <!--  <input type="text" class="form-control" placeholder="First name">   -->
            <asp:Label ID="lblImage4" runat="server" Text="Image4 &nbsp&nbsp "></asp:Label> <asp:FileUpload ID="Image4" runat="server" />

          <div class="input-group-append">
           
          </div>
        </div>
        <div class="input-group mb-3">
            <asp:TextBox runat="server" ID="txtPrice" class="form-control" placeholder="Enter Price" ToolTip="Price" TextMode="Number"></asp:TextBox>
          <div class="input-group-append">
           
          </div>
        </div> 
         <div class="input-group mb-3">
         <asp:TextBox runat="server" ID="txtQuantity" class="form-control" placeholder="Enter Quantity"  ToolTip="Quantity"></asp:TextBox>
          <div class="input-group-append">
       
          </div>
        </div>
         <div class="input-group mb-3">
         <asp:TextBox runat="server" ID="txtDescriptionProduct" class="form-control" placeholder="Enter Description of product"  ToolTip="Description" TextMode="MultiLine" Height="100"></asp:TextBox>
          <div class="input-group-append">
       
          </div>
        </div>
          <div class="social-auth-links text-center">
            <asp:Button  ID="btnSaveProduct" runat="server" class="btn btn-block btn-primary" Text="Save Product" OnClick="btnSaveProduct_Click"/>
      </div>
           <div class="social-auth-links text-center">
            <asp:Button  ID="btnCancel" runat="server" class="btn btn-block btn-primary" Text="Cancel" OnClick="btnCancel_Click"/>
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

