drop database if exists heroku_8e97baee4eb18f6;
create database heroku_8e97baee4eb18f6;
use heroku_8e97baee4eb18f6;
create table loai_dich_vu (
	id_loai_dich_vu int not null primary key,
    ten_loai_dich_vu nvarchar(255) not null
);
create table kieu_thue (
	id_kieu_thue int not null primary key,
    ten_kieu_thue nvarchar(255) not null,
    gia double not null
);
create table dich_vu (
	id_dich_vu nvarchar(50) not null primary key,
    ten_dich_vu nvarchar(255) not null,
    dien_tich_su_dung float not null,
    chi_phi_thue double not null,
    so_tang int not null,
    so_nguoi_toi_da int not null,
    trang_thai nvarchar(50) not null,
    id_loai_dich_vu int,
    id_kieu_thue int,
    constraint fk_dichvu_loai_dich_vu foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu),
    constraint fk_dichvu_kieuthue foreign key(id_kieu_thue) references kieu_thue(id_kieu_thue)
);
create table nhan_vien (
	id_nhan_vien nvarchar(50) not null primary key,
	ho_ten nvarchar(50) not null,
    ngay_sinh date not null,
    so_cmnd nvarchar(20) not null,
    so_dt nvarchar(20) not null,
    email nvarchar(20) not null,
    trinh_do nvarchar(20) not null,
    vi_tri nvarchar(20) not null,
    luong double,
    dia_chi nvarchar(255) not null
);
create table loai_khach (
	id_loai_khach int not null primary key,
    ten_loai_khach nvarchar(255) not null
);
create table khach_hang (
	id_khach_hang int not null primary key,
	ho_ten nvarchar(50) not null,
    ngay_sinh date not null,
    gioi_tinh bit not null,
    so_cmnd nvarchar(20) not null,
    so_dt nvarchar(20) not null,
    email nvarchar(20) not null,
    id_loai_khach int not null,
    dia_chi nvarchar(255) not null,
    constraint fk_khach_hang_loai_khach foreign key(id_loai_khach) references loai_khach(id_loai_khach)
);
create table hop_dong (
	id_hop_dong int not null primary key,
    ngay_bat_dau date,
    ngay_ket_thuc date,
    tien_dat_coc double,
    tong_tien double,
    id_khach_hang int,
    id_dich_vu nvarchar(50),
    id_nhan_vien nvarchar(50),
    constraint fk_hop_dong_khach_hang foreign key(id_khach_hang) references khach_hang(id_khach_hang) on delete cascade,
    constraint fk_hop_dong_dich_vu foreign key(id_dich_vu) references dich_vu(id_dich_vu) on delete cascade,
    constraint fk_hop_dong_nhan_vien foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien) on delete cascade
    
);
create table dich_vu_di_kem (
	id_dich_vu_di_kem int not null primary key,
    ten_dich_vu_di_kem nvarchar(50),
    gia double,
    don_vi_tinh int
);
create table hop_dong_chi_tiet (
	id_hop_dong int,
    id_dich_vu_di_kem int,
    so_luong int,
    primary key (id_hop_dong,id_dich_vu_di_kem),
    constraint fk_hop_dong_chi_tiet_hop_dong foreign key(id_hop_dong) references hop_dong(id_hop_dong) on delete cascade,
    constraint fk_hop_dong_chi_tiet_dich_vu_di_kem foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem) on delete cascade
);

create table user (
	id int not null primary key,
    email nvarchar(200) not null,
    password nvarchar(512) not null
);
create table role (
	id int not null primary key,
    name nvarchar(50)
);
create table user_role (
	user_id int,
    role_id int,
    primary key(user_id, role_id)
);
insert into user(id, email, password) values (1, 'admin@gmail.com', '$2a$10$cvWsgvj4CDxVF9NvFczyyuw.tr5RIaA2CYPHFb.thDQCHdmBeAqwq');
insert into user(id, email, password) values (2, 'member@gmail.com', '$2a$10$cvWsgvj4CDxVF9NvFczyyuw.tr5RIaA2CYPHFb.thDQCHdmBeAqwq');

