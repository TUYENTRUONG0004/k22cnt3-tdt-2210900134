use k22cnt3_tdt

CREATE TABLE nguoi_dung (
    ma_nguoi_dung INT PRIMARY KEY,
    ten_dang_nhap NVARCHAR(50),
    email VARCHAR(100),
    mat_khau VARCHAR(255),
    so_du DECIMAL(10, 2) DEFAULT 0.0
);

CREATE TABLE the_nap (
    ma_the INT PRIMARY KEY,
    ten_the VARCHAR(50) ,
    gia_tri DECIMAL(10, 2) ,
    so_luong INT DEFAULT 0,
);

CREATE TABLE giao_dich (
    ma_giao_dich INT PRIMARY KEY,
    ma_nguoi_dung INT,
    ma_the INT,
    ma_dich_vu INT,
    so_tien DECIMAL(10, 2),
    FOREIGN KEY (ma_nguoi_dung) REFERENCES nguoi_dung(ma_nguoi_dung),
    FOREIGN KEY (ma_the) REFERENCES the_nap(ma_the),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(50),
    mo_ta TEXT,
);

CREATE TABLE thong_bao (
    ma_thong_bao INT PRIMARY KEY,
    ma_nguoi_dung INT,
    noi_dung TEXT,
    FOREIGN KEY (ma_nguoi_dung) REFERENCES nguoi_dung(ma_nguoi_dung)
);

select*from nguoi_dung
select*from giao_dich
select*from the_nap
select*from dich_vu
select*from thong_bao
-- nguoi_dung
INSERT INTO nguoi_dung (ma_nguoi_dung, ten_dang_nhap, email, mat_khau, so_du)
VALUES 
(1, N'nguyenanh', 'nguyenanh@example.com', 'hashed_password_123', 100000),
(2, N'tranminh', 'tranminh@example.com', 'hashed_password_456', 50000),
(3, N'lethanh', 'lethanh@example.com', 'hashed_password_789', 75000);

--the_nap
INSERT INTO the_nap (ma_the, ten_the, gia_tri, so_luong)
VALUES 
(1, 'Viettel 100K', 100000, 50),
(2, 'MobiFone 50K', 50000, 100),
(3, 'Vinaphone 200K', 200000, 30),
(4, 'Zing 500K', 500000, 10);

--dich_vu
INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, mo_ta)
VALUES 
(1, 'Nạp tiền điện thoại', 'Dịch vụ nạp tiền cho các nhà mạng Viettel, MobiFone, Vinaphone'),
(2, 'Nạp Zing xu', 'Dịch vụ nạp Zing xu vào tài khoản game Zing'),
(3, 'Nạp game Garena', 'Dịch vụ nạp thẻ cho các trò chơi của Garena');

--giao_dich
INSERT INTO giao_dich (ma_giao_dich, ma_nguoi_dung, ma_the, ma_dich_vu, so_tien)
VALUES 
(1, 1, 1, 1, 100000),
(2, 2, 2, 1, 50000),
(3, 3, 3, 2, 200000),
(4, 1, 4, 3, 500000);

--thong_bao
INSERT INTO thong_bao (ma_thong_bao, ma_nguoi_dung, noi_dung)
VALUES 
(1, 1, 'Giao dịch nạp tiền 100,000 VNĐ thành công.'),
(2, 2, 'Giao dịch nạp tiền 50,000 VNĐ đang chờ xử lý.'),
(3, 3, 'Giao dịch nạp tiền 200,000 VNĐ thành công.'),
(4, 1, 'Giao dịch nạp tiền 500,000 VNĐ thất bại.');
