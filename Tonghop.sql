use quanlybanhang3;
create table KhachHang(
MaKH varchar(4) primary key, 
TenKH varchar(30) not null,
Diachi varchar(50),
Ngaysinh datetime,
SoDT varchar(15)
);
create table NhanVien(
MaNV varchar(4) primary key,
HoTen varchar(30),
GioiTinh bit,
DiaChi varchar(50),
NgaySinh datetime,
DienThoai varchar(15) not null,
Email varchar(255) not null,
NoiSinh varchar(20),
NgayVaoLam datetime not null,
MaNQL varchar(4) not null
);
create table NhaCungCap(
MaNCC varchar(5) primary key,
TenNCC varchar (50),
DiaChi varchar(50),
DienThoai varchar(15),
Email varchar(30), 
Website varchar(30) not null
);
create table LoaiSP(
MaloaiSP varchar(4) primary key,
TenloaiSP varchar(30),
Ghichu varchar(100) 
);
create table PhieuNhap(
SoPN varchar(5) primary key,
MaNV varchar(4),
MaNCC varchar(5),
Ngaynhap datetime,
Ghichu varchar(100) not null
);
create table CTPhieuNHap(
MaSP varchar(4),
SoPN varchar(5),
primary key(MaSP, SoPN),
Soluong smallint default 0,
Gianhap real check(Gianhap>=0)
);
create table PhieuXuat(
SoPX varchar(5) primary key,
MaNV varchar(4),
MaKH varchar(4),
NgayBan datetime,
GhiChu varchar(255) not null
);
create table CTPhieuXuat(
SoPX varchar(5),
MaSP varchar(4),
primary key(SoPX, MaSP),
Soluong smallint,
GiaBan real);
create table Sanpham(
MaSp varchar(4) primary key,
MaloaiSP varchar(4),
TenSP varchar(50),
Donvitinh varchar(10),
Ghichu varchar(100) not null
);
alter table phieunhap
add foreign key(MaNCC) references NhaCungCap(MaNCC); 
alter table phieunhap
add foreign key(MaNV) references nhanvien(MaNv);
alter table phieuxuat
add foreign key(MaNV) references nhanvien(MaNV);
alter table phieuxuat 
add foreign key(MaKH) references khachhang(MaKH);
/**/
alter table ctphieuxuat
add foreign key(MaSP) references sanpham(MaSP);
alter table ctphieuxuat
 add foreign key(SoPX) references phieuxuat(SoPx);