insert into role(id, name) values (1, 'ROLE_ADMIN');
insert into role(id, name) values (2, 'ROLE_MEMBER');

insert into user_role(user_id, role_id) values (1,1);
insert into user_role(user_id, role_id) values (2,2);


-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự
insert into nhan_vien values(1,'Nguyen Van A','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(2,'Huynh Phuoc Anh','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(3,'Huynh Phuoc Ba','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(4,'Huynh Phuoc Ba Don','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(5,'Tran Phuoc Thien','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(6,'Tran Phuoc Thien Dat','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(7,'Kim Phuoc Thien','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(8,'Kim Phuoc Ba','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
insert into nhan_vien values(9,'Kim Phuoc Binh Thien','1988:01:01','201561123','0935123456','a@a.com','Đại học','Dev',15000000, 'Đà Nẵng');
select length(ho_ten),ho_ten from nhan_vien where ((ho_ten like 'H%') or (ho_ten like 'T%') or (ho_ten like 'K%')) and length(ho_ten)<=15; 
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”
insert into loai_khach values(1, 'Diamond');
insert into loai_khach values(2, 'Platinium');
insert into loai_khach values(3, 'Platinium');
insert into loai_khach values(4, 'Silver');
insert into loai_khach values(5, 'Member');
insert into khach_hang values(1,'Nguyen Van A','1988:01:01', 0 , '201561123', '0935123456','a@a.com', 1, 'Đà Nẵng');
insert into khach_hang values(2,'Nguyen Van B','1968:01:01', 0 , '201561123', '0935123456','a@a.com', 1, 'Quảng Ngãi');
insert into khach_hang values(3,'Nguyen Van C','1908:01:01', 0 , '201561123', '0935123456','a@a.com', 1, 'Vinh');
insert into khach_hang values(4,'Nguyen Van C','1908:01:01', 0 , '201561123', '0935123456','a@a.com', 1, 'Quảng Trị');
insert into khach_hang values(5,'Nguyen Van D','1908:01:01', 0 , '201561123', '0935123456','a@a.com', 1, 'Quảng Trị');
select timestampdiff(YEAR, ngay_sinh, now()), dia_chi from khach_hang where (timestampdiff(YEAR, ngay_sinh, now()) >=18 and timestampdiff(YEAR, ngay_sinh, now()) <=50) and (dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị');
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”
insert into loai_dich_vu values(1,'Villa');
insert into loai_dich_vu values(2,'House');
insert into loai_dich_vu values(3,'Room');
insert into kieu_thue values(1,'Năm',12000000);
insert into kieu_thue values(2,'Tháng',1000000);
insert into kieu_thue values(3,'Ngày',100000);
insert into kieu_thue values(4,'Giờ',10000);
insert into dich_vu values(1,'Xuan mai',50,5000000,3,5,30,1,1);
insert into dich_vu values(2,'Mai Phuong',30,3000000,2,2,10,2,2);
insert into dich_vu values(3,'Thanh Phong',10,1000000,4,4,5,3,3);
insert into dich_vu values(4,'Tuan Thanh',10,1000000,5,10,5,3,3);
insert into dich_vu values(5,'Tuan Thanh 2',10,1000000,6,14,5,3,3);

insert into hop_dong values(1,'2019:11:05','2019:11:15',300000,20000000,1,1,1);
insert into hop_dong values(2,'2019:11:15','2019:11:25',200000,50000000,2,2,2);
insert into hop_dong values(3,'2019:11:15','2019:11:25',300000,30000000,1,1,3);
insert into hop_dong values(4,'2019:01:01','2019:11:25',300000,10000000,1,1,4);
insert into hop_dong values(5,'2019:02:02','2019:11:25',300000,10000000,1,2,5);
insert into hop_dong values(6,'2019:03:31','2019:11:25',300000,10000000,1,2,6);
insert into hop_dong values(7,'2018:03:31','2019:11:25',300000,10000000,3,1,7);
insert into hop_dong values(8,'2019:03:31','2019:11:25',300000,1000000,3,1,1);
insert into hop_dong values(9,'2018:03:31','2019:11:25',300000,1000000,3,3,1);
insert into hop_dong values(10,'2019:12:31','2019:11:25',300000,1000000,3,4,1);
insert into hop_dong values(11,'2015:12:31','2019:11:25',600000,2000000,3,4,1);
insert into hop_dong values(12,'2015:12:31','2019:11:25',600000,2000000,3,4,1);
insert into hop_dong values(13,'2019:12:31','2019:11:25',600000,2000000,3,4,1);
insert into hop_dong values(14,'2019:12:31','2019:11:25',600000,2000000,3,4,1);
insert into hop_dong values(15,'2015:12:31','2019:11:25',600000,2000000,5,4,1);
select * from khach_hang;

select * from dich_vu;
select * from hop_dong;
select khach_hang.ho_ten, count(hop_dong.id_dich_vu) as so_lan_dat_phong 
	from loai_khach 
	inner join khach_hang on khach_hang.id_loai_khach = loai_khach.id_loai_khach
	inner join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
   -- inner join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
    where loai_khach.ten_loai_khach = 'Diamond'
	group by khach_hang.ho_ten
    order by so_lan_dat_phong;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
insert into dich_vu_di_kem values(1, 'karaoke', 50000, 1);
insert into dich_vu_di_kem values(2, 'nước ngọt', 10000, 1);
insert into dich_vu_di_kem values(3, 'Khăn mặt', 5000, 1);
insert into dich_vu_di_kem values(4, 'matxa', 50000, 1);
insert into hop_dong_chi_tiet values(1,1,1);
insert into hop_dong_chi_tiet values(1,2,5);
insert into hop_dong_chi_tiet values(1,3,10);
insert into hop_dong_chi_tiet values(2,1,1);
insert into hop_dong_chi_tiet values(2,2,10);
insert into hop_dong_chi_tiet values(2,3,20);
insert into hop_dong_chi_tiet values(3,1,5);
insert into hop_dong_chi_tiet values(4,1,5);
insert into hop_dong_chi_tiet values(5,1,5);
insert into hop_dong_chi_tiet values(6,1,5);
insert into hop_dong_chi_tiet values(7,1,5);
insert into hop_dong_chi_tiet values(8,1,5);
insert into hop_dong_chi_tiet values(9,1,5);
insert into hop_dong_chi_tiet values(10,1,5);
insert into hop_dong_chi_tiet values(11,4,1);
insert into hop_dong_chi_tiet values(13,1,5);
insert into hop_dong_chi_tiet values(14,1,5);
select * from loai_khach;
select * from khach_hang;
select * from dich_vu;
select * from hop_dong;
select * from hop_dong_chi_tiet;
select khach_hang.id_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.id_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_bat_dau, hop_dong.ngay_ket_thuc, sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia) as TongTien  from loai_khach 
	-- select * from loai_khach
    inner join khach_hang 
	on khach_hang.id_loai_khach = loai_khach.id_loai_khach
	left join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
    left join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
    left join hop_dong_chi_tiet  on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
    left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
    group by khach_hang.id_khach_hang;
-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3)
select * from dich_vu;
select * from hop_dong;
-- dịch vụ chưa từng đặt
select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich_su_dung, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
where 
not exists (select hop_dong.id_hop_dong from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu)
union --  1 dịch vụ đặt trước ngày 1/1/2019 và sau ngày 1/1/2019 không có đặt -> đưa ra
select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich_su_dung, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
where 
exists (select hop_dong.id_hop_dong from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu and hop_dong.ngay_bat_dau < '2019:01:01')
and not exists (select hop_dong.id_hop_dong from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu and hop_dong.ngay_bat_dau >= '2019:01:01');

    
select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich_su_dung, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
where not exists(select hop_dong.id_hop_dong from hop_dong where (hop_dong.ngay_bat_dau between '2019:01:01' and '2019:03:31') AND hop_dong.id_dich_vu=dich_vu.id_dich_vu);

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019
select * from hop_dong;
select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich_su_dung, dich_vu.so_nguoi_toi_da , dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
where 
exists (select hop_dong.id_hop_dong from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu and year(hop_dong.ngay_bat_dau) = 2018)
and not exists (select hop_dong.id_hop_dong from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu and year(hop_dong.ngay_bat_dau) = 2019);

select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich_su_dung, dich_vu.so_nguoi_toi_da , dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from dich_vu
inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
where 
exists (select hop_dong.id_hop_dong from hop_dong where year(hop_dong.ngay_bat_dau) = 2018);


-- join vs union
select 1,2
union 
select 3,4;

select * from
(select 1,2) as a
join 
(select 3,4) as b
on 33=33;


-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau. Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
select distinct khach_hang.ho_ten from khach_hang;
select khach_hang.ho_ten from khach_hang group by khach_hang.ho_ten;
select khach_hang.ho_ten from khach_hang union select khach_hang.ho_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select query_3.month, query_3.so_khach_hang_dang_ky, query_3.tong_tien
from (
	select query_1.month, query_1.so_khach_hang_dang_ky, query_1.tong_tien
	from (
		select m.month, count(hop_dong.id_hop_dong) as so_khach_hang_dang_ky, coalesce(sum(hop_dong.tong_tien),0) as tong_tien 
		from
			(
				select 1 as month union select 2 as month union select 3 as month union select 4 as month union select 5 as month union select 6 as month
				union select 7 as month union select 8 as month union select 9 as month union select 10 as month union select 11 as month union select 12 as month
			) m
		left join hop_dong on month(hop_dong.ngay_bat_dau) = m.month
		left join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
		where year(hop_dong.ngay_bat_dau) = '2019' or hop_dong.ngay_bat_dau is null
		group by m.month
		order by m.month
	) as query_1
	union
	select query_2.month , 0 as so_khach_hang_dang_ky, 0 as tong_tien
	FROM (
						 SELECT 1 AS MONTH
						  UNION SELECT 2 AS MONTH
						  UNION SELECT 3 AS MONTH
						  UNION SELECT 4 AS MONTH
						  UNION SELECT 5 AS MONTH
						  UNION SELECT 6 AS MONTH
						  UNION SELECT 7 AS MONTH
						  UNION SELECT 8 AS MONTH
						  UNION SELECT 9 AS MONTH
						  UNION SELECT 10 AS MONTH
						  UNION SELECT 11 AS MONTH
						  UNION SELECT 12 AS MONTH
						  UNION SELECT 12 AS MONTH
	) as query_2
) as query_3
group by query_3.month
order by query_3.month;
select * from hop_dong;

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet)
select * from hop_dong;
select * from hop_dong_chi_tiet;
select hop_dong.id_hop_dong, hop_dong.ngay_bat_dau, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_luong_dich_vu_di_kem
from hop_dong
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
group by hop_dong.id_hop_dong;
	
-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”
select dich_vu_di_kem.* 
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
inner join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
inner join loai_khach on loai_khach.id_loai_khach = khach_hang.id_loai_khach
where
loai_khach.ten_loai_khach = 'Diamond'
and (khach_hang.dia_chi = 'Vinh' or khach_hang.dia_chi = 'Quảng Ngãi');


-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019
select * from hop_dong;
select * from hop_dong_chi_tiet;
select * from dich_vu_di_kem;


select hop_dong.id_hop_dong, hop_dong.ngay_bat_dau, dich_vu.id_dich_vu, nhan_vien.ho_ten, khach_hang.ho_ten, khach_hang.so_dt, dich_vu.ten_dich_vu , hop_dong.tien_dat_coc,count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
inner join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
inner join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
inner join nhan_vien on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
where
 exists (select hop_dong.ngay_bat_dau from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu and hop_dong.ngay_bat_dau between '2019-10-01' and '2019-12-31')
and not exists (select hop_dong.ngay_bat_dau from hop_dong where hop_dong.id_dich_vu = dich_vu.id_dich_vu and hop_dong.ngay_bat_dau between '2019-01-01' and '2019-06-30')
group by hop_dong_chi_tiet.id_hop_dong;


-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select A.id_dich_vu_di_kem, max(A.so_lan_dat)
from
(
select dich_vu_di_kem.*, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_lan_dat
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
group by dich_vu_di_kem.id_dich_vu_di_kem
) A;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung
select hop_dong.id_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, count(hop_dong_chi_tiet.id_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
inner join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
group by dich_vu_di_kem.id_dich_vu_di_kem
having so_lan_su_dung = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019
select nhan_vien.id_nhan_vien, nhan_vien.ho_ten, nhan_vien.trinh_do, nhan_vien.so_dt, count(hop_dong.id_nhan_vien) as so_luong_hop_dong
from nhan_vien
inner join hop_dong on nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
where hop_dong.ngay_bat_dau between "2018-01-01" and "2019-12-31"
group by nhan_vien.id_nhan_vien
having so_luong_hop_dong <=3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019
select count(1) from nhan_vien;
select count(1) from hop_dong;
SET SQL_SAFE_UPDATES=0;
delete from nhan_vien 
where not exists ( select hop_dong.id_nhan_vien from hop_dong where hop_dong.ngay_bat_dau between "2017-01-01"and "2019-12-31" and hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien);
SET SQL_SAFE_UPDATES=1;

-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
select * from khach_hang;
update khach_hang, (
select khach_hang.id_khach_hang from khach_hang
inner join loai_khach on loai_khach.id_loai_khach = khach_hang.id_loai_khach
inner join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
where loai_khach.ten_loai_khach = 'Platinium'
and hop_dong.tong_tien > 10000000
and year(hop_dong.ngay_bat_dau) = '2019'
group by hop_dong.id_khach_hang
) temp set khach_hang.id_loai_khach = 1 where khach_hang.id_khach_hang = temp.id_khach_hang;

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).
-- chua dc
select * from hop_dong_chi_tiet;
select * from hop_dong;
select * from khach_hang;
select count(*) from hop_dong_chi_tiet;
select count(*) from hop_dong;
select count(*) from khach_hang;
select * from hop_dong where not exists (select hop_dong.id_hop_dong from hop_dong_chi_tiet where hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong);
SET SQL_SAFE_UPDATES=0;
delete khach_hang, hop_dong_chi_tiet from khach_hang 
inner join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang 
left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
 where not exists (select hop_dong.id_hop_dong from hop_dong where hop_dong.ngay_bat_dau > '2016-01-01' and hop_dong.id_khach_hang = khach_hang.id_khach_hang);
SET SQL_SAFE_UPDATES=1;


-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi
select * from dich_vu_di_kem;
update dich_vu_di_kem, (
select dich_vu_di_kem.id_dich_vu_di_kem from dich_vu_di_kem
inner join hop_dong_chi_tiet on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
inner join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
where year(hop_dong.ngay_bat_dau) = '2019'
group by hop_dong_chi_tiet.id_dich_vu_di_kem
having count(dich_vu_di_kem.id_dich_vu_di_kem) >=10
) temp set dich_vu_di_kem.gia = (dich_vu_di_kem.gia * 2) where dich_vu_di_kem.id_dich_vu_di_kem = temp.id_dich_vu_di_kem;

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi
select nhan_vien.id_nhan_vien, nhan_vien.ho_ten , nhan_vien.email, nhan_vien.so_dt, nhan_vien.ngay_sinh, nhan_vien.dia_chi, "nhan_vien"
from nhan_vien
union all
select khach_hang.id_khach_hang, khach_hang.ho_ten, khach_hang.email, khach_hang.so_dt, khach_hang.ngay_sinh, khach_hang.dia_chi, "khach_hang"
from khach_hang;