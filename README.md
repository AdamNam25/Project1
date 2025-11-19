Video demo Website: https://youtu.be/cg9LouoLBPs

Switch branches/tags "master" trên github để xem các file, bao gồm file doc và slide

# **📌 README – HỆ THỐNG QUẢN LÝ BÁN QUẦN ÁO ARVILA**

## **1. Giới thiệu dự án**

Dự án **Arvila Fashion Hub** là hệ thống website bán quần áo trực tuyến được xây dựng bằng PHP trên nền tảng XAMPP. Website cung cấp đầy đủ các chức năng của một hệ thống thương mại điện tử hiện đại, hỗ trợ khách hàng mua sắm dễ dàng và hỗ trợ quản trị viên quản lý cửa hàng hiệu quả.

Mục tiêu của dự án:

* Xây dựng nền tảng bán hàng trực tuyến chuyên nghiệp.
* Tối ưu hóa quá trình quản lý sản phẩm – đơn hàng – khách hàng.
* Tạo môi trường mua sắm thuận tiện, ổn định, bảo mật và dễ dùng.

---

## **2. Công nghệ sử dụng**

* **PHP (Core PHP / OOP)**
* **MySQL database**
* **HTML – CSS – JavaScript – jQuery – Ajax**
* **XAMPP**
* **FontAwesome / Bootstrap**
* **CKEditor cho nhập nội dung**

---

## **3. Chức năng chính**

### **👤 3.1. Người dùng (User)**

* Đăng ký / Đăng nhập / Quên mật khẩu
* Quản lý thông tin tài khoản
* Tìm kiếm – lọc – sắp xếp sản phẩm
* Xem chi tiết sản phẩm, hình ảnh, mô tả, giá
* Giỏ hàng + áp mã giảm giá + kiểm tra tồn kho
* Đặt hàng: COD hoặc thanh toán online
* Xem lịch sử mua hàng và trạng thái đơn hàng
* Đánh giá sản phẩm (1 lần mỗi sản phẩm)
* Xem bài viết thời trang và bình luận

---

### **🛒 3.2. Chức năng bên mua hàng**

* Tự động tạo giỏ hàng theo session
* Cập nhật realtime khi thêm/xóa sản phẩm
* Kiểm tra tồn kho trước thanh toán
* Gợi ý sản phẩm liên quan
* Tính tổng tiền – phí ship – khuyến mãi

---

### **🛠️ 3.3. Quản trị viên (Admin)**

Admin có toàn quyền quản lý toàn bộ hệ thống:

#### **Quản lý sản phẩm**

* Thêm – sửa – xóa sản phẩm
* Quản lý hình ảnh, mô tả HTML
* Quản lý thương hiệu, danh mục
* Cập nhật giá, số lượng, khuyến mãi

#### **Quản lý đơn hàng**

* Xem tất cả đơn hàng
* Cập nhật trạng thái: Chờ xử lý / Đang giao / Hoàn thành / Hủy
* Xuất hóa đơn

#### **Quản lý người dùng**

* Thêm – sửa – khóa tài khoản
* Phân quyền Admin/User

#### **Quản lý nội dung**

* Bài viết thời trang
* Danh mục bài viết
* Thẻ bài viết
* Bình luận

#### **Quản lý khác**

* Banner
* Mã giảm giá
* Phí ship theo tỉnh thành
* Thống kê doanh thu – lượng đơn – số người dùng

---

## **4. Cơ sở dữ liệu**

Hệ thống sử dụng 15 bảng chính:

* **users, brands, categories, products, product_details, product_reviews**
* **orders, order_details, coupons, shippings**
* **posts, post_categories, post_comments, post_tags**
* **banners**

Các quan hệ chính:

* 1 – N: users → reviews, comments, orders
* N – N: products ↔ carts, products ↔ wishlists
* 1 – N: brands → products
* 1 – N: categories → products
* 1 – N: posts → comments
* N – N: posts ↔ tags

---

## **5. Giao diện hệ thống**

Website bao gồm 2 giao diện:

### **👕 Giao diện người dùng**

* Trang chủ
* Danh sách sản phẩm
* Chi tiết sản phẩm
* Giỏ hàng
* Thanh toán
* Danh sách bài viết & chi tiết bài viết
* Trang cá nhân

### **🛠 Giao diện Admin**

* Dashboard tổng quan
* Quản lý sản phẩm
* Quản lý thương hiệu, danh mục
* Quản lý đơn hàng
* Quản lý bài viết
* Quản lý người dùng
* Quản lý banner, mã giảm giá, phí ship

---

## **6. Yêu cầu phi chức năng**

* Hoạt động ổn định 24/24
* Khả dụng cao, dễ sử dụng
* Liên kết MXH: Facebook, Instagram, YouTube
* Tốc độ tải nhanh, tối ưu truy vấn
* Bảo mật: mã hóa mật khẩu, phân quyền

---

## **7. Mục tiêu tương lai**

* Tích hợp AI gợi ý sản phẩm
* Xây dựng ứng dụng mobile
* Tối ưu SEO và tốc độ tải trang
* Nâng cấp hệ thống đánh giá – gợi ý size
* Tích hợp chatbot tự động tư vấn

---

## **8. Tác giả & thông tin nhóm**

Dự án được thực hiện bởi nhóm sinh viên:

* **Phạm Nguyễn Thành Nam**
* **Trần Anh Tuấn**
* **Phan Đức Thắng**

---

## **9. Ghi chú triển khai**

* Cài XAMPP → Start Apache & MySQL
* Import file database `.sql`
* Đưa project vào thư mục: `xampp/htdocs/arvila`
* Truy cập tại:

  ```
  http://localhost/arvila/public/
  ```

