-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Apr 29, 2024 at 05:53 AM
-- Server version: 5.7.44
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ams_native`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_disposisi`
--

CREATE TABLE `tbl_disposisi` (
  `id_disposisi` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `isi_disposisi` mediumtext NOT NULL,
  `sifat` varchar(100) NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `id_surat` int(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_disposisi`
--

INSERT INTO `tbl_disposisi` (`id_disposisi`, `tujuan`, `isi_disposisi`, `sifat`, `batas_waktu`, `catatan`, `id_surat`, `id_user`) VALUES
(2, 'Nur Hafid', 'Segera Koordinasi Pelaksanaan Zakat Fitrah', 'Segera', '2016-06-12', 'Segera Laksanakan', 11, 5),
(3, 'Ani Triastuti, S.E., S.Pd', 'Segera hadiri undangan', 'Penting', '2016-05-17', 'Mohon hadir tepat waktu', 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_instansi`
--

CREATE TABLE `tbl_instansi` (
  `id_instansi` tinyint(1) NOT NULL,
  `institusi` varchar(150) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `kepsek` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_instansi`
--

INSERT INTO `tbl_instansi` (`id_instansi`, `institusi`, `nama`, `status`, `alamat`, `kepsek`, `nip`, `website`, `email`, `logo`, `id_user`) VALUES
(1, 'DPM-PTSP SURABAYA', 'DPMPTSP SURABAYA', 'Instansi Pemerintah', 'Jl. Tunjungan No. 1-3 Genteng, Surabaya 60275', 'M. Afghani Wardhana S., SE, M.M,', '196405051992031009', 'https://dpm-ptsp.surabaya.go.id/v5/', 'dpm-ptsp@surabaya.go.id', 'img/dpm.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_klasifikasi`
--

CREATE TABLE `tbl_klasifikasi` (
  `id_klasifikasi` int(5) NOT NULL,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_klasifikasi`
--

INSERT INTO `tbl_klasifikasi` (`id_klasifikasi`, `kode`, `nama`, `uraian`, `id_user`) VALUES
(1, '420', 'PENDIDIKAN', 'PENDIDIKAN', 1),
(2, '420.1', 'Pendidikan Khusus Klasifikasi disini Pendidikan Putra/I Irja', 'Pendidikan Khusus Klasifikasi disini Pendidikan Putra/I Irja', 1),
(3, '421', 'Sekolah', 'Sekolah', 1),
(4, '421.1', 'Pra Sekolah', 'Pra Sekolah', 1),
(5, '421.2', 'Sekolah Dasar', 'Sekolah Dasar', 1),
(6, '421.3', 'Sekolah Menengah', 'Sekolah Menengah', 1),
(7, '421.4', 'Sekolah Tinggi', 'Sekolah Tinggi', 1),
(8, '421.5', 'Sekolah Kejuruan', 'Sekolah Kejuruan', 1),
(9, '421.6', 'Kegiatan Sekolah, Dies Natalis Lustrum', 'Kegiatan Sekolah, Dies Natalis Lustrum', 1),
(10, '421.7', 'Kegiatan Pelajar', 'Kegiatan Pelajar', 1),
(11, '421.71', 'Reuni Darmawisata', 'Reuni Darmawisata', 1),
(12, '421.72', 'Pelajar Teladan', 'Pelajar Teladan', 1),
(13, '421.73', 'Resimen Mahasiswa', 'Resimen Mahasiswa', 1),
(14, '421.8', 'Sekolah Pendidikan Luar Biasa', 'Sekolah Pendidikan Luar Biasa', 1),
(15, '421.9', 'PLS / Pemberantasan Buta Huruf', 'PLS / Pemberantasan Buta Huruf', 1),
(16, '422', 'Administrasi Sekolah', 'Administrasi Sekolah', 1),
(17, '422.1', 'Persyaratan Masuk Sekolah, Testing, Ujian,Pendaftaran, Mapras', 'Persyaratan Masuk Sekolah, Testing, Ujian,Pendaftaran, Mapras', 1),
(18, '422.2', 'Tahun Pelajaran', 'Tahun Pelajaran', 1),
(19, '422.3', 'Hari Libur', 'Hari Libur', 1),
(20, '422.4', 'Uang Sekolah, Klasifikasi Disini SPP', 'Uang Sekolah, Klasifikasi Disini SPP', 1),
(21, '422.5', 'Beasiswa', 'Beasiswa', 1),
(22, '423', 'Metode Belajar', 'Metode Belajar', 1),
(23, '423.1', 'Kuliah', 'Kuliah', 1),
(24, '423.2', 'Ceramah, Simposium', 'Ceramah, Simposium', 1),
(25, '423.3', 'Diskusi', 'Diskusi', 1),
(26, '423.4', 'Kuliah Lapangan, Widyawisata, KKN, Studi Tur', 'Kuliah Lapangan, Widyawisata, KKN, Studi Tur', 1),
(27, '423.5', 'Kurikulum', 'Kurikulum', 1),
(28, '423.6', 'Karya Tulis', 'Karya Tulis', 1),
(29, '423.7', 'Ujian', 'Ujian', 1),
(30, '424', 'Tenaga Pengajar, Guru, Dosen, Dekan, Rektor', 'Tenaga Pengajar, Guru, Dosen, Dekan, Rektor', 1),
(31, '425', 'Sarana Pendidikan', 'Sarana Pendidikan', 1),
(32, '425.1', 'Gedung', 'Gedung', 1),
(33, '425.11', 'Gedung Sekolah', 'Gedung Sekolah', 1),
(34, '425.12', 'Kampus', 'Kampus', 1),
(35, '425.13', 'Pusat Kegiatan Mahasiswa', 'Pusat Kegiatan Mahasiswa', 1),
(36, '425.2', 'Buku', 'Buku', 1),
(37, '425.3', 'Perlengkapan Sekolah', 'Perlengkapan Sekolah', 1),
(38, '426', 'Keolahragaan', 'Keolahragaan', 1),
(39, '426.1', 'Cabang Olah Raga', 'Cabang Olah Raga', 1),
(40, '426.2', 'Sarana', 'Sarana', 1),
(41, '426.21', 'Gedung Olah Raga', 'Gedung Olah Raga', 1),
(42, '426.22', 'Stadion', 'Stadion', 1),
(43, '426.23', 'Lapangan', 'Lapangan', 1),
(44, '426.24', 'Kolam renang', 'Kolam renang', 1),
(45, '426.3', 'Pesta Olah Raga, Klasifikasi nya: PON, Porsade, Olimpiade,', 'Pesta Olah Raga, Klasifikasi nya: PON, Porsade, Olimpiade,', 1),
(46, '426.4', 'KONI', 'KONI', 1),
(47, '427', 'Kepramukaan Meliputi: Organisasi dan Kegiatan Remaja', 'Kepramukaan Meliputi: Organisasi dan Kegiatan Remaja', 1),
(48, '428', 'Kepramukaan', 'Kepramukaan', 1),
(49, '429', 'Pendidikan Kedinasan Untuk Depdagri', 'Pendidikan Kedinasan Untuk Depdagri', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sett`
--

CREATE TABLE `tbl_sett` (
  `id_sett` tinyint(1) NOT NULL,
  `surat_masuk` tinyint(2) NOT NULL,
  `surat_keluar` tinyint(2) NOT NULL,
  `referensi` tinyint(2) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sett`
--

INSERT INTO `tbl_sett` (`id_sett`, `surat_masuk`, `surat_keluar`, `referensi`, `id_user`) VALUES
(1, 100, 5, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_keluar`
--

CREATE TABLE `tbl_surat_keluar` (
  `id_surat` int(10) NOT NULL,
  `no_agenda` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `isi` mediumtext NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surat_keluar`
--

INSERT INTO `tbl_surat_keluar` (`id_surat`, `no_agenda`, `tujuan`, `no_surat`, `isi`, `kode`, `tgl_surat`, `tgl_catat`, `file`, `keterangan`, `id_user`) VALUES
(2, 1, 'Siswa', '420 / 015 /SMK.AH/VIII/2015', 'Surat edaran untuk mengikuti kegiatan sholat Idhul Adha di sekolah.', '421.6', '2015-08-28', '2016-07-24', '4718-surat keluar 1.jpg', 'Wajib', 5),
(3, 2, 'Darmaji, S.T. (Guru)', '421 / 056 /SMK-AH / XII /2015', 'Surat tugas untuk menghadiri undangan Penganugerahan Bursa Khusus SMK', '421', '2015-12-07', '2016-07-24', '7773-surat keluar 2.jpg', '-', 5),
(4, 3, 'Siswa', '421/059/SMK-AH/XII/2015', 'Surat edaran pelaksanaan praktik kerja industri (Prakerin)', '421', '2015-12-17', '2016-07-24', '', 'Penting', 5),
(5, 4, 'Guru', '042/067 / SMk-AH/I/2016', 'Surat undangan rapat dinas koordinasi ujian sekolah\r\n', '421', '2016-02-01', '2016-07-24', '', 'Wajib Hadir', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_surat_masuk`
--

CREATE TABLE `tbl_surat_masuk` (
  `id_surat` int(11) NOT NULL,
  `no_online` mediumtext,
  `pemohon` mediumtext,
  `isi` mediumtext,
  `dinas` text,
  `ket_lanjut` mediumtext,
  `ket_perbaikan` mediumtext,
  `tgl_surat` date DEFAULT NULL,
  `jam_surat` varchar(50) DEFAULT NULL,
  `tgl_diterima` varchar(100) DEFAULT NULL,
  `jam_diterima` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `no_telp` varchar(14) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_surat_masuk`
--

INSERT INTO `tbl_surat_masuk` (`id_surat`, `no_online`, `pemohon`, `isi`, `dinas`, `ket_lanjut`, `ket_perbaikan`, `tgl_surat`, `jam_surat`, `tgl_diterima`, `jam_diterima`, `keterangan`, `no_telp`, `id_user`) VALUES
(1, '11463', 'GALUH YULIANINGRUM', 'Daftar Ulang Izin Operasional Satuan Pendidikan KB', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi', NULL, NULL, '8:14:11 AM', '2024-02-15', '4:37:30 PM', 'Lanjut ke OPD', NULL, NULL),
(2, '26410', 'YUNELA MINANTYA PUTRI ANTORO', 'Daftar Ulang Izin Operasional Satuan Pendidikan SD', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:29:38', '2024-02-16', '9:17:41 AM', 'Lanjut ke OPD', NULL, NULL),
(3, '29584', 'MOETMAINAH', 'Daftar Ulang Izin Operasional Satuan Pendidikan PPT', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(4, '32077', 'MICHAEL ADIWIJAYA', 'Daftar Ulang Izin Operasional Satuan Pendidikan LKP', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:29:38 AM', '2024-02-16', '9:17:41 AM', 'Lanjut ke OPD', NULL, NULL),
(5, '33508', 'UMI MUKHOYAROH', 'Perubahan Izin Operasional Pendidikan TK', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(6, '34056', 'GANI TJIPTOSARI', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:44:54', '2024-02-16', '8:42:34 AM', 'Lanjut ke OPD', NULL, NULL),
(7, '34173', 'KUNCORO TANUDIRJO', 'Izin Pemakaian Gedung/Fasilitas Pusat Pendidikan dan Pelatihan Ketrampilan Tenaga Kebakaran', 'Dinas Pemadam Kebakaran', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:29:38 AM', '2024-02-16', '9:17:41 AM', 'Lanjut ke OPD', NULL, NULL),
(8, '34213', 'YUNIAR REZA PAHLEVI', 'Izin Pemakaian Ruang Terbuka Hijau', 'Dinas Lingkungan Hidup', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:44:54', '2024-02-16', '8:42:34 AM', 'Lanjut ke OPD', NULL, NULL),
(9, '34267', 'ERICK SOEDJIONO', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:44:54', '2024-02-16', '8:42:34 AM', 'Lanjut ke OPD', NULL, NULL),
(10, '34297', 'ANDI SULIANTUSO', 'KRK Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas sesuai persyaratan administrasi', NULL, NULL, '9:44:54', '2024-02-16', '8:42:34 AM', 'Lanjut ke OPD', NULL, NULL),
(11, '34385', 'USWATUN HASANAH', 'Daftar Ulang Izin Operasional Satuan Pendidikan TK', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(12, '34409', 'NURUL CHOIRIAH BUDIY UTAMI, S.PSI', 'Daftar Ulang Izin Operasional Satuan Pendidikan TK', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(13, '34592', 'SUMINTEN', 'Daftar Ulang Izin Operasional Satuan Pendidikan PPT', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(14, '34625', 'DINA SHIDQIYYA', 'Daftar Ulang Izin Operasional Satuan Pendidikan TK', 'Dinas Pendidikan', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(15, '34673', 'MOCHAMMAD ROMLI ROSYIDI', 'NON KOMERSIAL - Pemakaian Lapangan Softball Dharmawangsa', 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata', 'berkas sesuai persyaratan administrasi ', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(16, '245601', 'KARTA GUNAWAN', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas sesuai persyaratan administrasi (skrk sesuai dengan IPT)', NULL, NULL, '13:55:34', '2024-02-16', '10:55:24 AM', 'Lanjut ke OPD', NULL, NULL),
(17, '10325 / 14 Januari 2024 * Kembali', 'FREA ASTRILIA TAMARINA', 'Sarana-Cabut Pindah Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap secara administrasi', NULL, NULL, '2:20:59 PM', '2024-02-16', '2:12:02 PM', 'Lanjut ke OPD', NULL, NULL),
(18, '10352 / 14 Januari 2024 ', 'FATIMAH', 'Persetujuan Pengalihan Hak IPT', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '14:05:04', '2024-02-16', '14:02:52', 'LANJUT OPD', NULL, NULL),
(19, '104133 / 21 September 2022 * Kembali ', 'MUHAMMAD AMRULLOH NURHADIANTO, A.MD.KEP ', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '11:26:03', '2024-02-16', ' 11:17:13 ', 'Lanjut ke OPD', NULL, NULL),
(20, '104515 / 22 September 2022 * New', 'TAN JOHAN HONANTHA', 'Permohonan Penebangan/Pemindahan Pohon Tempat Usaha/Ruko', 'Dinas Lingkungan Hidup', 'berkas sesuai persyaratan administrasi', NULL, NULL, '14:40:45', '2024-02-16', '1:20:03 PM', 'lanjut OPD', NULL, NULL),
(21, '10533 / 15 Januari 2024 * Kembali', 'RANI SUKMASARI, SE.', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '13:34:16', '2024-02-16', '13:11:41', 'LANJUT OPD', NULL, NULL),
(22, '111712 / 20 Juni 2023 * Kembali', 'SYLVA DRANINDI TAQRYANKA', 'Perorangan-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', NULL, 'Mohon menghubungi  uptsa timur (031 5982284) Apabila kurang jelas dikarenkan ada berkas yang kurang pada Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat praktiknya dan fotokopi izin penyelenggaraan fasilitas pelayanan kesehatan yang masih berlaku, bagi praktik di fasilitas pelayanan kesehatan, surat izin bekerja dari RSUD dr. Soetomo (untuk PPDS/PPDGS) ====>>> ijin operasional RS terbaru', NULL, '9:21:28', NULL, '9:02:58', 'Pengembalian dari PTSP', NULL, NULL),
(23, '111712 / 20 Juni 2023 * Kembali ', 'SYLVA DRANINDI TAQRYANKA ', 'Perorangan-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '11:27:34', '2024-02-16', ' 10:55:46 ', 'Lanjut ke OPD', NULL, NULL),
(24, '11559 / 16 Januari 2024 * OPD', 'SUGEJATTO S', 'Persetujuan SKRK Peresmian Pemutihan', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '14:19:07', NULL, '1:46:22 PM', 'Lanjut ke OPD', NULL, NULL),
(25, '11644 / 20 Januari 2023 * New', 'EKA NURFEBRIANI', 'Arahan Sistem Drainase', 'Dinas Sumber Daya Air dan Bina Marga', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '14:16:35', NULL, '12:07:39 PM', 'Lanjut ke OPD', NULL, NULL),
(26, '11800 / 29 September 2021 * Kembali', 'AKHMAD KHOSIM', 'Sarana-Izin Baru Tenaga Fisioterapis - SIPF', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:08:00 PM', NULL, '11:41:45 AM', 'Lanjut ke OPD', '-', NULL),
(27, '12390 / 16 Januari 2024 * Kembali', 'RIZKA ZA\\\'IN AULYA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '7:38:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(28, '13359 / 17 Januari 2024 * New', 'ANDARI PRAMIA APSARI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '7:34:00', '2024-02-15', '15:49:36', 'lanjut ke opd', NULL, NULL),
(29, '13467 / 17 Januari 2024 * Kembali', 'KARDY ANTOLIS', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '7:12:00', '2024-02-15', '10:41:26 PM', 'Lanjut ke OPD', '85232732645', NULL),
(30, '13825 / 18 Januari 2024 * Kembali', 'DWI SETIAWAN PUTRA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '5:31:12', NULL, ' 09:33:57', 'LANJUT OPD', NULL, NULL),
(31, '14349 / 18 Januari 2024 * Kembali', 'SEPTYWAN RAMEL WICAKSONO', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, '2024-02-16', '11:56:09', '2024-02-16', '11:49:51', 'lanjut ke opd', NULL, NULL),
(32, '14607 / 18 Januari 2024 * Kembali', 'MUHAMMAD RIZA KURNIAWAN', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, '1. Mohon upload STR salinan 1/2/3\n2. Mohon perbaiki nama FASKES pada surat pernyataan sesuaikan dengan izin operasional persetujuan teknis \"RS PRIMASATYA HUSADA CITRA (PHC) SURABAYA\"', NULL, '10:46:56', '2024-02-16', '9:49:59 AM', 'Pengembalian dari PTSP', '811307749', NULL),
(33, '14673 / 18 Januari 2024 * Kembali', 'WAHJUNI DARUWATI, A.MD.FIS', 'Sarana-Perpanjangan Izin Tenaga Fisioterapis - SIPF', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:27:00 AM', NULL, '7:55:48 PM', 'Lanjut ke OPD', '-', NULL),
(34, '14788 / 19 Januari 2024', 'YOSHIKO QQ PT.OPTIMA KARYA ELEKTRIK', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Berkas lengkap sesuai persyaratan administrasi melengkapi rekom cagar budaya', NULL, NULL, '8:03:03', '2024-02-16', '7:58:31 AM', 'Lanjut Ke OPD', '87847042351', NULL),
(35, '15277 / 19 Januari 2024 * New', 'YENY RUSDIANA SARI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:29:00 AM', NULL, '11:29:39 PM', 'Lanjut ke OPD', '-', NULL),
(36, '15361 / 19 Januari 2024 * Kembali', 'LAUW SYANE WAHYUNI LOEKITO', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '1:55:12', '2024-02-16', '11:11:02 AM', 'Lanjut ke OPD', '81330717460', NULL),
(37, '164521 / 24 Agustus 2023 * OPD', 'HAPPY GUNAWARMAN, SH', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'meneruskan pending dari OPD teknis : gambar pPBG tidak lengkap (gambar potongan B tidak ada), masih ada permasalahan hukum.', NULL, '2:24:00', '2024-02-15', '4:14:19 PM', 'Pengembalian dari OPD', '85859990944', NULL),
(38, '172774 / 5 September 2023 * Kembali', 'DIAN FITRI,AMD', 'Perpanjangan Izin Pembuangan Sampah', 'Dinas Lingkungan Hidup', 'Berkas lengkap dan benar', NULL, NULL, '8:40:15', NULL, '15 Februari 2024 16:49:28', 'Lanjut ke OPD', '81357074245', NULL),
(39, '173334 / 6 September 2023 * Kembali', 'OLIVE ADRIA FITRA', 'Pergantian Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', NULL, '(1) Mohon upload Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat bekerja/praktiknya dan fotokopi izin penyelenggaraan fasilitas pelayanan kesehatan yang masih berlaku (2) Mohon upload Surat Ijin Praktik yang asli sesuai dengan alamat tersebut di atas (SIP Lama ASLI)', NULL, '1:14:00 PM', NULL, '9:27:20 AM', 'Pengembalian dari PTSP', '8999993032', NULL),
(40, '17956 / 23 Januari 2024 * Kembali ', 'VIVI LASANDRA ', 'Perpanjangan Izin Praktik Tenaga Apoteker - SIPA', 'Dinas Kesehatan', NULL, 'Melanjutkan pendingan dari OPD : \"harap tambahkan stempel pada suket kerja  point 4\"', '2024-02-16', '10:33:01', '2024-02-16', ' 09:32:55 ', 'Pengembalian dari OPD', NULL, NULL),
(41, '18342 / 24 Januari 2024 * Kembali', 'CHASA AMALIA MASYITHAH', 'Sarana-Ijin Baru Surat Terdaftar Penyehat Tradisional - STPT', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas: sesuai arahan dinkes kota surabaya Mohon pastikan jenis usaha saudara rumah pijat atau panti sehat; dan ajukan terapis lainnya di sarana rumah pijat tersebut dan ajukan semua tenaga secara bersamaan apabila kurang jelas dapat emnghubungi WA: 085606075057', NULL, '7:45:00', '2024-02-15', '17:49:48', 'Pengembalian dari PTSP', NULL, NULL),
(42, '18494 / 24 Januari 2024 * New', 'VIOLITTA IRWAN PITONO', 'Pencabutan Izin Praktik Tenaga Apoteker - SIPA', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '7:50:00 AM', '2024-02-15', '16:16:30', 'lanjut ke opd', NULL, NULL),
(43, '18604 / 24 Januari 2024 * Kembali', 'YUSTINUS TEDDY WIJAYA', 'Perorangan-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Berkas lengkap secara administrasi', NULL, NULL, '10:43:39', '2024-02-16', '8:23:35 AM', 'Lanjut ke OPD', NULL, NULL),
(44, '18710 / 24 Januari 2024 * Kembali', 'ENDANG PRAPTINI', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '10:01:05 AM', '2024-02-16', '9:25:27 AM', 'Lanjut ke OPD', '85733710131', NULL),
(45, '18733 / 24 Januari 2024 * Kembali', 'SARBINI', 'Persetujuan SKRK Peresmian Pemutihan', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap administrasi', NULL, NULL, '10:27:00', '2024-02-16', '10:25:57', 'lanjut ke opd', NULL, NULL),
(46, '19168 / 24 Januari 2024 * OPD', 'BAGUS RAMADHANI', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'meneruskan pending dari OPD teknis : gambar pPBG tidak memenuhi ketentuan SKRK (area rumah tinggal tidak ada, luas area industri melebihi 50% KDB (max 57,9m2), akses menuju lantai 2 tidak ada), gambar pPBG tidak lengkap (denah atap tidak lengkap (area ruang jahit dan ppic tidak teratapi)).', NULL, '8:52:48', '2024-02-16', '7:51:15 AM', 'Pengembalian dari OPD', '81231262892', NULL),
(47, '194821 / 3 Oktober 2023 * OPD', 'DR AUCKY HINTING', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'meneruskan pending dari OPD teknis : rekom TABG tidak ada, terdapat akses menuju bangunan diluar persil, gambar pPBG tidak memenuhi ketentuan SKRK (melebihi KDB).', NULL, '8:09:36', '2024-02-16', '8:18:03 AM', 'Pengembalian dari OPD', '81216705636', NULL),
(48, '19584 / 25 Januari 2024 * Kembali ', 'DR. RACHMAT ARISATOTO ', 'Perorangan-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '13:48:52', NULL, ' 13:30:45 ', 'Lanjut ke OPD', NULL, NULL),
(49, '19953 / 25 Januari 2024 * Kembali', 'EKA FAJAR HARIANTI', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '7:26:24', NULL, '8:30:32', 'LANJUT OPD', NULL, NULL),
(50, '20387 / 25 Januari 2024 * Kembali', 'DYAH NOVITASARI', 'Cabut Pindah Izin Kerja Perekam Medis - SIKPM', 'Dinas Kesehatan', NULL, 'Mohon upload Surat Pernyataan dari fasilitas pelayanan kesehatan sebagai tempat bekerja/praktiknya dan fotokopi izin penyelenggaraan fasilitas pelayanan kesehatan yang masih berlaku', NULL, '1:21:00 PM', NULL, '10:20:16 AM', 'Pengembalian dari PTSP', '83856254937', NULL),
(51, '206078 / 17 Oktober 2023 * Kembali', 'PURWANTO', 'Persetujuan Pengalihan Hak IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '10:40:00 AM', '2024-02-16', 'Â 10:21:09', 'Lanjut ke OPD', '81216766331', NULL),
(52, '21211 / 26 Januari 2024 * Kembali', 'SUGENG RIADI,S.S,M.M', 'Tanda Daftar Bursa Kerja Khusus (BKK)', 'Dinas Perindustrian dan Tenaga Kerja', 'Berkas permohonan sesuai dengan persyaratan', NULL, NULL, '2:06:26 PM', NULL, ' 13:41:10 ', 'Lanjut ke OPD', '85852449978', NULL),
(53, '21225 / 26 Januari 2024 * Kembali', 'PUPUT RATMASARI', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:24:00 PM', NULL, '12:25:17 PM', 'Lanjut ke OPD', '-', NULL),
(54, '21263 / 26 Januari 2024 * New', 'BRILIAN TRI PUSPITA NINGRUM', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '10:19:12', NULL, ' 11:05:34', 'Lanjut ke OPD', NULL, NULL),
(55, '21331 / 26 Januari 2024 * Kembali', 'AMALIA ARTATI', 'Perorangan-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', NULL, 'Abaikan nomor online ini dan mohon ajukan permohonan \"Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi\"', NULL, '10:40:12', '2024-02-16', '8:55:55 AM', 'Pengembalian dari PTSP', '81331420858', NULL),
(56, '21437 / 26 Januari 2024 * Kembali', 'AGUNG ERWAN AFFANDI (PT LAUTAN LUAS TBK)', 'Tera Ulang di Tempat UTTP Tepasang (Loko)', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:24:12 AM', NULL, '6:54:40 AM', 'Lanjut ke OPD', NULL, NULL),
(57, '217347 / 2 November 2023 * Kembali', 'WINDA LUCYANA', 'Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:17:00 PM', NULL, '10:09:11 AM', 'Lanjut ke OPD', '-', NULL),
(58, '218614 / 3 November 2023 * Kembali', 'LAURENTIUS ADRIAN BUDYANTO', 'PBG Non Rumah Tinggal UMK', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '8:59', NULL, '8:53:25', 'lanjut ke OPD', NULL, NULL),
(59, '219976 / 6 November 2023 * Kembali', 'ALIFIA RACHMA BELLA SAPUTRI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '7:24:00', '2024-02-15', '18:13:34', 'lanjut ke OPD ', NULL, NULL),
(60, '22118 / 29 Januari 2024 * Kembali', 'ANANDA ZARA EKA PUTRI', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas: Surat Pernyataan memiliki tempat kerja sarana/fasilitas pelayanan kesehatan (bermaterai Rp. 10.000,-)=> perbaiki nama sarana sesuaikan dengan izinmoperasional RS=> RS Primasatya..., dan jam kerja sesuaikan=> Cth Senin-Minggu Shift 1: 07.00-14.00 dst (libur 1 minggu berapa kali), ', NULL, '8:01:00', '2024-02-15', '16:35:05', 'Pengembalian dari PTSP', NULL, NULL),
(61, '221474 / 8 November 2023 * Kembali', 'ACHMAD HAMAM SETIAWAN', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:19:00 PM', NULL, '9:31:13 AM', 'Lanjut ke OPD', '-', NULL),
(62, '22313 / 29 Januari 2024 * Kembali', 'FAHMI DADANG SUPRIANTO (PT SALIM IVOMAS PRATAMA TBK)', 'Tera Ulang di Tempat UTTP Tepasang (Loko)', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:32:06 AM', NULL, '5:16:49 PM', 'Lanjut ke OPD', NULL, NULL),
(63, '224295 / 13 November 2023 * Kembali', 'WAHYUDI', 'PBG Non Rumah Tinggal TABG', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '14:01', NULL, '13:51:54', 'lanjut ke OPD', NULL, NULL),
(64, '228488 / 19 November 2023 * Kembali', 'DIAN ARTANTY', 'Perorangan-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '10:51:00', '2024-02-16', '10:44:03', 'lanjut ke opd', NULL, NULL),
(65, '230797 / 22 November 2023 * Kembali', 'FIRDIANA AS FIFAH', 'Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:06:00 AM', NULL, '3:44:13 PM', 'Lanjut ke OPD', '-', NULL),
(66, '230913 / 22 November 2023 * Kembali', 'DIMAS DWI YUDISTIRA', 'Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:08:00 AM', NULL, ' 15:42:21  ', 'Lanjut ke OPD', '-', NULL),
(67, '230939 / 22 November 2023 * Kembali', 'CITRA FAJARWATI', 'Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:10:00 AM', NULL, '7:29:19 AM', 'Lanjut ke OPD', '-', NULL),
(68, '23331 / 30 Januari 2024 * Kembali ', 'ALBINUS SUIPNO ', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Mohon melengkapi : \n1. Alamat Domisili Pemohon pada step 1 sesuaikan dengan domisili yang diupload, \n2. Surat Rekomendasi dari Organisasi Profesi(PPNI) beserta bukti pemenuhan kecukupan SKP (upload 2 berkas, rekom + kecukupan SKP), \n3. STR /SIP yang masih berlaku dan dilegalisir, \n4. Apabila kurang jelas hubungi UPTSA 031-5982284 ext 0', '2024-02-16', '10:37:28', '2024-02-16', ' 09:53:30', 'Pengembalian dari PTSP', NULL, NULL),
(69, '23331 / 30 Januari 2024 * New', 'ALBINUS SUIPNO', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Mohon dilengkapi :\n1. Surat Keterangan domisili tinggal di Surabaya (Bagi Penduduk Non Surabaya) ====>>> mohon ditambahkan surat permyataan pulang pergi\n2. STR /SIP yang masih berlaku dan dilegalisir ===>>> Mohon yang yg di legalisir ', NULL, '9:14:23', NULL, '9:01:59', 'Pengembalian dari PTSP', NULL, NULL),
(70, '233315 / 25 November 2023 * Kembali', 'BELINDA ALIVIA', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '7:25:00', '2024-02-15', '20:38:05', 'lanjut ke opd', NULL, NULL),
(71, '237506 / 1 Desember 2023 * Kembali ', 'SAFIRA RAHMA NOVACHIRIA ', 'Pencabutan Izin Praktik Tenaga Apoteker - SIPA', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '12:19:28', '2024-02-16', '12:03:33', 'Lanjut ke OPD', NULL, NULL),
(72, '238356 / 4 Desember 2023 * Kembali ', 'SHANTI WINDA DAHLAN ', 'Cabut Pindah Izin Kerja Perekam Medis - SIKPM', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '10:30:17', '2024-02-16', '9:28:23', 'Lanjut ke OPD', NULL, NULL),
(73, '238399 / 4 Desember 2023 * Kembali', 'HARI SINGH', 'Perorangan-Perpanjangan Surat Terdaftar Penyehat Tradisional - STPT', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '10:52', '2024-02-16', '10:47:06', 'lanjut ke opd', NULL, NULL),
(74, '23983 / 30 Januari 2024 * Kembali', 'MUFIDATUL KHOIRIYAH RIFA\\\'I', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '10:05:54', '2024-02-16', ' 09:59:15', 'lanjut ke OPD ', NULL, NULL),
(75, '242950 / 9 Desember 2023 * Kembali', 'SINDI AYU ATIKA', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '7:26:00', '2024-02-15', '4:55:57', 'lanjut ke opd', NULL, NULL),
(76, '243589 / 11 Desember 2023 * Kembali', 'LIEM,YONGKY PRANOTO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '10:06', NULL, '14:33:10', 'lanjut ke opd', NULL, NULL),
(77, '244281 / 12 Desember 2023 * Kembali', 'NANIEK HANDAJANI', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyaratan *untuk tanggal permohonan di surat kuasa dan sp diatasnamakan belum dikasi tgl dan isian di surat permohonan masih ada yg salah*', NULL, NULL, '9:16:02 AM', NULL, '3:47:23 PM', 'Lanjut ke OPD', '81231449903', NULL),
(78, '244660 / 12 Desember 2023 * New', 'PROF LOEKITO ADI SOEHONO', 'Izin Pendirian Satuan Pendidikan LKP (Lembaga Khusus dan Pelatihan)', 'Dinas Pendidikan', 'Berkas lengkap secara administrasi', NULL, NULL, '9:16:12', '2024-02-16', '9:10:30 AM', 'Lanjut ke OPD', NULL, NULL),
(79, '244678 / 12 Desember 2023 * New', 'OEY,ANDRI SURYANTO WIBISONO.IR', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'Keterangan : 1. mohon Upload Lunas retribusi 2024, ', '2024-02-16', '08:22', NULL, 'Â 13:42:36', 'pengembalian ke OPD', NULL, NULL),
(80, '24681 / 31 Januari 2024 * New', 'ROSITA', 'Pemanfaatan Bangunan dan / atau Lingkungan Cagar Budaya', 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata', NULL, 'Perbaiki semua Data pemohon pada form dan data online menjadi data DIREKTUR PT. KODRAT ALAM ( bukan kuasa pengurusan ) , lampirkan FOto bangunan dan Gambar denah Bangunan ( ARS ) ', NULL, '14:12:54', NULL, '16 Februari 2024 13:55:07', 'Pengembalian dari PTSP', '817271293', NULL),
(81, '248388 / 18 Desember 2023 * Kembali', 'HENDRO NYOTO MULYO', 'PBG Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-12-16', '10:33:15 AM', '2024-12-16', '10:05:53', 'lanjut ke opd', NULL, NULL),
(82, '250844 / 20 Desember 2023 * Kembali', 'LISA', 'Penghapusan Blokir IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '14:42:16', '2024-02-16', '1:57:01 PM', 'Lanjut ke OPD', '82190364788', NULL),
(83, '25155 / 1 Februari 2024 * New', 'GO ERIC ALEXANDER GUNAWAN', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '14:58', NULL, '14:49:33', 'lanjut ke opd', NULL, NULL),
(84, '252367 / 22 Desember 2023 * New', 'ANI FARIDA, S.S.', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'MOHON MELAMPIRKAN COPY SERTIFIKAT YANG TELAH DILEGALSIIR NOTARIS ATAU MELAMPIRKAN ASLI SERTIFKAT YANG TELAH DI SCAN', '2024-02-16', '10:49', NULL, '10:10:13', 'pengembalian OPD', NULL, NULL),
(85, '253040 / 25 Desember 2023 * New', 'ULANDARI INDAH WARDANI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, '(1) Mohon upload Surat Keterangan domisili tinggal di Surabaya (Bagi Penduduk Non Surabaya) (2) Mohon upload Surat Keterangan Sehat jasmani dan rohani dari dokter yang telah memiliki SIP yang masih berlaku (tulis no. SIP nya)(3) Mohon upload Surat Rekomendasi dari Organisasi Profesi(PPNI) beserta bukti pemenuhan kecukupan SKP (4) Mohon upload Surat Pernyataan memiliki tempat kerja sarana/fasilitas pelayanan kesehatan (bermaterai Rp. 10.000,-) (5) Mohon upload Surat Ijin Praktik/Kerja Perawat(SIPP/SIKP) lama yang asli apabila perpanjangan', NULL, '9:15:00 AM', NULL, ' 18:16:16 ', 'Pengembalian dari PTSP', '82328827454', NULL),
(86, '254417 / 28 Desember 2023 * Kembali', 'TULUS HARIANTO IR.', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '10:38', NULL, '16 Februari 2024 10:20:51', 'lanjut ke OPD', NULL, NULL),
(87, '255856 / 29 Desember 2023 * Kembali', 'LIEKE RIADI', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '0:57:36', '2024-02-16', '11:48:52 AM', 'Lanjut ke OPD', '82117555417', NULL),
(88, '25906 / 1 Februari 2024 * Kembali', 'ADELIA YUANA WATI', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:31:00 AM', NULL, '10:17:42 PM', 'Lanjut ke OPD', '-', NULL),
(89, '26087 / 1 Februari 2024 * Kembali', 'KRISTINA MARIASARI', 'Izin Baru Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', NULL, 'Mohon upload Surat Keterangan Sehat dari dokter yang masih memiliki SIP yang masih berlaku (tulis no. SIP nya) beri catatan pengurusan SIP', NULL, '9:33:00 AM', NULL, '6:49:47 PM', 'Pengembalian dari PTSP', '895340146367', NULL),
(90, '26091 / 1 Februari 2024 * New', 'EVA TAMARA', 'Perorangan-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas: cek kembali mdata entrian step 2 jam kerja sesuaikan kembali=> Cth: Senin-Jumat: 07.00-09.00 mohon harus ditentukan, 2 STR (Surat Tanda Registrasi) yang dilegalisasi asli, bagi PPDS/PPDGS STR lembar pertama=> salinan 1, 2 Surat Pernyataan memiliki tempat kerja di sarana / fasilitas pelayanan kesehatan atau praktik mandiri (bermaterai 10.000,=> form ada pada kolom upload dan diketik kembali, 3 Surat Ijin Praktik yang lama dan asli apabila perpanjangan atau pindah tempat praktik=> SIP lama asli di sarana tersebut', NULL, '11:50:00', '2024-02-16', '11:35:32', 'Pengembalian dari PTSP', NULL, NULL),
(91, '26150 / 1 Februari 2024 * Kembali', 'ARIF MUHADI', 'Pencabutan Izin Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '8:02', '2024-02-15', '20:06:46', 'lanjut ke opd', NULL, NULL),
(92, '26237 / 2 Februari 2024 * Kembali', 'DR. ISWIYANTI WIDYAWATI', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:14:54', '2024-02-16', '8:12:42', 'lanjut ke opd', NULL, NULL),
(93, '26629 / 2 Februari 2024 * Kembali', 'JULAIHA', 'Sarana-Perpanjangan Izin Praktik Bidan - SIPB', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '8:04:00', '2024-02-15', '21:15:17', 'lanjut ke opd', NULL, NULL),
(94, '26714 / 2 Februari 2024 * Kembali', 'ELIZABETH LUNA KANIA ANINDITA', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Mohon dilengkapi :\n1. STR (Surat Tanda Registrasi) yang dilegalisasi asli, bagi PPDS/PPDGS STR lembar pertama ===>>>> dimohon sesuaikan dengan step 2 pada Ijin Praktik Ke - 2 maka yang di upload Salinan 2 (mohon saat mengupload \"Salinan 2\" diperlihatkan\n2. Harap melengkapi kekurangan berkas: cek kembali data entrian step 2 Masa Berlaku sesuaikan dengan STR=> Selama Mengikuti.,.. dengan memilih jenis STR bertanggal', NULL, '10:03:38', NULL, ' 09:26:43', 'Pengembalian dari PTSP', NULL, NULL),
(95, '26751 / 2 Februari 2024 * New', 'MOH. AS\\\'AD (SHELL KENJERAN-1 SBY)', 'Tera Ulang di Tempat UTTP Tepasang (Loko)', 'UPTD Metrologi Legal', 'Mohon koreksi.', NULL, NULL, '8:33:53 AM', NULL, '5:01:54 PM', 'Lanjut ke OPD', NULL, NULL),
(96, '27015 / 2 Februari 2024 * New', 'VENNY TANDYONO', 'Sarana-Cabut Pindah Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, '(1) Mohon alamat KTP dan alamat domisili pada data entrian diberi tambahan KOTA (2) Mohon upload Pas Photo digital terbaru ukuran 4 x 6 cm dengan latar belakang merah (crop dan rapikan tanpa tepian putih) (3) Mohon upload Surat Pernyataan dari fasilitas pelayanan kesehatan sebagai tempat bekerja/praktiknya dan fotokopi izin penyelenggaraan fasilitas pelayanan kesehatan yang masih berlaku bagi praktik di fasilitas pelayanan kesehatan', NULL, '2:27:00 PM', NULL, ' 13:58:12 ', 'Pengembalian dari PTSP', '81234220033', NULL),
(97, '27129 / 3 Februari 2024 * Kembali', 'MACHFUD', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '9:21:36', '2024-02-15', '3:46:27 PM', 'Lanjut ke OPD', '81231380462', NULL),
(98, '27182 / 3 Februari 2024 * Kembali', 'SOEGANDI', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap secara administrasi', NULL, NULL, '10:25:51', '2024-02-15', '10:24:40 AM', 'Lanjut ke OPD', NULL, NULL),
(99, '27518 / 3 Februari 2024 * Kembali', 'FX HIMAWAN HARYANTO JONG', 'Perorangan-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', NULL, 'Harap melengkapi ekkurangan berkas: cek kembali data entrian step 2 nama sarana ganti Praktik Swasta Perorangan, 2 Surat Pernyataan memiliki tempat kerja di sarana / fasilitas pelayanan kesehatan atau praktik mandiri (bermaterai 10.000,-)=> nama sarana sesuaikan kembali, 3 apabila kurang jelas dapat menghubungi UPTSA 031-5982284 ext 0 atau Live Chat: 085234982434', NULL, '8:13:00', '2024-02-15', '19:50:52', 'Pengembalian dari PTSP', NULL, NULL),
(100, '27684 / 5 Februari 2024 * Kembali', 'PUTRI ALIFIAN SUMARJO', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:21:17', NULL, ' 13:22:35', 'lanjut ke OPD ', NULL, NULL),
(101, '28078 / 5 Februari 2024 * New', 'BASKARA ALWIN PRAYOGA, S.ST.PAR.', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:19:50', '2024-02-15', '18:18:01', 'lanjut ke opd', NULL, NULL),
(102, '28418 / 5 Februari 2024 * New', 'MAHMUD.H', 'Peningkatan Jangka Waktu IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '9.1.00', NULL, 'Â 16:25:11', 'Lanjut ke OPD', '81332703666', NULL),
(103, '28648 / 6 Februari 2024 * Kembali', 'DR. VINA WIDIYANA', 'Perorangan-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:35:00 AM', NULL, '7:00:44 AM', 'Lanjut ke OPD', '-', NULL),
(104, '28728 / 6 Februari 2024 * Kembali', 'HAPPY GUNAWARMAN', 'Perpanjangan Izin Pembuangan Sampah', 'Dinas Lingkungan Hidup', 'Berkas permohonan sesuai dengan persyaratan', NULL, NULL, '9:25:34 AM', NULL, ' 08:46:18 ', 'Lanjut ke OPD', '81357341582', NULL),
(105, '28888 / 6 Februari 2024 * Kembali', 'RUTH ANGELA YUENDY', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '12:43:12 AM', '2024-02-16', '10:59:58 AM', 'Lanjut ke OPD', '81249593680', NULL),
(106, '29328 / 6 Februari 2024 * New', 'AGUS TRI ISMONO', 'Pemutihan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '9:41:10 AM', NULL, 'Â 15:20:15', 'Lanjut ke OPD', '87851228889', NULL),
(107, '29343 / 6 Februari 2024 * Kembali', 'JOHAN TENACIOUS (PT VIRGO ABADI)', 'Tera di Tempat Terpasang UTTP (Loko)', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '9:53:08 AM', NULL, '9:27:35 AM', 'Lanjut ke OPD', NULL, NULL),
(108, '29366 / 6 Februari 2024 * Kembali', 'ACHMAD GUINTANO PRASTYOBAKTI', 'Sarana-Izin Baru Tenaga Akupuntur Terapis - SIPAT', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '11:31', '2024-02-16', '10:29:42', 'lanjut ke opd', NULL, NULL),
(109, '29366 / 6 Februari 2024 * Kembali ', 'ACHMAD GUINTANO PRASTYOBAKTI ', 'Sarana-Izin Baru Tenaga Akupuntur Terapis - SIPAT', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '11:31:15', '2024-02-16', ' 10:29:42 ', 'Lanjut ke OPD', NULL, NULL),
(110, '29402 / 6 Februari 2024 * New', 'ARIS ARDIYAN', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:37:00 AM', NULL, '11:25:35 PM', 'Lanjut ke OPD', '-', NULL),
(111, '29479 / 6 Februari 2024 * Kembali', 'CANDRA PUSPADINITA', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', NULL, 'Mohon lampirkan STR lama dikarenakan masa berlaku STR masih aktif hingga 2027 (No. STR : 16 14 5 2 2 22-4260302 )', NULL, '1:30:00 PM', NULL, '12:30:38 PM', 'Pengembalian dari PTSP', '85733000926', NULL),
(112, '29523 / 6 Februari 2024 * Kembali', 'SITI AINUN HALIM', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:23:40', '2024-02-16', ' 00:06:45', 'lanjut ke OPD ', NULL, NULL),
(113, '29535 / 7 Februari 2024 * OPD', 'ANASTASIA ERVINA PRATYAHASTRI', 'Baru SLF Bersyarat NRT Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'melanjutkan pengambalian dari OPD Keterangan Pengembalian: berkas dikembalikan, dengan catatan kekurangan: 1. Untuk register ulang memilih SLF Bersyarat Non Sederhana karena luas bangunan lebih dari 2.500 m2 2. Perbaiki Data Permohonan pada SSW Alfa, sebagai berikut: a. Sesuaikan Fungsi Bangunan Gedung dengan guna pada SK IMB (Sekolah) b. Sesuaikan Lokasi Bangunan Gedung dengan alamat persil pada SK IMB (Jl. Tembaan No. 18-20-22 Surabaya) 3. Lengkapi lampiran gambar IMB, berupa gambar denah tiap lantai, tampak dan potongan yang ada pengesahan dari Pemerintah Kota Surabaya 4. Hubungan Hukum antara Sdri. Anastasia Ervina Pratyhastri dengan Keuskupan Surabaya', NULL, '13:05:22', '2024-02-15', '5:14:38 PM', 'Pengembalian dari OPD', '82230018901', NULL),
(114, '29707 / 7 Februari 2024 * Kembali', 'NAUFAL AQIL UBAID', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap secara administrasi', NULL, NULL, '10:42:21', '2024-02-16', '8:11:33 AM', 'Lanjut ke OPD', NULL, NULL),
(115, '29715 / 7 Februari 2024 * Kembali ', 'EVIANA OKTA NORMALINA ', 'Perpanjangan Izin Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', NULL, 'Melanjutkan pendingan dari OPD \"Surat Ijin Kerja Tenaga Teknis Kefarmasian (SIKTTK) lama asli apabila perpanjangan atau pindah tempat praktik. (Harap melakukan perpanjangan SIP H-2 bulan sebelum expired)\"', '2024-02-16', '13:59:39', '2024-02-16', ' 13:50:06 ', 'Pengembalian dari OPD', NULL, NULL),
(116, '29836 / 7 Februari 2024 * New', 'RUSLI KUWANTTO', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'mohon menambahkan titik koordinat X dan Y pada gambar sketsa persil serta tanda tangan pemilik tanah', NULL, '5:02:24', '2024-02-16', '8:44:04 AM', 'Pengembalian dari PTSP', '8168838800', NULL),
(117, '29884 / 7 Februari 2024 * Kembali ', 'MONICA LIERENSIA ', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Mohon mengganti jenis perijinan menjadi cabut pindah & lengkapi berkas yang diperlukan, Apabila kurang jelas hubungi UPTSA 031-5982284 ext 0', '2024-02-16', '12:23:09', '2024-02-16', ' 12:15:15 ', 'Pengembalian dari OPD', NULL, NULL),
(118, '29901 / 7 Februari 2024 * Kembali', 'EMATRI IRAWATI', 'Sarana-Cabut Pindah Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:39:00 AM', NULL, '5:07:49 PM', 'Lanjut ke OPD', '-', NULL),
(119, '29924 / 7 Februari 2024 * Kembali', 'ALVIONITA DAMAYANTI HARIYANTO', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '11:50:00', '2024-02-16', '11:44:35', 'lanjut ke opd', NULL, NULL),
(120, '29995 / 7 Februari 2024 * Kembali', 'DIVA NABILLA LEVIANY', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '6:00:00', NULL, '9:33:57', 'LANJUT OPD', NULL, NULL),
(121, '30029 / 7 Februari 2024 * Kembali', 'RIRIN ERINDAWATI, A.MD', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:36:00 PM', NULL, ' 12:44:00 ', 'Lanjut ke OPD', '-', NULL),
(122, '30273 / 7 Februari 2024 * Kembali', 'OKTA NURKI DARMAWANTI', 'Cabut Pindah Izin Praktik Tenaga Apoteker - SIPA', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:41:00 AM', NULL, '9:51:12 PM', 'Lanjut ke OPD', '-', NULL),
(123, '30298 / 7 Februari 2024 * Kembali', 'IRMA NOFITASARI', 'Perpanjangan Izin Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkaS: 1 Surat Pernyataan Apoteker atau pimpinan tempat pemohon melaksanakan pekerjaan kefarmasian, tidak berlaku bagi Tenaga Teknis Kefarmasian yag bekerja ditoko obat=> dari bagian kepegawaian RS bukan dari Kainst dikarenakan ikut sarana kesehatan, 2 Copy Ijin penyelenggaraan sarana kesehatan yang masih berlaku=> NIB beserta lampirannya+sertifikat standar yang telah terverifikasi+Persetujuan Teknis jadi 1 PDF, 3 Surat Ijin Kerja Tenaga Teknis Kefarmasian (SIKTTK) lama asli apabila perpanjangan atau pindah tempat praktik.=> masih ada masa berlakunya dan dapat di perpanjang H-2 Bulan Sebelum Exp, apabila kurang jelas dapat menghubungi UPTSA 031-5982284 ext 0 atau Live Chat: 085234982434', NULL, '12:01:00', '2024-02-16', '11:56:39', 'Pengembalian dari PTSP', NULL, NULL),
(124, '30384 / 7 Februari 2024 * Kembali', 'RANI FITRIANA', 'Sarana-Cabut Pindah Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:40:00 PM', NULL, '10:17:04 AM', 'Lanjut ke OPD', '-', NULL),
(125, '30424 / 8 Februari 2024 * Kembali', 'RIZKA HAZANAH OKTAFIANA', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '11:13:17', '2024-02-16', ' 10.28.32', 'Lanjut ke OPD', NULL, NULL),
(126, '30444 / 8 Februari 2024 * Kembali', 'RIRIN MELIANAWATI', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, '(1) Mohon alamat sarana pada data entrian sesuaikan dengan Ijin Operasional Sarana secara lengkap (Kampus C UNAIR JL. ........) (3) Mohon upload Surat Pernyataan memiliki tempat kerja sarana/fasilitas pelayanan kesehatan (bermaterai Rp. 10.000,-) alamat sarana sesuaikan dengan Ijin Operasional Sarana secara lengkap', NULL, '9:43:00 AM', NULL, '6:02:12 PM', 'Pengembalian dari PTSP', '89688092954', NULL),
(127, '30473 / 8 Februari 2024 * New', 'LIENNY JOHCHRISNATALIA YUWONO,SH', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '08:28', NULL, '7:41:47', 'lanjut ke opd', NULL, NULL),
(128, '30534 / 8 Februari 2024 * Kembali', 'RIZTA NOVITA WULANDHARI', 'Sarana-Cabut Pindah Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas: mohon menggunakan materai yang berbeda antara surat pernyataan memiliki sarana dengan surat pernyataan PP', NULL, '11:33:00', '2024-02-18', '11:23:47', 'Pengembalian dari PTSP', NULL, NULL),
(129, '30588 / 8 Februari 2024', 'SRI HAYATI KUMAWANI', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '11:40:12', '2024-02-16', '  08.44.06', 'Lanjut ke OPD', NULL, NULL),
(130, '30982 / 10 Februari 2024 * Kembali ', 'ZIDAN UBAIDDILLAH ', 'Izin Baru Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '9:01:44', '2024-02-15', ' 17:37:50', 'Lanjut ke OPD', NULL, NULL),
(131, '30984 / 10 Februari 2024 * Kembali', 'M. SYAIFUL', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap dan benar', NULL, NULL, '13:18:34', NULL, '16 Februari 2024 11:28:17', 'Lanjut ke OPD', '81803007119', NULL),
(132, '30986 / 10 Februari 2024 * Kembali', 'DWI RATNA SARI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas: Surat Rekomendasi dari Organisasi Profesi(PPNI) beserta bukti pemenuhan kecukupan SKP=> rekom + kecukupan SKP dari DPD PPNI Kota Surabaya jadi 1 PDF, apabila kurang jelas dapat menghubungi UPTSA 031-5982284 ext 0 atau Live Chat: 085234982434', NULL, '9:30', '2024-02-16', '9:22:46', 'Pengembalian dari PTSP', NULL, NULL),
(133, '30989 / 10 Februari 2024 * Kembali', 'MEYTA MINGGAR KUSUMASARI,', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Mohon menghubungi  uptsa timur (031 5982284) Apabila kurang jelas dikarenakan masih banyak berkas yang kurang', NULL, '8:27:50', NULL, '8:00:26', NULL, NULL, NULL),
(134, '31022 / 10 Februari 2024 * Kembali', 'RIZKY DYAH AYU MULYANI', 'Sarana-Pencabutan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:30:39', NULL, '15:17:08', 'lanjut ke OPD ', NULL, NULL),
(135, '31069 / 10 Februari 2024 * Kembali ', 'AMELIA TANDJUNG,DRG ', 'Perorangan-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '10:38:59', '2024-02-16', ' 10:26:09 ', 'Lanjut ke OPD', NULL, NULL),
(136, '31119 / 11 Februari 2024 * New', 'WINDA PRATIWI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon merubah atau mengganti  Surat Pengantar dari Universitas atau Lembaga (Point syarat no.2) kepada Kepala Dinas Penanaman Modal dan PTSP Kota Surabaya Jalan Tunjungan No. 1-3.', '2024-02-16', '6:43:12', NULL, '20:34:00', 'pengembalian ke OPD', NULL, NULL),
(137, '31158 / 11 Februari 2024 * OPD', 'KUSWANTORO', 'Perpanjangan Izin Pemakaian Rusun', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'terdapat unit lain dalam 1 KK di rusun dupak bangunrejo blok A unit 101.', NULL, '7:57:54', NULL, '15 Februari 2024 16:29:46', 'Pengembalian dari OPD', '81233130304', NULL),
(138, '31276 / 12 Februari 2024 * Kembali', 'FEBRI KARDINA', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:45:00 AM', NULL, '3:29:29 PM', 'Lanjut ke OPD', '-', NULL),
(139, '31311 / 12 Februari 2024 * Kembali', 'ANISA HALIMATUS', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '11:29:20', '2024-02-16', '8:44:29 AM', 'Lanjut ke OPD', NULL, NULL),
(140, '31359 / 12 Februari 2024 * New', 'NUR LUTFIANAH, S.SI.T.', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '7:30:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(141, '31419 / 12 Februari 2024 * Kembali', 'INDARIJANI WILUDJENG', 'Izin Pemakaian Ruang Terbuka Hijau', 'Dinas Lingkungan Hidup', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '1:26:24', '2024-02-16', '  06:48:48', 'LANJUT OPD', NULL, NULL),
(142, '31529 / 12 Februari 2024 * Kembali', 'IHZAREVA RIZKY RAFIQI', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '7:31:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(143, '31842 / 12 Februari 2024 * New', 'H.MOCH.SUNDORO SASONGKO', 'Izin Perabuan Jenazah/Kerangka', 'Dinas Lingkungan Hidup', 'Lanjut', NULL, '2024-02-16', '14:23', NULL, ' 13:54:43', 'lanjut ke OPD', NULL, NULL),
(144, '31862 / 12 Februari 2024 * New', 'HARRY GUNAWAN', 'Izin Perabuan Jenazah/Kerangka', 'Dinas Lingkungan Hidup', 'Lanjut', NULL, '2024-02-16', '14:10', NULL, '13:50:40', 'lanjut ke OPD', NULL, NULL),
(145, '31866 / 12 Februari 2024 * New', 'ADVENIA EKA PUTRI MAWASTI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:43:00 PM', NULL, '9:28:33 AM', 'Lanjut ke OPD', '-', NULL),
(146, '31912 / 12 Februari 2024 * Kembali', 'ANDRE KURNIAWAN NUR HUDA', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:42:28', '2024-02-15', '15:24:05', 'lanjut ke OPD ', NULL, NULL),
(147, '31930 / 12 Februari 2024 * Kembali', 'HERYU VINA INDRIANI', 'Sarana-Perpanjangan Izin Praktik Bidan - SIPB', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:45:00 PM', NULL, ' 12:35:40 ', 'Lanjut ke OPD', '-', NULL),
(148, '31949 / 12 Februari 2024 * New', 'ANI LIEM', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '5:45:36', '2024-02-16', '9:13:22 AM', 'Lanjut ke OPD', '89651122733', NULL),
(149, '31963 / 12 Februari 2024 * Kembali', 'AGUS DARMAWAN', 'Perpanjangan Izin Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:47:00 AM', NULL, '8:45:08 PM', 'Lanjut ke OPD', '-', NULL),
(150, '32011 / 12 Februari 2024 * New', 'BENNY SANTOSO', 'Izin Perabuan Jenazah/Kerangka', 'Dinas Lingkungan Hidup', 'Lanjut', NULL, '2024-02-16', '14:20', NULL, ' 13:44:53', 'lanjut ke OPD', NULL, NULL),
(151, '32042 / 12 Februari 2024 * Kembali', 'LIANAWATI TJANDRA', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyaratan', NULL, NULL, '14:46:05', '2024-02-16', '12:52:18 PM', 'Lanjut ke OPD', '081938510003 \n', NULL),
(152, '32120 / 12 Februari 2024 * Kembali', 'DINDA FADJRIN DWI ANGGRAINI', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '7:26:18', '2024-02-15', '11:36:29 PM', 'Lanjut ke OPD', NULL, NULL),
(153, '32138 / 12 Februari 2024 * Kembali', 'MEGA SUKMA MOEGI LESTARI ROHMAN', 'Perpanjangan Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '9:22', '2024-02-16', '9:16:23', 'lanjut ke opd', NULL, NULL),
(154, '32144 / 12 Februari 2024 * New', 'DEFI INDAH SARI', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '8:48:58', NULL, '6:29:58 PM', 'Lanjut ke OPD', NULL, NULL),
(155, '32158 / 12 Februari 2024 * Kembali', 'JULIATI DWI RAHAYU', 'KRK Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '14:07', NULL, ' 13:43:46', 'lanjut ke OPD', NULL, NULL),
(156, '32187 / 12 Februari 2024 * Kembali', 'DWI DARMAWAN', 'Sarana-Perpanjangan Izin Tenaga Fisioterapis - SIPF', 'Dinas Kesehatan', NULL, 'Mohon gunakan nomer online baru dan pilih permohonan Sarana-Perpanjangan', NULL, '9:48:00 AM', NULL, '6:47:10 PM', 'Pengembalian dari PTSP', '85101807061', NULL),
(157, '32241 / 12 Februari 2024 * Kembali', 'SILVIANA RISZIKI ROMANIA', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Mohon upload Surat Rekomendasi dari Organisasi Profesi(PPNI) beserta bukti pemenuhan kecukupan SKP (Rekom yang dikeluarkan oleh PPNI Cab Surabaya bukan Rekom yang dikeluarkan oleh PPNI Sarana)', NULL, '9:51:00 AM', NULL, '7:33:41 AM', 'Pengembalian dari PTSP', '82139128592', NULL),
(158, '32275 / 13 Februari 2024 * Kembali', 'NIDA HANA SALSABILA', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:44:04', '2024-02-15', '17:06:14', 'lanjut ke OPD ', NULL, NULL),
(159, '32359 / 13 Februari 2024 * Kembali', 'RIZKI NUR RACHMAN PUTRA GOFUR', 'Perorangan-Pencabutan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:45:19', NULL, '17:03:56', 'lanjut ke OPD ', NULL, NULL),
(160, '32444 / 13 Februari 2024 * New', 'RETNO PUSPITO RINI, SE', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', 'Berkas permohonan sesuai dengan persyaratan', NULL, NULL, '10:00:22 AM', '2024-02-16', '9:57:43 AM', 'Lanjut ke OPD', '85161867808', NULL),
(161, '32475 / 13 Februari 2024 * Kembali', 'ADI CAHYO PURNOMO, DRG', 'Surat Keterangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '8:56:42', NULL, '15:04:20', 'lanjut ke OPD ', NULL, NULL);
INSERT INTO `tbl_surat_masuk` (`id_surat`, `no_online`, `pemohon`, `isi`, `dinas`, `ket_lanjut`, `ket_perbaikan`, `tgl_surat`, `jam_surat`, `tgl_diterima`, `jam_diterima`, `keterangan`, `no_telp`, `id_user`) VALUES
(162, '32505 / 13 Februari 2024 * New', 'SALSA PRAMISWARI ISWARA', 'Sarana-Izin Baru Praktik Bidan - SIPB', 'Dinas Kesehatan', NULL, '(1) Mohon alamat KTP, alamat domisili dan alamat sarana pada data entrian diberi tambahan KOTA (2) Mohon upload Copy SIB/STRB yang masih berlaku dan dilegalisir (3) Mohon upload Surat Rekomendasi dari Organisasi Profesi (IBI) beserta bukti pemenuhan kecukupan SKP (4) Mohon upload Peta lokasi da denah tempat praktik beserta peralata yang digunakan (untuk praktir perorangan) (5) Mohon upload Copy Sertifikat yang dilegalisir (Ijazah Legalisir)', NULL, '9:54:00 AM', NULL, ' 19:34:07 ', 'Pengembalian dari PTSP', '89502023738', NULL),
(163, '32526 / 13 Februari 2024 ', 'AGUS TRIYONO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Mohon menggunakan Surat Pernyataan terbaru', NULL, '10:10:25', '2024-02-16', '9:26:51 AM', 'Pengembalian dari UPTSA', NULL, NULL),
(164, '32527 / 13 Februari 2024 * Kembali', 'BUDI SANTOSO HADI WIJAYA, ST', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '08:30', NULL, 'Â 20:40:01', 'lanjut ke opd', NULL, NULL),
(165, '32533 / 13 Februari 2024 * OPD', 'LILIK KEMIRI', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : Mohon menggunakan Surat Pernyataan terbaru. Terima kasih.', NULL, '10:11:05 AM', NULL, '9:22:57 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(166, '32538 / 13 Februari 2024 * Kembali', 'MOH. MUALLAM', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', 'Berkas lengkap secara administrasi', NULL, NULL, '14:37:59', '2024-02-16', '11:07:55 AM', 'Lanjut ke OPD', NULL, NULL),
(167, '32547 / 13 Februari 2024 * Kembali', 'MAT AMIN', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', 'Berkas lengkap dan benar', NULL, NULL, '14:31:59', NULL, '16 Februari 2024 11:14:15', 'Lanjut ke OPD', '85161867808', NULL),
(168, '32550 / 13 Februari 2024 * OPD', 'LENI MARLENA', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : Surat pernyataan harus menggunakan yang baru. Terima kasih.', NULL, '10:13:45 AM', NULL, '9:44:21 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(169, '32554 / 13 Februari 2024 * OPD', 'SLAMET HERIANTO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : Surat pernyataan harus menggunakan yang baru. Terima kasih.', NULL, '10:14:22 AM', NULL, '9:46:18 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(170, '32558 / 13 Februari 2024 * New', 'FIRDYAN SEPTIANI HERAWATI', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara administrasi', NULL, NULL, '14:03:30', '2024-02-16', '12:31:11 PM', 'Lanjut ke OPD', NULL, NULL),
(171, '32563 / 13 Februari 2024', 'ABDUL HAYYI', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Mohon menggunakan Surat Pernyataan terbaru', NULL, '10:15:02', '2024-02-16', ' 10:10:37', 'Pengembalian dari UPTSA', '81803275589', NULL),
(172, '32572 / 13 Februari 2024 * OPD', 'MUNTO SETIJO UTOMO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:15:53 AM', NULL, '10:14:29 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(173, '32578 / 13 Februari 2024 * OPD', 'TULUS WICAKSONO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:24:50 AM', NULL, '10:18:09 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(174, '32584 / 13 Februari 2024 * OPD', 'C RULIK ISMAWATI', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:25:39 AM', NULL, '10:20:15 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(175, '32592 / 13 Februari 2024 * OPD', 'NUNIK AFIFAH', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:26:14 AM', NULL, '10:22:05 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(176, '32594 / 13 Februari 2024 * OPD', 'NUR ASIYAH', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:26:47 AM', NULL, '10:23:38 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(177, '32595 / 13 Februari 2024 * OPD', 'UMI KALSUM', 'Rekomendasi SKRK untuk Pemecahan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'pemohon meminta jadwal ukur ulang', NULL, '8:56:31', NULL, '5:40:06 PM', 'Pengembalian dari OPD', '0822324220943', NULL),
(178, '32598 / 13 Februari 2024 * OPD', 'ANDRI PUDJIANTO, SE', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:46:25 AM', NULL, '10:25:28 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(179, '32600 / 13 Februari 2024 * OPD', 'MARSIN', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:47:17 AM', NULL, '10:27:11 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(180, '32605 / 13 Februari 2024 * OPD', 'PUDARMONO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:48:09 AM', NULL, '10:29:00 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(181, '32610 / 13 Februari 2024 * OPD', 'BUDIONO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:49:06 AM', NULL, '10:30:42 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(182, '32613 / 13 Februari 2024 * OPD', 'SLAMET', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:51:03 AM', NULL, '10:34:49 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(183, '32617 / 13 Februari 2024 * OPD', 'MIMBARTONO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:51:56 AM', NULL, '10:36:19 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(184, '32620 / 13 Februari 2024 * OPD', 'WAHYU ADI RIANTO', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:53:01 AM', NULL, '10:37:45 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(185, '32623 / 13 Februari 2024 * OPD', 'NUR KHASANAH', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', NULL, 'Meneruskan dari OPD, berkas dikembalikan dengan catatan : pernyataan menggunakan yang baru. Terima kasih.', NULL, '10:54:41 AM', NULL, '10:39:27 AM', 'Pengembalian dari OPD', '085161867808', NULL),
(186, '32627 / 13 Februari 2024 * Kembali', 'SENIJONG', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '9:58:11', '2024-02-16', '8:24:25', 'lanjut ke opd', NULL, NULL),
(187, '32628 / 13 Februari 2024 * Kembali', 'AZIZUL WAHID', 'Izin Pemakaian Stan Sentra makanan dan Minuman', 'Dinas Koperasi Usaha Kecil dan Menengah dan Perdagangan', 'Mohon koreksi.', NULL, NULL, '10:56:07 AM', NULL, '10:51:47 AM', 'Lanjut ke OPD', NULL, NULL),
(188, '32655 / 13 Februari 2024 * Kembali', 'SHELVI APRIANTI', 'Sarana-Cabut Pindah Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:46:00 PM', NULL, '11:37:18 AM', 'Lanjut ke OPD', '-', NULL),
(189, '32711 / 13 Februari 2024 * Kembali', 'ZULFIKRI CHARIS DARMAWAN', 'NON KOMERSIAL - Pemakaian Lapangan THOR', 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata', 'Berkas lengkap dan benar', NULL, NULL, '7:53:28', NULL, '15 Februari 2024 21:10:04', 'Lanjut ke OPD', '85704029170', NULL),
(190, '32738 / 13 Februari 2024 * New', 'DESY RAHMAWATI', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:49:00 PM', NULL, '12:52:31 PM', 'Lanjut ke OPD', '-', NULL),
(191, '32775 / 13 Februari 2024 * Kembali', 'INTAN RHAMADANI FITRIYAH, A.MD.KEP.', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '11:22:10', '2024-02-16', '10:04:21 AM', 'Lanjut ke OPD', NULL, NULL),
(192, '32842 / 13 Februari 2024 * Kembali', 'RACHMANINGRUM', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, '(1) Mohon alamat sarana pada data entrian sesuaikan dengan Ijin Operasional Sarana secara lengkap (Kampus C UNAIR JL. ........) (3) Mohon upload Surat Pernyataan memiliki tempat kerja sarana/fasilitas pelayanan kesehatan (bermaterai Rp. 10.000,-) alamat sarana sesuaikan dengan Ijin Operasional Sarana secara lengkap', NULL, '9:59:00 AM', NULL, '7:43:22 PM', 'Pengembalian dari PTSP', '895627572445', NULL),
(193, '32897 / 13 Februari 2024 * Kembali', 'ERLINA NURHAYATI', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '9:24:17', '2024-02-16', '9:03:47', 'lanjut ke OPD ', NULL, NULL),
(194, '33009 / 13 Februari 2024 * New', 'SALSABILA NURILIYAH RASHEL', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '7:39:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(195, '33031 / 13 Februari 2024 * New', 'ILHAM', 'Pemutihan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:04:04', NULL, '3:58:05 PM', 'Lanjut ke OPD', NULL, NULL),
(196, '33067 / 13 Februari 2024 * New', 'ATIK PURWANTI, AMD,PK', 'Perpanjangan Izin Kerja Perekam Medis - SIKPM', 'Dinas Kesehatan', NULL, 'HArap melengkapi kekurangan berkas: cek kembali data entrian step 1 dan 2 alamat beri nama kota, 2 Copy Sertifikat pelatihan yang dimiliki yang dilegalisir asli=> ijazah legalisir, 3 Surat Keterangan : dari pimpinan sarana pelayanan kesehatan sebagai tempat kerjanya beserta copy ijin penyelenggaraan sarana kesehatan yang masih berlaku=> surket kerja+NIB beserta lampirannya versi RBA+sertifikat standar yang telah terverifikasi dan persteknya jadi 1 PDF, 4 SIK Perekam Medis lama asli apabila perpanjangan atau pindah tempat praktik=> masih ada masa berlaku dan dapat diperpanjang H-2 Bulan Sebelum Exp, 5 Surat Pernyataan memiliki tempat kerja di sarana / fasilitas pelayanan kesehatan (bermaterai 10.000,-)=> form ada pada kolom upload dan diketik kembali dengan rapi bukan tulisan tangan ', NULL, '9:41', '2024-02-15', '16:08:53', 'Pengembalian dari PTSP', NULL, NULL),
(197, '33080 / 13 Februari 2024 * Kembali', 'IR. ANWAR HUTOMO', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap administrasi', NULL, NULL, '9:13', '2024-02-16', '9:05:13', 'lanjut ke opd', NULL, NULL),
(198, '33097 / 13 Februari 2024 * Kembali', 'ENY PRASETIYOWATI', 'Izin Baru Kerja Refraksionis Optisien - SIKRO/ SIKO', 'Dinas Kesehatan', NULL, 'Mohon upload Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat praktiknya beserta copy izin penyelenggaraan sarana kesehatan yang masih berlaku', NULL, '1:52:00 PM', NULL, '12:47:03 PM', 'Pengembalian dari PTSP', '81513646174', NULL),
(199, '33108 / 13 Februari 2024 * Kembali', 'PUTRI HALLA SHAVIRA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '8:39:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(200, '33111 / 13 Februari 2024 * Kembali', 'BRAVO AISYA', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', NULL, 'Mohon lampirkan STR lama dikarenakan masa berlaku STR masih aktif hingga 2026', NULL, '1:54:00 PM', NULL, ' 12:35:42 ', 'Pengembalian dari PTSP', '82140880295', NULL),
(201, '33142 / 14 Februari 2024 * Kembali', 'EKA APRILLIA DIYAH SANTI K, S.KEP, NS.', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '11:20:58', '2024-02-16', '8:01:39 AM', 'Lanjut ke OPD', NULL, NULL),
(202, '33202 / 14 Februari 2024 * Kembali', 'CAROLINE MAHENDRA', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '8:16:30', '2024-02-15', '19:10:14', 'lanjut ke opd', NULL, NULL),
(203, '33218 / 14 Februari 2024 * New', 'SULASTRI', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '10:05', NULL, '9:14:41', 'lanjut ke opd', NULL, NULL),
(204, '33220 / 14 Februari 2024 * Kembali', 'SILVIA DAMAYANTI', 'Sarana-Cabut Pindah Praktik Perawat - SIPP', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '9:01:33', NULL, '23:16:16', 'lanjut ke OPD ', NULL, NULL),
(205, '33223 / 14 Februari 2024 * New', 'TEGUH BOESONO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'Keterangan : 1. Mohon upload Lunas Retribusi 2024, \n2. mohon Upload Asli IPT secara lengkap, ', '2024-02-16', '09:41', NULL, '9:19:10', 'pengembalian ke OPD', NULL, NULL),
(206, '33227 / 14 Februari 2024 * Kembali', 'ROY PANDHU WIDJOJO / PT MAHESI AGRI KARYA', 'Rekomendasi Kesehatan Izin Laik Fungsi Bangunan', 'Dinas Kesehatan', NULL, '(1) Mohon upload Surat Permohonan Rekomendasi Kesehatan Izin Laik Fungsi Bangunan Kepada Kepala Dinas Kesehatan Kota Surabaya (beri materai, stempel dan ttd) (2) Mohon upload Hasil Pengujian Laboratoruim Sampel Air Bersih dan Cheklist Pengawasan Internal berdasarkan Permenkes No.02 Tahun 2023 tentang Peraturan Pemerintah Nomor 66 Tahun 2014 tentang Kesehatan Lingkungan', NULL, '10:02:00 AM', NULL, '9:07:55 PM', 'Pengembalian dari PTSP', '81332812021', NULL),
(207, '33251 / 14 Februari 2024 * New', 'FRANSISCUS XAVERIUS KELLY KURNIAWAN', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'Keterangan : 1. Mohon Upload surat pernyataan terbaru (11 Point), ', '2024-02-16', '14:55', NULL, '14:43:18', 'pengembalian ke OPD', NULL, NULL),
(208, '33344 / 15 Februari 2024 * Kembali', 'HERIBERTUS SUHARTONO', 'Perpanjangan Izin Kerja Perekam Medis - SIKPM', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '9:43:00', '2024-02-15', '17:33:33', 'lanjut ke opd', NULL, NULL),
(209, '33380 / 15 Februari 2024 * Kembali', 'KWAN MULYADI KARTONO/PT ISTANA SURYA PERKASA', 'Rekomendasi Kesehatan Izin Laik Fungsi Bangunan', 'Dinas Kesehatan', NULL, 'Mohon upload Hasil Pengujian Laboratoruim Sampel Air Bersih dan Cheklist Pengawasan Internal berdasarkan Permenkes No.02 Tahun 2023 tentang Peraturan Pemerintah Nomor 66 Tahun 2014 tentang Kesehatan Lingkungan', NULL, '10:07:00 AM', NULL, ' 20:25:04 ', 'Pengembalian dari PTSP', '81332812021', NULL),
(210, '33414 / 15 Februari 2024 * New', 'RUM HJ.FAIZAH', 'Persetujuan Pengalihan Hak IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'Lampirkan Fc. KTP & KK Muhammad Tofa , lampirkan SKRK terbaru dari Dinas Perumahan Rakyat dan kawasan permukiman , koreksi pengisian form hal. ke 2 pada point Mengajukan Permohonan agar diganti PERSETUJUAN PENGALIHAN HAK IPT  dan tambahkan penulisan tanggal IPT ', NULL, '8:11:43', NULL, '15 Februari 2024 15:46:21', 'Pengembalian dari PTSP', '83857260362', NULL),
(211, '33423 / 15 Februari 2024 * Kembali', 'SOENARMI, DRA', 'Pemutihan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:38:00', NULL, '15:39:54', 'LANJUT OPD', NULL, NULL),
(212, '33434 / 15 Februari 2024 * New', 'PRIYO SANTOSO LUMADIO, DRS.', 'Daftar Ulang Izin Operasional Satuan Pendidikan SD', 'Dinas Pendidikan', 'Berkas lengkap secara administrasi', NULL, NULL, '9:22:03', '2024-02-16', '8:56:23 AM', 'Lanjut ke OPD', NULL, NULL),
(213, '33509 / 15 Februari 2024 * Kembali', 'ZUHRIA OKTAVIANI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '13:55:12', NULL, ' 10:35:05', 'LANJUT OPD', NULL, NULL),
(214, '33518 / 15 Februari 2024 * Kembali', 'DEVY ARIVIANY (PT TOSHIN PRIMA FINE BLANKING)', 'Tera Ulang di Tempat UTTP Tepasang (Loko)', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:35:10 AM', NULL, '3:55:24 PM', 'Lanjut ke OPD', NULL, NULL),
(215, '33534 / 15 Februari 2024 * New', 'HALIM HADI BROTO', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '10:00:41', '2024-02-16', '19:47:17', 'lanjut ke opd', NULL, NULL),
(216, '33614 / 15 Februari 2024 * New', 'ABED NEGO ANTORO', 'Pemakaian Sirkuit Gelora Bung Tomo', 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata', 'Berkas lengkap dan benar', NULL, NULL, '7:56:15', NULL, '15 Februari 2024 17:21:43', 'Lanjut ke OPD', '81399099377', NULL),
(217, '33666 / 15 Februari 2024 * New', 'PUSPOWATI GONDOWIYONO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'lampirkan pas foto terbaru dengan ukuran 3X4 tanpa garis tepi, lampirkan bukti bayar sewa tanah th. 2024, lengkapi dan koreksi pengisian form surat pernyataan pada point Mengajukan Permohonan PERPANJANGAN IPT , point 3 coret yang tidak perlu , point 7 dan 9 ditulis TOKO ', NULL, '8:27:01', NULL, '15 Februari 2024 16:29:29', 'Pengembalian dari PTSP', '81911808734', NULL),
(218, '33695 / 15 Februari 2024 * Kembali', 'DR. SISKA CITRA AMALIA', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'LANJUT', NULL, NULL, '9:25:52', NULL, '7:55:54', 'lanjut ke OPD ', NULL, NULL),
(219, '33716 / 15 Februari 2024 * New', 'UMI KUSNUL KOTIMAH', 'Sarana-Perpanjangan Izin Praktik Bidan - SIPB', 'Dinas Kesehatan', NULL, '(1) Mohon alamat KTP, alamat domisili dan alamat sarana pada data entrian diberi tambahan KOTA (2) Mohon nama sarana pada data entrian disesuaikan dengan Ijin Operasional Sarana secara lengkap (Rumah Sakit Ibu dan Anak IBI) (3) Mohon upload Pas Photo digital terbaru berwarna ukuran 4 x 6 cm (crop dan rapikan tanpa tepian putih)', NULL, '10:11:00 AM', NULL, '3:07:29 PM', 'Pengembalian dari PTSP', '81216206575', NULL),
(220, '33736 / 15 Februari 2024 * Kembali', 'KURNIA AGUSTINA SITOMPUL', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '1:59:00 PM', NULL, '7:50:34 AM', 'Lanjut ke OPD', '-', NULL),
(221, '33744 / 15 Februari 2024 * Kembali', 'DANIEL WIDJOJO', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, NULL, '13:09:43', '2024-02-16', '1:04:14 PM', 'Lanjut ke  OPD', '82331476120', NULL),
(222, '33759 / 15 Februari 2024 * Kembali', 'TRILESTARI WIJAYANTI, A.MD.KEP.', 'Sarana-Cabut Pindah Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '10:13:00 AM', NULL, '3:55:37 PM', 'Lanjut ke OPD', '-', NULL),
(223, '33779 / 15 Februari 2024 * Kembali', 'ARIEF RIDWANTO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'AGAR MEMBAYAR RETRIBUSI TAHUN 2024 (LAMPIRKAN SSRD RETRIBUSI TH 2024)', '2024-02-16', '13:38:41', '2024-02-16', '11:59:41', 'pengembalian ke OPD', NULL, NULL),
(224, '33780 / 15 Februari 2024 * New', 'FATIMATUS ZEHROH', 'Pencabutan Izin Praktik Tenaga Apoteker - SIPA', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan  berkas: Surat Permohonan pengunduran diri Tenaga Pelayanan Kefarmasian, surat persetujuan dari Pimpinan Fasilitas Pelayanan Kefarmasian/Distribusi/Penyaluran/Produksi=> tambahkan surat persetujuan berkop dan stem,pel sarana', NULL, '11:35:00', '2024-02-15', '15:10:52', 'Pengembalian dari PTSP', NULL, NULL),
(225, '33804 / 15 Februari 2024 * New', 'MERIE NOVIANA', 'Permohonan Pemecahan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:34:00', NULL, '3:21:38 PM', 'LANJUT OPD', NULL, NULL),
(226, '33811 / 15 Februari 2024', 'ASIH MURTINI', 'Reklame Insidentil', 'Badan Pendapatan Daerah', NULL, 'Mohon agar mengajukan permohonan secara offline di UPTSA Surabaya Pusat atau untuk konsultasi bisa hubungi  031 99001779', NULL, '11:07:41', '2024-02-16', '3:27:54 PM', 'Pengembalian dari UPTSA', NULL, NULL),
(227, '33824 / 15 Februari 2024 * New', 'ACHMAD RUFI\\\'I', 'Persetujuan Pengalihan Hak IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:30:00', NULL, ' 17:14:09', 'LANJUT OPD', NULL, NULL),
(228, '33831 / 15 Februari 2024 * New', 'EFFENDI HARTONO', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '7:40:48', '2024-02-16', '9:14:42 AM', 'Lanjut ke OPD', '89651122733', NULL),
(229, '33835 / 15 Februari 2024 * New', 'CATERINA DIANSARI ASTUTI', 'Sarana-Pencabutan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '11:39:00', '2024-02-15', '15:34:08', NULL, NULL, NULL),
(230, '33845 / 15 Februari 2024 * New', 'WIHASTO SURYANINGTYAS, DR', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Mohon melengkapi :\n1. Step 1 pada alamat pemhon dan alamat domisili mohon ditambahkan Jl. dan Kota (contoh : Jl. Menur No. 31 C Surabaya)\n2. Surat Pernyataan memiliki tempat kerja di sarana / fasilitas pelayanan kesehatan atau praktik mandiri (bermaterai 10.000,-)\nMohon diketik kembali dan diisi dengan rapi dan jelas bukan ditulis tangan ====>>> Mohon di donwload dan di bubuhi materai dan tanda tangan (untuk mengisi-nya tidak boleh di tulis tangan)', NULL, '9:33:24', NULL, ' 08:02:08', 'Pengembalian dari PTSP', NULL, NULL),
(231, '33863 / 15 Februari 2024 * Kembali', 'SRI HANDAYANI A MD FARM', 'Izin Baru Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', NULL, 'Mohon upload Surat rekomendasi dari Organisasi Profesi (PAFI) beserta bukti pemenuhan kecukupan SKP', NULL, '2:01:00 PM', NULL, '11:31:22 AM', 'Pengembalian dari PTSP', '8335590140', NULL),
(232, '33868 / 15 Februari 2024 * New', 'RUTH HAPPY SONYA SM.SIPAHUTAR', 'Izin Baru Praktik Tenaga Apoteker - SIPA', 'Dinas Kesehatan', NULL, '(1) Mohon upload Surat Pernyataan mempunyai tempat praktik profesi (bermaterai 10.000,-) dan Surat Keterangan dari pimpinan fasilitas pelayanan kefarmasian (2) Mohon upload Surat rekomendasi dari Organisasi Profesi (IAI) beserta bukti pemenuhan kecukupan SKP ', NULL, '10:23:00 AM', NULL, '4:13:52 PM', 'Pengembalian dari PTSP', '8567668722', NULL),
(233, '33882 / 15 Februari 2024 * New', 'MAYA AGUSTINA', 'Arahan Sistem Drainase', 'Dinas Sumber Daya Air dan Bina Marga', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '8:41:25', NULL, '4:10:44 PM', 'Lanjut ke OPD', NULL, NULL),
(234, '33887 / 15 Februari 2024 * New', 'NAILAH IBTISAM INSYIRACH', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, '(1) Mohon alamat KTP, alamat domisili dan alamat sarana pada data entrian diberi tambahan KOTA (2) Mohon Hari dan Jam Praktik pada data entrian diisi secara lengkap (Misal : Senin-Sabtu, 09.00-15.00) (3) Mohon upload Surat Keterangan domisili tinggal di Surabaya (Bagi Penduduk Non Surabaya)/Surat Pernyataan Pulang Pergi bermaterai 10.000 (4) Mohon upload STR Salinan 1/2/3', NULL, '10:31:00 AM', NULL, ' 20:10:03 ', 'Pengembalian dari PTSP', '82231030053', NULL),
(235, '33897 / 15 Februari 2024 * New', 'LAYASI SALVATOR KARO KARO', 'Pembaharuan Peraturan Perusahaan (PP)', 'Dinas Perindustrian dan Tenaga Kerja', 'Berkas lengkap administrasi', NULL, NULL, '12:40', '2024-02-16', '12:18:43', 'lanjut ke OPD', NULL, NULL),
(236, '33901 / 15 Februari 2024 * New', 'IMBAR YUDHA PRANATA', 'Sarana-Cabut Pindah Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'HArap melengkapi kekurangan berkas: Surat Pernyataan bermaterai memiliki tempat kerja di fasilitas pelayanan kesehatan atau praktik mandiri=> jam kerja sesuaikan kembali Cth: Senin-Minggu Shift 1: 07.00-14.00 dst (Libur 1 Minggu Berapa Kali)', NULL, '11:43', '2024-02-15', '16:41:07', 'Pengembalian dari PTSP', NULL, NULL),
(237, '33904 / 15 Februari 2024 * New', 'NAFIATUN NISA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '13.00', NULL, '16:14:25', 'LANJUT OPD', NULL, NULL),
(238, '33908 / 15 Februari 2024 * New', 'H.MAMUN HASAN', 'Persetujuan Permohonan IMB Izin Pemakaian Tanah (IPT)', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas permohonan sesuai dengan persyaratan', NULL, NULL, '8:24:01 AM', NULL, ' 16:31:38 ', 'Lanjut ke OPD', '81234000171', NULL),
(239, '33914 / 15 Februari 2024 * New', 'IRAWAN,DRS', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '8:56:00', NULL, ' 16:24:56', 'lanjut ke OPD', NULL, NULL),
(240, '33918 / 15 Februari 2024 * New', 'IMAM MASYHURI', 'Perubahan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas permohonan sesuai dengan persyaratan (isi nama terang di ttd halaman kedua surat pernyataan)', NULL, NULL, '8:27:30 AM', NULL, ' 16:57:54 ', 'Lanjut ke OPD', '81332703666', NULL),
(241, '33922 / 15 Februari 2024 * New', 'TEDDY', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, '1. apabila bertindak atas nama badan usaha (PT), mohon lampirkan ASLI/legalisir notaris akta PT lengkap beserta sk pengesahan dari kemenkumham upload jadi 1 pdf, dimana tercantum juga hubungan hukum pemohon, pemilik tanah dengan PT tsb, 2. Gambar sketsa persil belum ditandatangani oleh pemohon, 3. jika atas nama PT mohon merubah isian di akun ssw alfa step 1, kolom bertindak atas nama diisi nama lengkap PT tsb, 4. belum upload SP KRK--untuk format cek email anda. apabila kurang jelas dapat menghubungi UPTSA', '2024-02-16', '10:07:21', '2024-02-15', '16:49:31', 'pengembalian ke OPD', NULL, NULL),
(242, '33924 / 15 Februari 2024 * New', 'ROY REVANUS ANADARKO', 'KRK Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '10:18:35', '2024-02-15', '16:52:22', 'lanjut ke opd', NULL, NULL),
(243, '33925 / 15 Februari 2024 * New', 'MUHAMMAD ZA\\\'ID HILMY', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'mohon melampirkan ASLI atau legalisir pejabat berwenang hubungan hukum antara pemohon dengan PT Citra Pramita Sejahtera, apabila kurang jelas dapat menghubungi UPTSA ', '2024-02-16', '10:29:33', '2024-02-15', '16:58:55', 'pengembalian ke OPD', NULL, NULL),
(244, '33938 / 15 Februari 2024 * New', 'ANDRY WIJAYA', 'KRK Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'belum melengkapi persyaratan surat tanah petok D yang dilegalisir oleh lurah atau camat--cek email anda, jika sudah upload jadi 1 pdf dengan Peta bidang dari BPN yang dilegalisir notaris', '2024-02-16', '11:41:22', '2024-02-15', '11:37:55', 'pengembalian ke OPD', NULL, NULL),
(245, '33964 / 15 Februari 2024 * Kembali', 'FEBRIAN BRAHMANA, DR', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '11:52:00', '2024-02-16', '10:54:47', 'lanjut ke opd', NULL, NULL),
(246, '33965 / 15 Februari 2024 * New', 'IRA WIDORETNO KAJAT, A.MD.KEP.', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Mohon perbaharui surat keterangan domisili (masa berlaku 1 tahun)', NULL, '2:27:43 PM', '2024-02-16', '1:25:51 PM', 'Pengembalian dari PTSP', '81333781663', NULL),
(247, '33981 / 15 Februari 2024 * New', 'NANIK WIDARTI, A.MD.KEB.', 'Perorangan-Perpanjangan Izin Praktik Bidan - SIPB', 'Dinas Kesehatan', NULL, '(1) Mohon alamat KTP, alamat domisili dan alamat sarana pada data entrian diberi tambahan KOTA (2) Mohon upload Surat Rekomendasi dari Organisasi Profesi (IBI) beserta bukti pemenuhan kecukupan SKP (3) Mohon upload Peta lokasi dan denah tempat praktik beserta peralata yang digunakan (untuk praktir perorangan) (4) Mohon upload Surat Pernyataan memiliki tempat kerja di sarana / fasilitas pelayanan kesehatan (bermaterai 10.000,-) Mohon diketik kembali dan diisi dengan rapi dan jelas bukan ditulis tangan (5) Mohon upload Copy Sertifikat yang dilegalisir (Ijazah Legalisir)', NULL, '10:36:00 AM', NULL, ' 19:16:10 ', 'Pengembalian dari PTSP', '82245644748', NULL),
(248, '33989 / 15 Februari 2024 ', 'MIFTAHUL ZUA FANANI', 'KRK Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '11:55:35', '2024-02-16', '11:29:21', 'LANJUT OPD', NULL, NULL),
(249, '33990 / 15 Februari 2024 * New', 'PIPIET ERRIKAWATI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas Lengkap Secara Administrasi', NULL, NULL, '13:42:23', '2024-02-16', '1:31:43 PM', 'Lanjut ke OPD', NULL, NULL),
(250, '33991 / 15 Februari 2024 * New', 'SUTJIPTO TJENGUNDORO', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '9:21:36', '2024-02-15', '3:46:27 PM', 'Lanjut ke OPD', '81230749594', NULL),
(251, '33992 / 15 Februari 2024 * New', 'CHOTIJAH', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:21:00', NULL, '19:28:12', 'LANJUT OPD', NULL, NULL),
(252, '33994 / 15 Februari 2024 * New', 'RITA TATIK WIDYANINGSIH, S.SN', 'Daftar Ulang Izin Operasional Satuan Pendidikan TK', 'Dinas Pendidikan', 'Berkas lengkap secara administrasi', NULL, NULL, '9:23:23', '2024-02-15', '8:53:54 PM', 'Lanjut ke OPD', NULL, NULL),
(253, '34012 / 15 Februari 2024 * New', 'NOVELA DWI CAHYANI PUTRI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '0:14:24', NULL, ' 19:52:16', 'LANJUT OPD', NULL, NULL),
(254, '34013 / 15 Februari 2024 * New', 'ANIZHA DEFY', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '0:43:12', NULL, '20:17:09', 'LANJUT OPD', NULL, NULL),
(255, '34017 / 15 Februari 2024 * New', 'YUSUFI UTARI', 'Perpanjangan Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '11:57:00', '2024-02-15', '21:02:48', 'lanjut ke opd', NULL, NULL),
(256, '34024 / 15 Februari 2024 * New', 'NOOR ZAMI\\\'AH', 'Daftar Ulang Izin Operasional Satuan Pendidikan PPT', 'Dinas Pendidikan', 'Berkas lengkap secara administrasi', NULL, NULL, '9:25:50', '2024-02-15', '8:31:20 PM', 'Lanjut ke OPD', NULL, NULL),
(257, '34051 / 15 Februari 2024 * New', 'YULIATI', 'Daftar Ulang Izin Operasional Satuan Pendidikan PPT', 'Dinas Pendidikan', 'Berkas lengkap secara administrasi', NULL, NULL, '9:29:02', '2024-02-15', '11:05:28 PM', 'Lanjut ke OPD', NULL, NULL),
(258, '34054 / 15 Februari 2024 * New', 'WAHYU SETIANI WIBOWO, DR', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Mohon melengkapi :\n1. Step 1 pada alamat pemhon dan alamat domisili mohon ditambahkan Jl. dan Kota (contoh : Jl. Menur No. 31 C Surabaya)', NULL, '9:55:26', NULL, '21:26:55', 'Pengembalian dari PTSP', NULL, NULL),
(259, '34062 / 15 Februari 2024 * New', 'DEFINA NOVITA ANDINI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '2:09:36', NULL, ' 21:57:09', 'LANJUT OPD', NULL, NULL),
(260, '34063 / 15 Februari 2024 * New', 'PUTRI DEWI YANTI', 'Izin Baru Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '10:39:00 AM', NULL, '9:52:15 PM', 'Lanjut ke OPD', '-', NULL),
(261, '34064 / 15 Februari 2024 * New', 'NURUL QOMARYAH', 'Pencabutan Izin Praktik Teknis Kefarmasian - SIPTTK', 'Dinas Kesehatan', NULL, '(1) Mohon nama sarana pada data entrian sesuaikan dengan SIP Lama (2) Mohon upload Surat Permohonan pengunduran diri Tenaga Pelayanan Kefarmasian dijadikan dalam satu file PDF dengan surat persetujuan dari Pimpinan Fasilitas Pelayanan Kefarmasian', NULL, '10:42:00 AM', NULL, '9:56:33 PM', 'Pengembalian dari PTSP', '895364749295', NULL),
(262, '34067 / 15 Februari 2024 * New', 'MUHAMMAD ZULFIKAR DEFIANTO', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon merubah atau mengganti  Surat Pengantar dari Universitas atau Lembaga (Point syarat no.2) kepada Kepala Dinas Penanaman Modal dan PTSP Kota Surabaya Jalan Tunjungan No. 1-3.', '2024-02-16', '5:16:48', NULL, ' 21:57:12', 'pengembalian ke OPD', NULL, NULL),
(263, '34074 / 15 Februari 2024 * New', 'BADRIYAH', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '7:32:00', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(264, '34075 / 15 Februari 2024 * New', 'MARSHEILA MEGA INTANA', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon untuk mengubah Surat Pengantar dari Universitas atau Lembaga (Point syarat no.2)kepada Kepala Dinas Penanaman Modal dan PTSP Kota Surabaya Jalan Tunjungan No. 1-3., jika kurang paham bisa menghubugi 03199001779 pada jam kerja', NULL, '7:33:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(265, '34080 / 15 Februari 2024 * New', 'RIFDAH AFANIN', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon untuk mengubah Surat Pengantar dari Universitas atau Lembaga (Point syarat no.2)kepada Kepala Dinas Penanaman Modal dan PTSP Kota Surabaya Jalan Tunjungan No. 1-3., jika kurang paham bisa menghubugi 03199001779 pada jam kerja', NULL, '7:34:00 AM', NULL, '15 Februari 2024 15:59:44', 'pengembalian dari PTSP', '83851335408', NULL),
(266, '34081 / 15 Februari 2024 * New', 'MAHRUS ALAUDDIN JASIM', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon untuk mengubah Surat Pengantar dari Universitas atau Lembaga (Point syarat no.2)kepada Kepala Dinas Penanaman Modal dan PTSP Kota Surabaya Jalan Tunjungan No. 1-3., jika kurang paham bisa menghubugi 03199001779 pada jam kerja', NULL, '7:35:00 AM', NULL, '15 Februari 2024 15:59:44', 'pengembalian dari PTSP', '89601975258', NULL),
(267, '34095 / 15 Februari 2024 * New', 'AULIA MAHARANI', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '7:36:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(268, '34096 / 15 Februari 2024 * New', 'FARADILLAH PUTRI AULIYA', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon untuk mengubah Surat Pengantar dari Universitas atau Lembaga (Point syarat no.2)kepada Kepala Dinas Penanaman Modal dan PTSP Kota Surabaya Jalan Tunjungan No. 1-3., jika kurang paham bisa menghubugi 03199001779 pada jam kerja', NULL, '7:37:00 AM', NULL, '15 Februari 2024 15:59:44', 'pengembalian dari PTSP', '85746129217', NULL),
(269, '34107 / 16 Februari 2024 * New', 'SULISTYOWATI', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '09:14', NULL, '8:50:11', 'lanjut ke opd', NULL, NULL),
(270, '34108 / 16 Februari 2024 * New', 'AMANDA IDEA CAHYANI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', NULL, 'mohon lengkapi Scan File KTP pemohon.', '2024-02-16', '6:57:36', NULL, ' 01:53:17', 'pengembalian ke OPD', NULL, NULL),
(271, '34113 / 16 Februari 2024 * New', 'REZA AMINDA PUTRI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '10:33:36', NULL, ' 03:38:57', 'Lanjut ke OPD', NULL, NULL),
(272, '34114 / 16 Februari 2024 * New', 'HARTATI WIDJAJA (APOTIK TANJUNG)', 'Tera Ulang di Kantor UPTD', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:36:29 AM', NULL, '4:16:10 AM', 'Lanjut ke OPD', NULL, NULL),
(273, '34126 / 16 Februari 2024 * New', 'EKA NAZAR BINTARA YUDHA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap secara Administrasi', NULL, '2024-02-16', '12:28:48', NULL, ' 06:23:20', 'Lanjut ke OPD', NULL, NULL),
(274, '34152 / 16 Februari 2024 * New', 'MEI SUYANTO', 'Tanda Daftar Perpustakaan - Baru', 'Dinas Perpustakaan dan Kearsipan', 'Berkas lengkap dan benar', NULL, NULL, '14:30:25', NULL, '16 Februari 2024 09:00:42', 'Lanjut ke OPD', '85731810611', NULL),
(275, '34179 / 16 Februari 2024 * New', 'YENNY BUDIANTO (PT MUTIARACAHAYA PLASTINDO)', 'Tera Ulang di Kantor UPTD', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:37:26 AM', NULL, '8:18:19 AM', 'Lanjut ke OPD', NULL, NULL),
(276, '34185 / 16 Februari 2024 * New ', 'INES KHANSA DARMASTUTI ', 'Izin Kerja Baru Perekam Medis - SIKPM', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '12:25:50', '2024-02-16', '12:12:41', 'Lanjut ke OPD', NULL, NULL),
(277, '34188 / 16 Februari 2024 * New', 'SEPTIWATI, SE', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '8:48:00', NULL, ' 08:44:20', 'lanjut ke OPD', NULL, NULL),
(278, '34199 / 16 Februari 2024 * New', 'LUCIA WIDIYANTI (SOEWARNO)', 'Tera Ulang di Kantor UPTD', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:38:37 AM', NULL, '8:30:52 AM', 'Lanjut ke OPD', NULL, NULL),
(279, '34200 / 16 Februari 2024 * New', 'MOCH. RIFAI (SATKARKATI)', 'Tera Ulang di Kantor UPTD', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '8:39:33 AM', NULL, '8:28:40 AM', 'Lanjut ke OPD', NULL, NULL),
(280, '34223 / 16 Februari 2024 * New', 'AULIA RAHMAN', 'Perubahan IPT', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '10:12:14 AM', '2024-02-16', '9:54:15 AM', 'Lanjut ke OPD', '85232929090', NULL),
(281, '34228 / 16 Februari 2024', 'YANUAR PURWANTO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '9:01:14', '2024-02-16', '9:00:17', 'LANJUT OPD', NULL, NULL),
(282, '34268 / 16 Februari 2024 * New', 'HERI SUTANTO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Lanjut', NULL, '2024-02-16', '10:11', NULL, '10:05:23', 'lanjut ke OPD', NULL, NULL),
(283, '34275 / 16 Februari 2024 * New', 'ERIE', 'Arahan Sistem Drainase', 'Dinas Sumber Daya Air dan Bina Marga', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '9:11:37', NULL, '9:39:51 AM', 'Lanjut ke OPD', NULL, NULL),
(284, '34315 / 16 Februari 2024 * New', 'NURLIA WIDYASOFI', 'Perpanjangan Izin Kerja Perekam Medis - SIKPM', 'Dinas Kesehatan', NULL, '(1) Mohon alamat KTP, alamat domisili dan alamat sarana pada data entrian diberi tambahan KOTA (2) Mohon upload Copy Sertifikat pelatihan yang dimiliki yang dilegalisir asli (Ijazah Legalisir) (3) Mohon upload Surat Keterangan : dari pimpinan sarana pelayanan kesehatan sebagai tempat kerjanya beserta copy ijin penyelenggaraan sarana kesehatan yang masih berlaku', NULL, '2:23:00 PM', NULL, ' 11:31:17 ', 'Pengembalian dari PTSP', '8819886988', NULL),
(285, '34333 / 16 Februari 2024 * New', 'SITI USWATUN CHASANAH (PT CITYLINK EXPRESS)', 'Tera Ulang di Kantor UPTD', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '9:58:26 AM', NULL, '9:49:07 AM', 'Lanjut ke OPD', NULL, NULL),
(286, '34336 / 16 Februari 2024 * Kembali ', 'M. IRFAN RAHMATULLAH ', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '14:06:57', '2024-02-16', ' 13:52:48 ', 'Lanjut ke OPD', NULL, NULL),
(287, '34336 / 16 Februari 2024 * New', 'M. IRFAN RAHMATULLAH', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas: Kartu Tanda Penduduk (KTP) Bagi Penduduk Non Surabaya=> KTP karena ybs bukan KTP surabaya', NULL, '12:04:00', '2024-02-16', '10:36:18', 'Pengembalian dari PTSP', NULL, NULL),
(288, '34342 / 16 Februari 2024 * New ', 'ERNAWATI ', 'Perpanjangan Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '12:28:50', '2024-02-16', ' 10:38:45 ', 'Lanjut ke OPD', NULL, NULL),
(289, '34361 / 16 Februari 2024 * New ', 'PUTRI FIRDA SAMARA ULYANA ', 'Perpanjangan Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', NULL, 'Mohon melengkapi Surat Keterangan domisili tinggal di Surabaya (Bagi Penduduk Non Surabaya) (surat pernyataan PP diberi materai)', '2024-02-16', '12:31:32', '2024-02-16', ' 10:00:52 ', 'Pengembalian dari PTSP', NULL, NULL),
(290, '34364 / 16 Februari 2024 * New', 'NABILAH AQIELLA', 'Izin Baru Praktik Elektromedis - SIP E', 'Dinas Kesehatan', NULL, '1. Mohon upload surat pernyataan pulang pergi pada poin 1\n2. Mohon upload ijazah legalisir pada poin 3\n3. Mohon upload STR dalam bentuk soft file\n4. Mohon perbaiki nama FASKES pada data entry dan surat pernyataan memiliki tempat kerja sesuaikan dengan izin operasional persetujuan teknis\n5. Mohon sesuaikan nomor STR pada data entry sesuaikan dengan ejaan (16 01 5...)', NULL, '2:18:40 PM', '2024-02-16', '12:55:11 PM', 'Pengembalian dari PTSP', '85697785088', NULL),
(291, '34368 / 16 Februari 2024 * New', 'STANLEY', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'berkas lengkap administrasi', NULL, NULL, '1:26:24', '2024-02-16', '9:59:04 AM', 'Lanjut ke OPD', '89651122733', NULL),
(292, '34372 / 16 Februari 2024 * New ', 'HENDY BHASKARA PERDANA PUTRA ', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'Mohon melengkapi : \n1. STR (Surat Tanda Registrasi) yang dilegalisasi (salinan 1), \n2. Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat praktiknya dan fotokopi izin penyelenggaraan fasilitas pelayanan kesehatan yang masih berlaku (Suket Kerja asli+NIB dan lampiran+Perizinan berusaha berbasis resiko versi RBA+pertek dari DINKES)', '2024-02-16', '12:34:06', '2024-02-16', ' 10:14:06 ', 'Pengembalian dari PTSP', NULL, NULL),
(293, '34375 / 16 Februari 2024 * New ', 'EDDY HERMANTO ', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '12:17:48', '2024-02-16', ' 10:05:22 ', 'Lanjut ke OPD', NULL, NULL),
(294, '34390 / 16 Februari 2024 * New', 'MADY HERMAN TANSEDJATI', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '14:20:48', '2024-02-16', '14:20:03', 'lanjut ke opd', NULL, NULL),
(295, '34408 / 16 Februari 2024', 'DYAH PUSPITA PERMATASARI', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'Berkas lengkap sesuai persyaratan administrasi ', NULL, NULL, '13:09:51', '2024-02-16', '10:37:54 AM', 'Lanjut Ke OPD', NULL, NULL),
(296, '34416 / 16 Februari 2024 * New ', 'FEBE ALODIA WIDJAJA ', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Lanjut', NULL, '2024-02-16', '12:12:56', '2024-02-16', ' 10:29:00 ', 'Lanjut ke OPD', NULL, NULL),
(297, '34441 / 16 Februari 2024 * New', 'SITI NUR ANILA', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, '2024-02-16', '11:45:32', '2024-02-16', '10:38:13', 'lanjut ke opd', NULL, NULL),
(298, '34455 / 16 Februari 2024 * New', 'DIDI DARMAHADI DEWANTO,DR', 'Perpanjangan Izin Pembuangan Sampah', 'Dinas Lingkungan Hidup', 'Berkas permohonan sesuai dengan persyaratan', NULL, NULL, '1:24:38 PM', NULL, ' 10:38:02 ', 'Lanjut ke OPD', '85330300248', NULL),
(299, '34456 / 16 Februari 2024 * New', 'SUTOTO YAKOBUS, IR.', 'PBG Rumah Tinggal Pengembang', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-12-16', '10:50:13 AM', '2024-12-16', '10:38:51', 'lanjut ke opd', NULL, NULL),
(300, '34463 / 16 Februari 2024 * New ', 'ROOSPITASARI AYUNINGTYAS ', 'Perpanjangan Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', NULL, 'Mohon melengkapi : \n1. Alamat Domisili Pemohon pada step 1 sesuaikan domisili yang diupload, \n2. Surat Rekomendasi dari PATELKI sesuai tempat kerja beserta bukti pemenuhan kecukupan SKP', '2024-02-16', '12:10:09', '2024-02-16', ' 11:02:23 ', 'Pengembalian dari PTSP', NULL, NULL),
(301, '34472 / 16 Februari 2024 * New', 'ANTONIUS HUSIANTO', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi (point 11. pada surat pernyataan belum diisi penggunaan sesuai SKRK)', NULL, NULL, '14:44:45', '2024-02-16', '11:27:09 AM', 'Lanjut ke OPD', NULL, NULL),
(302, '34491 / 16 Februari 2024 * New', 'MARIA PANGESTUNINGTYAS', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, 'Harap melengkapi kekurangan berkas : 1. Surat Keterangan Sehat jasmani dan rohani dari dokter yang telah memiliki SIP yang masih berlaku (tulis no. SIP nya) 2. Surat Rekomendasi dari Organisasi Profesi(PPNI) beserta bukti pemenuhan kecukupan SKP => Mohon upload rekom DPD PPNI kota Surabaya beserta bukti pemenuhan kecukupan SKP 3. Surat Ijin Praktik/Kerja Perawat(SIPP/SIKP) lama yang asli apabila perpanjangan atau pindah tempat praktik => Mohon upload secara utuh hingga terlihat nomor registrasi dibagian kanan atas 4. Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat kerja beserta copy ijin penyelenggaraan sarana kesehatan yang masih berlaku => Mohon upload surat keterangan kerja + copy ijin operasional sarana terbaru (NIB beserta lampiran) dijadikan 1 file PDF', '2024-02-16', '11:41:58', '2024-02-16', '11:19:18', 'pengembalian ke OPD', NULL, NULL),
(303, '34492 / 16 Februari 2024 * New', 'CATUR CANDRANINGTYAS', 'Cabut Pindah Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', NULL, '1. Mohon upload surat pernyataan pulang pergi bermaterai pada poin 10\n2. Mohon upload Surat Pernyataan bermaterai memiliki tempat kerja di fasilitas pelayanan kesehatan atau praktik mandiri', NULL, '14:13:42', '2024-02-16', '1:17:55 PM', 'Pengembalian dari PTSP', '81999303730', NULL),
(304, '34505 / 16 Februari 2024 * New', 'PUSPO HANDOKO', 'Persetujuan SKRK Peresmian Pemutihan', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '14:21:39', NULL, '11:07:49 AM', 'Lanjut ke OPD', NULL, NULL),
(305, '34533 / 16 Februari 2024 * New', 'IVANA EVELINE TINGKIR', 'KRK Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'Lanjut', NULL, '2024-02-16', '11:23', NULL, ' 11:19:06', 'lanjut ke OPD', NULL, NULL),
(306, '34539 / 16 Februari 2024 * New ', 'MARTHALIA ASTUTI ', 'Perorangan-Perpanjangan Izin Praktik perawat - SIPP', 'Dinas Kesehatan', NULL, 'Mohon mengganti jenis perijinan perorangan menjadi sarana', '2024-02-16', '12:05:06', '2024-02-16', ' 11:38:11 ', 'Pengembalian dari PTSP', NULL, NULL),
(307, '34551 / 16 Februari 2024 * New', 'ADI WITONO', 'Rekomendasi Sistem Proteksi Kebakaran', 'Dinas Pemadam Kebakaran', 'mohon koreksi', NULL, NULL, '14.38.12', '2024-02-16', '11:32:55 AM', 'Lanjut ke OPD', NULL, NULL),
(308, '34553 / 16 Februari 2024 * New', 'SATRIO WICAKSONO', 'Pemakaian Gelora 10 Nopember untuk Kegiatan Latihan', 'Dinas Kebudayaan, Kepemudaan dan Olah Raga serta Pariwisata', 'Berkas lengkap dan benar', NULL, NULL, '12:56:47', NULL, '16 Februari 2024 11:22:15', 'Lanjut ke OPD', '81279889662', NULL);
INSERT INTO `tbl_surat_masuk` (`id_surat`, `no_online`, `pemohon`, `isi`, `dinas`, `ket_lanjut`, `ket_perbaikan`, `tgl_surat`, `jam_surat`, `tgl_diterima`, `jam_diterima`, `keterangan`, `no_telp`, `id_user`) VALUES
(309, '34561 / 16 Februari 2024 * New', 'RATNA AYU HANDAYANI', 'Persetujuan Permohonan IMB Izin Pemakaian Tanah (IPT)', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '14:39:24', '2024-02-16', '12:05:45 PM', 'Lanjut ke OPD', NULL, NULL),
(310, '34568 / 16 Februari 2024 * New', 'YASMIN ALIA FAHMEEDA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'LANJUT PROSES', NULL, NULL, '13;07', NULL, '16 Februari 2024 12:00:40', 'Lanjut ke OPD', '82231355322', NULL),
(311, '34574 / 16 Februari 2024 * New', 'MARTHALIA ASTUTI', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, '2024-02-16', '12:00:33', '2024-02-16', '11:52:16', 'lanjut ke opd', NULL, NULL),
(312, '34579 / 16 Februari 2024 * New', 'DINDA ZHAFIRA', 'Surat Keterangan Penelitian', 'Badan Kesatuan Bangsa dan Politik', 'LANJUT PROSES', NULL, NULL, '13;04', NULL, '16 Februari 2024 12:16:14', 'Lanjut ke OPD', '82139401404', NULL),
(313, '34598 / 16 Februari 2024 * New', 'SAFIRA AMALINA', 'Surat Keterangan Magang/PKL/KKN', 'Badan Kesatuan Bangsa dan Politik', 'berkas lengkap sesuai persyaratan', NULL, NULL, '9:39:00 AM', NULL, '15 Februari 2024 15:59:44', 'LANJUT KE OPD', NULL, NULL),
(314, '34608 / 16 Februari 2024 * New', 'SOEDJONO', 'Persetujuan SKRK Peresmian Pemutihan', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '14:26', NULL, 'Â 13:14:28', 'lanjut ke opd', NULL, NULL),
(315, '34626 / 16 Februari 2024 * New', 'FEBRIA DESI KRISWULAN HARI', 'Perorangan-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '12:57:00', '2024-02-16', '12:49:45', 'lanjut ke OPD', NULL, NULL),
(316, '34658 / 16 Februari 2024 * New', 'IMAM SOLIHIN', 'Tera Ulang di Tempat UTTP Tepasang (Loko)', 'UPTD Metrologi Legal', 'Berkas lengkap secara administrasi', NULL, NULL, '14:07:39', '2024-02-16', '1:32:56 PM', 'Lanjut ke OPD', NULL, NULL),
(317, '34659 / 16 Februari 2024 * New', 'ERDYAN ABRIANSYAH (PT MIKATASA AGUNG)', 'Tera Ulang di Kantor UPTD', 'UPTD Metrologi Legal', 'Berkas permohonan diteruskan.', NULL, NULL, '1:14:49 PM', NULL, '1:13:51 PM', 'Lanjut ke OPD', NULL, NULL),
(318, '34664 / 16 Februari 2024 * New', 'ARIONO', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Lanjut', NULL, '2024-02-16', '13:29', NULL, '13:28:04', 'lanjut ke OPD', NULL, NULL),
(319, '34676 / 16 Februari 2024 * New', 'SURYA GUNAWAN', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'lanjut OPD', NULL, '2024-02-16', '08:21', NULL, '13:32:39', 'lanjut ke opd', NULL, NULL),
(320, '34697 / 16 Februari 2024 * New ', 'BRYAN HERSUSTANTO ', 'Sarana-Perpanjangan Izin Praktik Terapis Gigi dan Mulut - SIPTGM', 'Dinas Kesehatan', NULL, 'Mohon melengkapi : \n1. Pas Photo digital terbaru ukuran 4 x 6 cm (tata letak harus tegak horisontal, tidak boleh miring) (hilangkan bingkai putih), \n2. Copy Sertifikat legalisir ahli madya keperawatan/pendidikan kompetensi lebih tinggi yang diakui pemerintah (ijasah legalisir), \n3. Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat praktiknya beserta copy izin penyelenggaraan sarana kesehatan yang masih berlaku (suket kerja + ijin operasional terbaru)', '2024-02-16', '14:10:30', '2024-02-16', ' 13:49:13 ', 'Pengembalian dari PTSP', NULL, NULL),
(321, '34702 / 16 Februari 2024 * New', 'JOHAN TENACIOUS', 'Tera di Tempat Terpasang UTTP (Loko)', 'UPTD Metrologi Legal', 'Berkas lengkap secara administrasi', NULL, NULL, '14:08:52', '2024-02-16', '1:41:05 PM', 'Lanjut ke OPD', NULL, NULL),
(322, '34704 / 16 Februari 2024 * New', 'TJIANG TIRTO HANDYOKO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '2:20:10 PM', '2024-02-16', 'Â 13:48:29', 'Lanjut ke OPD', '81231716048', NULL),
(323, '34710 / 16 Februari 2024\n\n', 'SITI MUNAWAROH, SH', 'Perpanjangan Izin Pemakaian Tanah', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '14:17:47', '2024-02-16', '14:07:01', 'LANJUT OPD', NULL, NULL),
(324, '34711 / 16 Februari 2024 * New', 'NURINA DHANI RAHMAYANTI', 'Surat Keterangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap secara administrasi', NULL, NULL, '14:10:12', '2024-02-16', '2:02:55 PM', 'Lanjut ke OPD', NULL, NULL),
(325, '34719 / 16 Februari 2024 * New', 'MOH. ARIF', 'Sarana-Perpanjangan Izin Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, '(1) Mohon upload Surat Keterangan Sehat jasmani dan rohani dari dokter yang telah memiliki SIP yang masih berlaku (tulis no. SIP nya) beri catatan pengurusan SIP (2) Mohon upload Surat Rekomendasi dari Organisasi Profesi(PPNI) beserta bukti pemenuhan kecukupan SKP (3) Mohon upload Surat Keterangan domisili tinggal dijadikan dalam satu file PDF dengan Surat Pernyataan Pulang Pergi bermaterai 10.000 (4) Mohon upload Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat kerja beserta copy ijin penyelenggaraan sarana kesehatan yang masih berlaku', NULL, '14:33:00', '2024-02-16', '2:10:49 PM', 'Pengembalian dari PTSP', '82333222805', NULL),
(326, '34749 / 16 Februari 2024 * New', 'RICKY EKO WIDODO', 'KRK Rumah Tinggal Tidak Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', 'LANJUT', NULL, '2024-02-16', '14:05:58', '2024-02-16', '14:04:53', 'lanjut ke opd', NULL, NULL),
(327, '34769 / 16 Februari 2024 * New', 'NADYA FARA ADITI KURNIA SANDY', 'Izin Praktik Baru Ahli Teknologi Laboratorium Medik - ATLM', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '14:38:00', '2024-02-16', '2:28:48 PM', 'Lanjut ke OPD', NULL, NULL),
(328, '34777 / 16 Februari 2024 * New', 'SUNYATA WANGSADARMA', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'Lanjut', NULL, '2024-02-16', '14:25', NULL, '14:29:06', 'lanjut ke OPD', NULL, NULL),
(329, '4021 / 5 Januari 2024 * Kembali', 'ARLY RIMETI YUWANITA', 'Sarana-Izin Baru Tenaga Okupasi Terapis - SIKOT', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '7:27:00', '2024-02-15', '18:39:57', 'lanjut ke opd', NULL, NULL),
(330, '4164 / 6 Januari 2024 * New', 'SHOLICHATIN', 'Daftar Ulang Izin Operasional Satuan Pendidikan TK', 'Dinas Pendidikan', 'Berkas lengkap secara administrasi', NULL, NULL, '9:18:25', '2024-02-16', '8:57:01 AM', 'Lanjut ke OPD', NULL, NULL),
(331, '4268 / 6 Januari 2024 * Kembali', 'MARIA KURNIAWATI', 'Pengalihan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '9:33:54', '2024-02-16', '9:33:12', 'lanjut ke opd', NULL, NULL),
(332, '4643 / 7 Januari 2024 * OPD', 'WIDODO', 'Persetujuan SKRK Peresmian Pemutihan', 'Badan Pengelolaan Keuangan dan Aset Daerah', NULL, 'MENERUSKAN DARI OPD TEKNIS : Berkas dikembalikan ke pemohon dikarenakan Harap membuat Surat Pernyataan yang menyatakan bahwa setuju dan tidak keberatan alamat JL. GUBENG KLINGSINGAN II / 36 B Surabaya diganti menjadi JL. GUBENG KLINGSINGAN II / 36 Surabaya.', '2024-02-16', '8:14:00', NULL, ' 15:52:07', 'pengembalian ke OPD', NULL, NULL),
(333, '5322 / 8 Januari 2024 * Kembali', 'DR.RAUDATUL HIKMAH, MM, SPOG.', 'Sarana-Perpanjangan Izin Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', NULL, 'mohon dokter lampirkan Surat Keterangan : dari Kepala Dinas Kesehatan setempat (untuk tenaga medis pemegang KTP diluar Kota Surabaya) dan fotokopi Surat Izin Praktik (SIP) di kota asal . terima kasih', NULL, '9:22:00 AM', NULL, '4:02:54 PM', 'Pengembalian dari PTSP', '81216000606', NULL),
(334, '5471 / 8 Januari 2024 * Kembali', 'TIO DENYS WINARTA', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:15:00', '2024-02-15', '16:01:28', 'lanjut ke opd', NULL, NULL),
(335, '5831 / 9 Januari 2024 * OPD', 'WIRAATMAJA LOOKMAN', 'PBG Non Rumah Tinggal', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'meneruskan pending dari OPD teknis : gambar pPBG tidak sesuai kondisi lapangan (perjelas permohonan PBG, berdasarkan foto full bangunan, sedangkan pada gambar hanya sebagian bangunan).', NULL, '3:07:12', '2024-02-16', '7:47:46 AM', 'Pengembalian dari OPD', '81330846115', NULL),
(336, '7285 / 10 Januari 2024 * Kembali', 'TINO KASHARA', 'Sarana-Izin Baru Praktik Dokter Umum/Gigi/Spesialis/Spesialis Gigi/PPDS/PPDGS', 'Dinas Kesehatan', 'Berkas lengkap administrasi', NULL, NULL, '8:07', '2024-02-16', '7:39:23', 'lanjut ke opd', NULL, NULL),
(337, '7528 / 10 Januari 2024 * New', 'HENDRA AMARTI', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '14.17:10', '2024-02-16', 'Â 14:08:11', 'Lanjut ke OPD', '81216766610', NULL),
(338, '77444 / 12 Mei 2023 * Kembali', 'KUSNADI HALIM', 'Baru SLF Bersyarat NRT Sederhana', 'Dinas Perumahan Rakyat dan Kawasan Permukiman serta Pertanahan', NULL, 'mohon lampirkan Surat Pernyataan selesainya pekerjaan mendirikan dan/atau mengubah bangunan yang dibuat oleh pemohon atau tenaga ahli konstruksi bangunan', NULL, '14:21:19', '2024-02-16', '1:58:55 PM', 'Pengembalian dari PTSP', '8885719588', NULL),
(339, '83235 / 19 Mei 2023 * Kembali', 'M. IGHBAL ANSORI W.', 'Izin Baru Kerja Tenaga Radiografer - SIKR', 'Dinas Kesehatan', 'Berkas lengkap sesuai persyaratan administrasi', NULL, NULL, '10:53:00 AM', NULL, '9:22:13 AM', 'Lanjut ke OPD', '-', NULL),
(340, '83315 / 19 Mei 2023 * Kembali', 'MOHAMMAD ADIB', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', NULL, '(1) Mohon alamat sarana pada data entrian diberi tambahan KOTA (2) Mohon upload Copy Sertifikat legalisir ahli madya keperawatan (scan legalisir ASLI) (3) Mohon upload Surat Keterangan Sehat jasmani dan rohani dari dokter yang telah memiliki SIP yang masih berlaku (tulis no. SIP nya) beri catatan pengurusan SIP', NULL, '1:11:00 PM', NULL, '8:17:38 AM', 'Pengembalian dari PTSP', '85856760554', NULL),
(341, '9373 / 12 Januari 2024 * Kembali', 'PT. BANGUN USAHA MANDIRI DALAM HAL INI DIWAKILI OLEH YANTJE WONGSO', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'berkas lengkap sesuai persyarata', NULL, NULL, '2:33:01 PM', '2024-02-16', 'Â 14:19:35', 'Lanjut ke OPD', '87853713562', NULL),
(342, '9643 / 12 Januari 2024 * Kembali', 'DRG. NI LUH PUTU LENY PARWATY', 'Perpanjangan Izin Pemakaian Tanah', 'Badan Pengelolaan Keuangan dan Aset Daerah', 'LANJUT', NULL, '2024-02-16', '8:11:15', '2024-02-15', '15:05:50', 'lanjut ke opd', NULL, NULL),
(343, 'TANTIA THOFY A.MD. KEP', 'Sarana-Izin Baru Praktik Perawat - SIPP', 'Dinas Kesehatan', 'Dinas Kesehatan', NULL, 'Surat Keterangan dari fasilitas pelayanan kesehatan sebagai tempat kerja beserta copy ijin penyelenggaraan sarana kesehatan yang masih berlaku => Mohon upload surat keterangan kerja AN TANTIA THOFY A.MD. KEP + copy ijin operasional sarana terbaru (NIB beserta lampiran) dijadikan 1 file PDF', '2024-02-16', '11:52:12', '2024-02-15', '22:04:43', 'pengembalian ke OPD', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` tinyint(2) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`, `nama`, `nip`, `admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'M. Rudi', '1234567', 1),
(2, 'disposisi', '13bb8b589473803f26a02e338f949b8c', 'Petugas Disposisi', '-', 3),
(3, 'matt', '5f4dcc3b5aa765d61d8327deb882cf99', 'Matt', '1980', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_disposisi`
--
ALTER TABLE `tbl_disposisi`
  ADD PRIMARY KEY (`id_disposisi`);

--
-- Indexes for table `tbl_instansi`
--
ALTER TABLE `tbl_instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `tbl_klasifikasi`
--
ALTER TABLE `tbl_klasifikasi`
  ADD PRIMARY KEY (`id_klasifikasi`);

--
-- Indexes for table `tbl_sett`
--
ALTER TABLE `tbl_sett`
  ADD PRIMARY KEY (`id_sett`);

--
-- Indexes for table `tbl_surat_keluar`
--
ALTER TABLE `tbl_surat_keluar`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tbl_surat_masuk`
--
ALTER TABLE `tbl_surat_masuk`
  ADD PRIMARY KEY (`id_surat`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_disposisi`
--
ALTER TABLE `tbl_disposisi`
  MODIFY `id_disposisi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_klasifikasi`
--
ALTER TABLE `tbl_klasifikasi`
  MODIFY `id_klasifikasi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tbl_surat_keluar`
--
ALTER TABLE `tbl_surat_keluar`
  MODIFY `id_surat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_surat_masuk`
--
ALTER TABLE `tbl_surat_masuk`
  MODIFY `id_surat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