alter table sanpham
add foreign key(MaloaiSp) references LoaiSp(MaloaiSp);
alter table ctphieunhap 
add foreign key(MaSP) references Sanpham(MaSP);
alter table ctphieunhap
add foreign key(SoPN) references PhieuNhap(SoPN);
/*Thêm vào bảng nhân viên */
insert into nhanvien(MaNv,hoten,gioitinh,diachi,ngaysinh,dienthoai,noisinh) values
("NV1","Nguyen Thi Ngan",0,"ha noi","1995-11-20","0350423056","thanh hoa"),
("NV2","Hoàng Thái",1,"ha noi","2000-10-12","0350423056","nghe an"),
("NV3","Trần Hiền",1,"ha noi","1998-10-30","0350423056","thái bình"),
("NV4","Phạm Mai Hương",0,"ha noi","1997-10-5","0350423056","Hà Tĩnh");
/*Thêm thông tin vào NCC */
insert into nhacungcap(MaNCC, tenncc,diachi,dienthoai,email) values
("NCC1","nhã nam","cầu giấy","0253987265","nhanam@gmail.com"),
("NCC2","phương nam","đống đa","0253987265","phuongnam@gmail.com"),
("NCC3","nhà sách trẻ","mỹ đình","0253987265","mydinh@gmail.com"),
("NCC4","nhã nam 2","cầu giấy","0253987265","nhanam@gmail.com"),
("NCC5","nhã nam 3","cầu giấy","0253987265","nhanam@gmail.com");
/*Thêm thông tin KH */
insert into khachhang(MaKH,tenkh,diachi,ngaysinh,sodt) values
("KH1","Hồ Văn Khánh","Nghệ An","1995-12-12","0356892152"),
("KH2","Trần Văn Hiền","Hà Nội","1995-12-12","0356892112"),
("KH3","Mai Văn Tuấn","Hà Tĩnh","1995-12-12","0356892179"),
("KH4","Nguyễn Ngọc Huyền","Thái Bình","1995-12-12","0356892196"),
("KH5","Nguyễn QuangTrung","Ninh Bình","1995-12-12","0356892178");
/*Thêm thông tin loại sp*/
insert into loaisp(Maloaisp,tenloaisp,ghichu) values
("T1","tiểu thuyết", "kinh dị"),
("T2","tình cảm","tuổi teen"),
("T3","trinh thám","mạo hiểm");
/*Thêm thông tin sản phẩm */
insert into sanpham(maSp,Maloaisp,tensp,donvitinh) values
("1","T1","hôm nay tôi đi học","quyển"),
("2","T2","trời mưa","quyển"),
("3","T3","tóc nâu","quyển"),
("4","T1","quản lí tài chính","quyển"),
("5","T2","tên cậu là gì","quyển");
/*Thêm thông tin ctphieunhap*/
set foreign_key_checks=0; /*vô hiệu hóa foreign check */
insert into ctphieunhap(masp,sopn,soluong,gianhap) values
("1","2",10,20000),
("2","1",12,30000),
("3","2",6,25000),
("4","2",5,23000);
set foreign_key_checks =1; /*kích hoạt lại foreign check */
/*Thêm thông tin ct phiếu xuất */
insert into ctphieuxuat(sopx,masp,soluong,giaban) values
("5","1",10,52000),
("6","2",7,53000),
("7","5",4,54000),
("8","4",9,55000);
/*Bài 4: Dùng lệnh UPdate cập nhật dữ liệu cho các bảng, 
Cập nhật lại số điện thoại mới cho khách hàng mã KH10 */
select* from khachhang;
update khachhang 
set soDt= 0342345678
where MaKH= "KH10";
/* Cập nhật lại địa chỉ mới của nhân viên mã NV5*/
update khachhang
set Diachi = "HCM"
where MaKH = "KH5";
/*BT3: Thêm 2 Phiếu nhập trong tháng hiện hành. Mỗi phiếu nhập có 2 sản phẩm.*/
select * from phieunhap;
insert into phieunhap(SoPN, MaNV, MaNCC,Ngaynhap)
values("1","NV1","NCC1", "2022-12-12"),
("2","NV2", "NCC2", "2022-11-11");
/*BT3- Thêm 2 Phiếu xuất trong ngày hiện hành. Mỗi phiếu xuất có 3 sản phẩm*/
select * from phieuxuat;
insert into phieuxuat(SoPX, MaNV, MaKH, NgayBan)
values("PX2", "NV2","KH2", now());
/*BT3- Thêm 1 nhân viên mới */
select * from nhanvien;
insert into nhanvien(MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, NoiSinh)
values("NV5", "Nguyen Thi Thu",0,"Ha Noi", "2000-09-11", "0350423055","Yen Bai");
/*BT5: Dùng lệnh DELETE xóa dữ liệu các bảng 
1. Xóa nhân viên mới vừa thêm tại yêu cầu C.3*/
delete from nhanvien
where HoTen= "Nguyen Thi Thu";
/*2. Thêm Sp mã SP15*/
set foreign_key_checks=0;
set foreign_key_checks=1;
select * from sanpham;
insert into sanpham(MaSp, MaloaiSP, TenSP, Donvitinh)
values("SP15", "T15","Kiminonawa", "quyển");
/*2. Xóa sản phẩm mã SP15*/
delete from sanpham where MaSp= "SP15";
/*Bài 6: Dùng lệnh SELECT lấy dữ liệu từ các bảng*/
/*1. Liệt kê thông tin về nhân viên trong cửa hàng, gồm: mã nhân viên, họ tên
nhân viên, giới tính, ngày sinh, địa chỉ, số điện thoại, tuổi. Kết quả sắp xếp
theo tuổi*/
select * from nhanvien;
select MaNV, HoTen, GioiTinh, NgaySinh, DiaChi, DienThoai from NhanVien
order by NgaySinh desc;
/*2. Liệt kê các hóa đơn nhập hàng trong tháng 6/2018, gồm thông tin số phiếu
nhập, mã nhân viên nhập hàng, họ tên nhân viên, tên nhà cung cấp, ngày
nhập hàng, ghi chú.*/
select phieunhap.SoPN, phieunhap.MaNV, nhanvien.Hoten, nhacungcap.TenNCC, phieunhap.Ngaynhap, phieunhap.Ghichu
from phieunhap
join nhanvien on phieunhap.MaNV= nhanvien.MaNV
join nhacungcap on phieunhap.MaNCC = nhacungcap.MaNCC;
/*3. Liệt kê tất cả sản phẩm có đơn vị tính là quyển, gồm tất cả thông tin về sp*/
select * from sanpham
where Donvitinh= "quyển";
/* 4- Liệt kê chi tiết nhập hàng trong tháng hiện hành gồm thông tin: số phiếu
nhập, mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính, số lượng, giá
nhập, thành tiền*/
select * from sanpham;
select * from phieunhap;
select * from loaisp;
select* from ctphieunhap;
select sanpham.MaSp, sanpham.TenSP, sanpham.Donvitinh,sanpham.TenSP, 
phieunhap.SoPn,  phieunhap.Ngaynhap,
loaisp.TenloaiSP, 
ctphieunhap.soluong,ctphieunhap.Gianhap, sum(ctphieunhap.soluong* ctphieunhap.Gianhap) as "thanh tien"
from ctphieunhap
join sanpham on sanpham.MaSP= ctphieunhap.MaSP
join loaisp on sanpham.MaloaiSP = loaisp.MaloaiSP
join phieunhap on phieunhap.SoPN = ctphieunhap.SoPN
where month(phieunhap.Ngaynhap) = month(curdate())
group by ctphieunhap.SoPn;
/*5. Liệt kê các nhà cung cấp có giao dịch mua bán trong tháng hiện hành, gồm
thông tin: mã nhà cung cấp, họ tên nhà cung cấp, địa chỉ, số điện thoại,
email, số phiếu nhập, ngày nhập. Sắp xếp thứ tự theo ngày nhập hàng*/
select * from nhacungcap;
select nhacungcap.MaNCC, nhacungcap.TenNCC, nhacungcap.DiaChi, nhacungcap.DienThoai, nhacungcap.Email,
phieunhap.SoPN, phieunhap.Ngaynhap
from nhacungcap
join phieunhap on nhacungcap.MaNCC = phieunhap.MaNCC
where month(phieunhap.Ngaynhap) = month(curdate())
order by phieunhap.Ngaynhap;
/* 6- Liệt kê chi tiết hóa đơn bán hàng trong 6 tháng đầu năm 2023 gồm thông tin:
số phiếu xuất, nhân viên bán hàng, ngày bán, mã sản phẩm, tên sản phẩm,
đơn vị tính, số lượng, giá bán, doanh thu.*/
select * from phieuxuat;
select * from nhanvien;
select * from sanpham;
select * from ctphieuxuat;
select phieuxuat.SoPX, phieuxuat.NgayBan,
nhanvien.HoTen, 
sanpham.MaSp, sanpham.TenSp, sanpham.Donvitinh,
ctphieuxuat.Soluong, ctphieuxuat.GiaBan, (ctphieuxuat.soluong* ctphieuxuat.giaban) as "Doanh thu"
from phieuxuat
join nhanvien on phieuxuat.MaNv= nhanvien.MaNV
join ctphieuxuat on ctphieuxuat.SoPX = phieuxuat.SoPX
join sanpham on sanpham.MaSP = ctphieuxuat.MaSP
where phieuxuat.NgayBan >= "2023-01-01" and phieuxuat.NgayBan < "2023-07-01";
/* 8-  Hãy in danh sách khách hàng có ngày sinh nhật trong tháng hiện hành (gồm
tất cả thông tin của khách hàng)*/
select * from khachhang
where month(NgaySinh) = month(curdate()); 
/* 9- Liệt kê các hóa đơn mua hàng theo từng khách hàng, gồm các thông tin: số
phiếu xuất, ngày bán, mã khách hàng, tên khách hàng, trị giá.*/
select phieuxuat.SoPX, phieuxuat.NgayBan, phieuxuat.MaKH,
khachhang.tenKH,
sum(ctphieuxuat.Soluong* ctphieuxuat.Giaban) as "Tri Gia"
from phieuxuat
join khachhang on phieuxuat.MaKH = khachhang.MaKH
join ctphieuxuat on phieuxuat.SoPX = ctphieuxuat.SoPX
group by khachhang.tenKH;
/*10. Cho biết tổng số quyển sách "tên cậu là gì " đã bán trong 6 tháng đầu năm
2023. Thông tin hiển thị: tổng số lượng*/
select * from sanpham;
select sanpham.TenSp,
sum(ctphieuxuat.soluong) as "Total",
phieuxuat.NgayBan
from ctphieuxuat
join sanpham on sanpham.MaSP= ctphieuxuat.MaSP
join phieuxuat on phieuxuat.SoPX = ctphieuxuat.SoPX
where phieuxuat.NgayBan >= "2023-01-01" and phieuxuat.NgayBan < "2023-07-01" and sanpham.TenSp = "tên cậu là gì"
group by sanpham.TenSp

/**/


