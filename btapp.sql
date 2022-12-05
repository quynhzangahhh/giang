﻿CREATE DATABASE LAB7
GO
USE LAB7
GO

-- CREATE TABLES
CREATE TABLE DEAN
(
	TENDA NVARCHAR(15),
	MADA INT NOT NULL,
	DDIEM_DA NVARCHAR(15) NOT NULL,
	PHONG INT NOT NULL,
	
	PRIMARY KEY (MADA)
)

CREATE TABLE PHONGBAN
(
	TENPHG NVARCHAR(15),
	MAPHG INT NOT NULL,
	TRPHG NVARCHAR(9),
	NG_NHANCHUC DATE,
	
	PRIMARY KEY (MAPHG)
)

CREATE TABLE DIADIEM_PHG
(
	MAPHG INT NOT NULL,
	DIADIEM NVARCHAR(15),
	
	PRIMARY KEY (MAPHG, DIADIEM)
)

CREATE TABLE NHANVIEN
(
	HONV NVARCHAR(15),
	TENLOT NVARCHAR(15),
	TENNV NVARCHAR(15),
	MANV NVARCHAR(9) NOT NULL,
	NGSINH DATE,
	DCHI NVARCHAR(30),
	PHAI NVARCHAR(3),
	LUONG FLOAT,
	MA_NQL NVARCHAR(9),
	PHG INT NOT NULL,
	
	PRIMARY KEY (MANV)
)

CREATE TABLE THANNHAN
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	TENTN NVARCHAR(15),
	PHAI NVARCHAR(3),
	NGSINH DATE,
	QUANHE NVARCHAR(15),
	
	PRIMARY KEY (MA_NVIEN, TENTN)
)

CREATE TABLE CONGVIEC
(
	MADA INT NOT NULL,
	STT INT NOT NULL,
	TEN_CONG_VIEC NVARCHAR(50),
	
	PRIMARY KEY (MADA, STT)
)

CREATE TABLE PHANCONG
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	MADA INT NOT NULL,
	STT INT NOT NULL,
	THOIGIAN FLOAT,
	
	PRIMARY KEY (MA_NVIEN, MADA, STT)
)

-- Cài đặt ràng buộc khóa ngoại cho các bảng 
ALTER TABLE DEAN
ADD CONSTRAINT FK_DEAN_PHONG
FOREIGN KEY (PHONG)
REFERENCES PHONGBAN (MAPHG)

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PHONGBAN_NHANVIEN
FOREIGN KEY (TRPHG)
REFERENCES NHANVIEN (MANV)

ALTER TABLE DIADIEM_PHG
ADD CONSTRAINT FK_DIADIEM_PHG_PHONGBAN
FOREIGN KEY (MAPHG)
REFERENCES PHONGBAN (MAPHG)

ALTER TABLE CONGVIEC
ADD CONSTRAINT FK_CONGVIEC_DEAN
FOREIGN KEY (MADA)
REFERENCES DEAN (MADA)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_PHONGBAN
FOREIGN KEY (PHG)
REFERENCES PHONGBAN (MAPHG)

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_NHANVIEN
FOREIGN KEY (MA_NQL)
REFERENCES NHANVIEN (MANV)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_DEAN
FOREIGN KEY (MADA)
REFERENCES DEAN (MADA)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_NHANVIEN
FOREIGN KEY (MA_NVIEN)
REFERENCES NHANVIEN (MANV)

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_THANNHAN_NHANVIEN
FOREIGN KEY (MA_NVIEN)
REFERENCES NHANVIEN (MANV)

