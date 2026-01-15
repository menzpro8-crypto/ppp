-- Schema untuk aplikasi ALUMSMK
-- File: alumsmk_schema.sql
-- Buat database terpisah jika belum ada:
-- CREATE DATABASE IF NOT EXISTS `alumsmk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
-- USE `alumsmk`;

-- Tabel: admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `nama_lengkap` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_admin_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Contoh data admin (ubah password sesuai kebutuhan)
INSERT INTO `admin` (`username`, `nama_lengkap`, `password`) VALUES
('admin', 'Administrator', 'admin123');


-- Tabel: alumni
DROP TABLE IF EXISTS `alumni`;
CREATE TABLE `alumni` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nisn` VARCHAR(20) NOT NULL,
  `nama` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `jenis_kelamin` VARCHAR(20) DEFAULT NULL,
  `jurusan` VARCHAR(50) DEFAULT NULL,
  `tahun_lulus` YEAR DEFAULT NULL,
  `no_hp` VARCHAR(30) DEFAULT NULL,
  `telepon` VARCHAR(30) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `alamat` TEXT DEFAULT NULL,
  `status_saat_ini` VARCHAR(100) DEFAULT NULL,
  `status_terkini` VARCHAR(100) DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_alumni_nisn` (`nisn`),
  KEY `idx_tahun_lulus` (`tahun_lulus`),
  KEY `idx_status` (`status_saat_ini`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Catatan:
-- Beberapa file PHP di project menggunakan nama kolom yang sedikit berbeda
-- (mis. `no_hp` vs `telepon`, `status_saat_ini` vs `status_terkini`).
-- Schema di atas menyediakan kedua kolom agar kode dapat dijalankan tanpa error.

-- (Opsional) Contoh data dummy untuk testing
INSERT INTO `alumni` (`nisn`, `nama`, `password`, `jenis_kelamin`, `jurusan`, `tahun_lulus`, `no_hp`, `email`, `alamat`, `status_saat_ini`) VALUES
('1234567890', 'Budi Santoso', 'budi123', 'Laki-laki', 'RPL', '2022', '081234567890', 'budi@example.com', 'Jl. Merdeka 1', 'Bekerja'),
('0987654321', 'Siti Aminah', 'siti123', 'Perempuan', 'MM', '2021', '081298765432', 'siti@example.com', 'Jl. Melati 2', 'Kuliah');

-- Selesai

-- Tabel: jobs (lowongan kerja)
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `company` VARCHAR(255) DEFAULT NULL,
  `location` VARCHAR(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `link` VARCHAR(512) DEFAULT NULL,
  `expire_date` DATE DEFAULT NULL,
  `posted_by` INT UNSIGNED DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Contoh data jobs
INSERT INTO `jobs` (`title`, `company`, `location`, `description`, `link`, `expire_date`, `posted_by`) VALUES
('Junior Web Developer', 'PT. Teknologi Edu', 'Bandung', 'Posisi untuk lulusan baru RPL. Menguasai PHP & MySQL.', '#', '2026-01-31', NULL),
('Desainer Grafis', 'Studio Kreatif', 'Jakarta', 'Butuh desainer dengan portfolio UI/UX.', '#', NULL, NULL);

-- Petunjuk tambahan:
-- Admin dapat menambahkan / menghapus lowongan melalui halaman `jobs_admin.php`.

-- Petunjuk impor:
-- 1) Pastikan database `alumsmk` sudah dibuat atau gunakan perintah CREATE DATABASE di atas.
-- 2) Impor file ini menggunakan MySQL client atau phpMyAdmin.
-- Contoh import (PowerShell):
-- mysql -u root -p alumsmk < "c:\xampp\htdocs\alumsmk\alumsmk_schema.sql"
