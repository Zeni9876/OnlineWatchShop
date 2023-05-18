<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowBill.aspx.cs" Inherits="Project.ShowBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./Admin/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./Admin/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="Admin/css/style.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">My Order</h4>
                                <div class="table-responsive">
                                    <table style="border:groove">
                                        <tr style="border:groove">
                                            <th>Product Id</th>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total Amount</th>
                                        </tr>
                                        <tr style="border:groove">
                                            <td><asp:Label ID="lblId" runat="server" ></asp:Label></td>
                                            <td><asp:Label ID="lblName" runat="server" ></asp:Label></td>
                                            <td><asp:Label ID="lblPrice" runat="server" ></asp:Label></td>
                                            <td><asp:Label ID="lblQuant" runat="server" ></asp:Label></td>
                                            <td><asp:Label ID="lblAmount" runat="server" ></asp:Label></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          
        </div>
    </form>
</body>
</html>