BEGIN /** NHANVIEN **/
	ALTER TABLE NHANVIEN
	NOCHECK CONSTRAINT ALL
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Đinh', N'Bá', N'Tiến', '009', '02/11/1960', N'119, Cống Quỳnh, TP.HCM', N'Nam', 30000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Nguyễn', N'Thanh', N'Tùng', '005', '08/20/1962', N'222, Nguyễn Văn Cừ, TP.HCM', N'Nam', 40000, '006', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Bùi', N'Ngọc', N'Hằng', '007', '03/11/1954', N'332, Nguyễn Thái Học, TP.HCM', N'Nam', 25000, '001', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Lê', N'Quỳnh', N'Như', '001', '02/01/1967', N'291, Hồ Văn Huê, TP.HCM', N'Nữ', 43000, '006', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Nguyễn', N'Mạnh', N'Hùng', '004', '03/04/1967', N'95, Bà Rịa - Vũng Tàu', N'Nam', 38000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Trần', N'Thanh', N'Tâm', '003', '05/04/1957', N'34, Mai Thị Lự, TP.HCM', N'Nam', 25000, '005', 5)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
	VALUES (N'Trần', N'Hồng', N'Quang', '008', '09/01/1967', N'45, Lê Hồng Phong, TP.HCM', N'Nam', 25000, '001', 4)
	INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, PHG)
	VALUES (N'Phạm', N'Văn', N'Vinh', '006', '01/01/1965', N'45, Trưng Vương', N'Nữ', 55000, 1)
	ALTER TABLE NHANVIEN
	CHECK CONSTRAINT ALL
END

BEGIN /** PHONGBAN **/
	ALTER TABLE PHONGBAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Nghiên cứu', 5, '005', '05/22/1978')
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Điều hành', 4, '008', '01/01/1985')
	INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
	VALUES (N'Quản lý', 1, '006', '06/19/1971')
	ALTER TABLE PHONGBAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DEAN **/
	ALTER TABLE DEAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm X', 1, N'Vũng Tàu', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm Y', 2, N'Nha Trang', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Sản phẩm Z', 3, N'TP.HCM', 5)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Tin học hóa', 10, N'Hà Nội', 4)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Cáp quang', 20, N'TP.HCM', 1)
	INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
	VALUES (N'Đào tạo', 30, N'Hà Nội', 4)
	ALTER TABLE DEAN
	CHECK CONSTRAINT ALL
END

BEGIN /** THANNHAN **/
	ALTER TABLE THANNHAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
	INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
	VALUES ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
	ALTER TABLE THANNHAN
	CHECK CONSTRAINT ALL
END

BEGIN /** DIADIEM_PHG **/
	ALTER TABLE DIADIEM_PHG
	NOCHECK CONSTRAINT ALL
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (1, N'TP.HCM')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (4, N'Hà Nội')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Vũng Tàu')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Nha Trang')
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'TP.HCM')
	ALTER TABLE DIADIEM_PHG
	CHECK CONSTRAINT ALL
END

BEGIN /** PHANCONG **/
	ALTER TABLE PHANCONG
	NOCHECK CONSTRAINT ALL
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 1, 1, 32)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 2, 2, 8)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('004', 3, 1, 40)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 1, 2, 20.0)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 2, 1, 20.0)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 10, 1, 35)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 30, 2, 5)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 30, 1, 20)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 20, 1, 15)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('006', 20, 1, 30)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 3, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 10, 2, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 20, 1, 10)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 30, 2, 30)
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 10, 2, 10)
	ALTER TABLE PHANCONG
	CHECK CONSTRAINT ALL
END

BEGIN /** CONGVIEC **/
	ALTER TABLE CONGVIEC
	NOCHECK CONSTRAINT ALL
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 1, N'Thiết kế sản phẩm X')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 2, N'Thử nghiệm sản phẩm X')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 1, N'Sản xuất sản phẩm Y')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 2, N'Quảng cáo sản phẩm Y')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (3, 1, N'Khuyến mãi sản phẩm Z')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 1, N'Tin học hóa phòng nhân sự')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 2, N'Tin học hóa phòng kinh doanh')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (20, 1, N'Lắp đặt cáp quang')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 1, N'Đào tạo nhân viên Marketing')
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 2, N'Đào tạo chuyên viên thiết kế')
	ALTER TABLE CONGVIEC
	CHECK CONSTRAINT ALL
END
