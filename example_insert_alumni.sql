-- Example INSERTs for alumni (ALUMSMK)
-- File: example_insert_alumni.sql
-- Make sure database `alumsmk` exists and table `alumni` is present before importing.

USE `alumsmk`;

-- Example alumni entries (passwords are plain-text to match existing app behavior).
-- Change passwords or migrate to hashed passwords if you update authentication logic.

INSERT INTO `alumni` (`nisn`, `nama`, `password`, `jenis_kelamin`, `jurusan`, `tahun_lulus`, `no_hp`, `email`, `alamat`, `status_saat_ini`) VALUES
('1122334455', 'Ahmad Ramadhan', 'ahmad123', 'Laki-laki', 'RPL', '2023', '081234500001', 'ahmad.ramadhan@example.com', 'Jl. Sukamaju No.5, Bandung', 'Bekerja'),
('2233445566', 'Nina Sari', 'nina123', 'Perempuan', 'MM', '2022', '081234500002', 'nina.sari@example.com', 'Jl. Melati No.10, Jakarta', 'Kuliah');

-- Tambahan 10 contoh alumni
INSERT INTO `alumni` (`nisn`, `nama`, `password`, `jenis_kelamin`, `jurusan`, `tahun_lulus`, `no_hp`, `email`, `alamat`, `status_saat_ini`) VALUES
('3344556677', 'Rian Pratama', 'rian123', 'Laki-laki', 'RPL', '2021', '081234500003', 'rian.pratama@example.com', 'Jl. Cendana 3, Surabaya', 'Bekerja'),
('4455667788', 'Intan Permata', 'intan123', 'Perempuan', 'MM', '2020', '081234500004', 'intan.permata@example.com', 'Jl. Dahlia 7, Yogyakarta', 'Wiraswasta'),
('5566778899', 'Fajar Nugraha', 'fajar123', 'Laki-laki', 'TSM', '2019', '081234500005', 'fajar.nugraha@example.com', 'Kompleks Puri RT 4, Bandung', 'Bekerja'),
('6677889900', 'Dewi Lestari', 'dewi123', 'Perempuan', 'RPL', '2018', '081234500006', 'dewi.lestari@example.com', 'Perumahan Melati No.12, Semarang', 'Kuliah'),
('7788990011', 'Seno Aditya', 'seno123', 'Laki-laki', 'OTO', '2022', '081234500007', 'seno.aditya@example.com', 'Jl. Kenanga 22, Malang', 'Bekerja'),
('8899001122', 'Maya Putri', 'maya123', 'Perempuan', 'MM', '2021', '081234500008', 'maya.putri@example.com', 'Jl. Anggrek 5, Jakarta', 'Kuliah'),
('9900112233', 'Agus Santoso', 'agus123', 'Laki-laki', 'TKR', '2017', '081234500009', 'agus.santoso@example.com', 'Gang Mawar 2, Medan', 'Wiraswasta'),
('1011121314', 'Lina Mariana', 'lina123', 'Perempuan', 'RPL', '2020', '081234500010', 'lina.mariana@example.com', 'Jl. Melur 18, Palembang', 'Bekerja'),
('1213141516', 'Hendra Wijaya', 'hendra123', 'Laki-laki', 'TSM', '2016', '081234500011', 'hendra.wijaya@example.com', 'Perumahan Hijau Blok B, Pekanbaru', 'Menganggur/Mencari Kerja'),
('1314151617', 'Santi Rahma', 'santi123', 'Perempuan', 'MM', '2015', '081234500012', 'santi.rahma@example.com', 'Jl. Merpati 9, Balikpapan', 'Bekerja');

-- Notes:
-- - If your `alumni` table has different columns, adjust the INSERT column list accordingly.
-- - Recommended: after importing, edit `proses_login.php` and related code to use `password_hash()` / `password_verify()`.

-- Import instructions (PowerShell):
-- mysql -u root -p alumsmk < "c:\xampp\htdocs\alumsmk\example_insert_alumni.sql"

-- Or use phpMyAdmin: choose database `alumsmk` -> Import -> upload this file -> Go.
