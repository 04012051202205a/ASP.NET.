
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonDatHang.aspx.cs" Inherits="WebApplication1.DonDatHang" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đặt Hàng</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style>
        .header {
            background-color: #C1E1C1;
            text-align: center;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .form-section {
            margin: 20px auto;
            width: 50%;
            border: 1px solid #ccc;
            padding: 15px;
            background-color: #f9f9f9;
        }

        .form-control,
        .btn {
            margin-bottom: 10px;
        }

        .bill-section {
            margin: 20px auto;
            width: 50%;
            border: 1px solid #ccc;
            padding: 15px;
            background-color: #fff;
        }

        .bill-header {
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            color: #C14E4E;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-section">
            <div class="header">ĐƠN ĐẶT HÀNG</div>

            <div class="mb-3">
                <label for="txtKhachHang">Khách hàng</label>
                <asp:TextBox ID="txtKhachHang" runat="server" CssClass="form-control" Placeholder="Nhập tên khách hàng"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtDiaChi">Địa chỉ</label>
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control" Placeholder="Nhập địa chỉ"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtMaSoThue">Mã số thuế</label>
                <asp:TextBox ID="txtMaSoThue" runat="server" CssClass="form-control" Placeholder="Nhập mã số thuế"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="ddlBanh">Chọn loại bánh</label>
                <asp:DropDownList ID="ddlBanh" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="mb-3">
                <label for="txtSoLuong">Số lượng</label>
                <asp:TextBox ID="txtSoLuong" runat="server" CssClass="form-control" Placeholder="Nhập số lượng"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="lstDanhSachBanh">Danh sách bánh đã chọn</label>
                <asp:ListBox ID="lstDanhSachBanh" runat="server" CssClass="form-control" Height="100px" SelectionMode="Multiple"></asp:ListBox>
            </div>

            <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
            <asp:Button ID="btnInDon" runat="server" Text="In đơn đặt hàng" CssClass="btn btn-success" OnClick="btnInDon_Click" />
        </div>

        <div class="bill-section">
            <div class="bill-header">HÓA ĐƠN ĐẶT HÀNG</div>
            <asp:Label ID="lblHoaDon" runat="server" CssClass="form-control" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
