using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class DonDatHang : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KhoiTaoDuLieu();
            }
        }

        private void KhoiTaoDuLieu()
        {
            // Khởi tạo dữ liệu danh sách bánh
            ddlBanh.Items.Add(new ListItem("Bánh Croissant bơ", "250"));
            ddlBanh.Items.Add(new ListItem("Bánh bò nướng", "123"));
            ddlBanh.Items.Add(new ListItem("Patés chauds", "50"));
            ddlBanh.Items.Add(new ListItem("Hamburger", "1500"));
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSoLuong.Text) && int.TryParse(txtSoLuong.Text, out int soLuong))
            {
                string tenBanh = ddlBanh.SelectedItem.Text;
                int donGia = int.Parse(ddlBanh.SelectedValue);
                int thanhTien = soLuong * donGia;

                string item = $"{tenBanh} - Số lượng: {soLuong}, Thành tiền: {thanhTien}";
                lstDanhSachBanh.Items.Add(item);

                // Lưu vào ViewState để sử dụng khi in hóa đơn
                if (ViewState[tenBanh] == null)
                {
                    ViewState[tenBanh] = thanhTien;
                }
                else
                {
                    ViewState[tenBanh] = (int)ViewState[tenBanh] + thanhTien;
                }
            }
        }

        protected void btnInDon_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendLine($"<b>Khách hàng:</b> {txtKhachHang.Text}<br>");
            sb.AppendLine($"<b>Địa chỉ:</b> {txtDiaChi.Text}<br>");
            sb.AppendLine($"<b>Mã số thuế:</b> {txtMaSoThue.Text}<br><br>");
            sb.AppendLine("<b>Đặt các loại bánh sau:</b><br>");
            sb.AppendLine("<table border='1' style='width:100%;text-align:left;'>");
            sb.AppendLine("<tr><th>Tên bánh</th><th>Thành Tiền</th></tr>");

          
            foreach (ListItem item in lstDanhSachBanh.Items)
            {
               
                string[] parts = item.Text.Split(new string[] { "Thành tiền: " }, StringSplitOptions.None);
                string tenBanh = parts[0].Trim(); // Tên bánh
                string thanhTien = parts.Length > 1 ? parts[1].Trim() : "0";

                
                sb.AppendLine($"<tr><td>{tenBanh}</td><td>{thanhTien}</td></tr>");
            }

            sb.AppendLine("</table>");
            lblHoaDon.Text = sb.ToString();
        }

    }
}