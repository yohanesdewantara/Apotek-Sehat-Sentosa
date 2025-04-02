-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Apr 2025 pada 17.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek_sehatsentosa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `email`, `password`) VALUES
(1, 'admin1', 'admin1@example.com', 'password1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_obat`
--

CREATE TABLE `detail_obat` (
  `id_detailobat` int(11) NOT NULL,
  `id_obat` int(11) DEFAULT NULL,
  `id_detailbeli` int(11) DEFAULT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `stok` int(11) NOT NULL,
  `disc` decimal(5,2) DEFAULT NULL,
  `harga_beli` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_obat`
--

INSERT INTO `detail_obat` (`id_detailobat`, `id_obat`, `id_detailbeli`, `tgl_kadaluarsa`, `stok`, `disc`, `harga_beli`) VALUES
(1, 1, 1, '2025-03-30', 50, 0.00, 5000.00),
(2, 2, 2, '2025-04-01', 25, 5.00, 10000.00),
(3, 3, 3, '2025-06-01', 30, 10.00, 8000.00),
(4, 4, 4, '2025-07-15', 40, 15.00, 6000.00),
(5, 5, 5, '2025-08-20', 35, 20.00, 7000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id_detailbeli` int(11) NOT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_detailobat` int(11) DEFAULT NULL,
  `tgl_pembelian` date NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `harga_beli` decimal(10,2) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id_detailbeli`, `id_pembelian`, `id_detailobat`, `tgl_pembelian`, `jumlah_beli`, `harga_beli`, `tgl_kadaluarsa`) VALUES
(1, 1, 1, '2024-03-30', 50, 5000.00, '2025-03-30'),
(2, 2, 2, '2024-03-31', 25, 10000.00, '2025-04-01'),
(3, 3, 3, '2024-04-01', 30, 8000.00, '2025-06-01'),
(4, 4, 4, '2024-04-02', 40, 6000.00, '2025-07-15'),
(5, 5, 5, '2024-04-03', 35, 7000.00, '2025-08-20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_detailjual` int(11) NOT NULL,
  `id_penjualan` int(11) DEFAULT NULL,
  `id_detailobat` int(11) DEFAULT NULL,
  `tgl_penjualan` date NOT NULL,
  `jumlah_terjual` int(11) NOT NULL,
  `harga_jual` decimal(10,2) NOT NULL,
  `harga_beli` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_detailjual`, `id_penjualan`, `id_detailobat`, `tgl_penjualan`, `jumlah_terjual`, `harga_jual`, `harga_beli`) VALUES
(6, 6, 1, '2024-04-03', 10, 7000.00, 5000.00),
(7, 7, 2, '2024-04-04', 5, 15000.00, 10000.00),
(8, 8, 3, '2024-04-05', 7, 12000.00, 8000.00),
(9, 9, 4, '2024-04-06', 8, 9000.00, 6000.00),
(10, 10, 5, '2024-04-07', 6, 11000.00, 7000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_stokopname`
--

CREATE TABLE `detail_stokopname` (
  `id_detailopname` int(11) NOT NULL,
  `id_opname` int(11) DEFAULT NULL,
  `id_detailobat` int(11) DEFAULT NULL,
  `stok_kadaluarsa` int(11) DEFAULT NULL,
  `tanggal_kadaluarsa` date NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_stokopname`
--

INSERT INTO `detail_stokopname` (`id_detailopname`, `id_opname`, `id_detailobat`, `stok_kadaluarsa`, `tanggal_kadaluarsa`, `keterangan`) VALUES
(1, 1, 1, 50, '2025-03-30', 'Stok masih aman'),
(2, 2, 2, 25, '2025-04-01', 'Stok hampir habis'),
(3, 3, 3, 30, '2025-06-01', 'Perlu dicek kembali'),
(4, 4, 4, 40, '2025-07-15', 'Stok mencukupi'),
(5, 5, 5, 35, '2025-08-20', 'Stok cukup untuk 3 bulan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `id_rak` int(11) DEFAULT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `stok_total` int(11) NOT NULL,
  `keterangan_obat` text DEFAULT NULL,
  `jenis_obat` varchar(50) DEFAULT NULL,
  `harga_beli` decimal(10,2) NOT NULL,
  `harga_jual` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id_obat`, `id_rak`, `nama_obat`, `stok_total`, `keterangan_obat`, `jenis_obat`, `harga_beli`, `harga_jual`) VALUES
(1, 1, 'Paracetamol', 100, 'Obat pereda demam', 'Tablet', 5000.00, 7000.00),
(2, 2, 'Amoxicillin', 50, 'Antibiotik', 'Kapsul', 10000.00, 15000.00),
(3, 3, 'Vitamin C', 75, 'Suplemen daya tahan tubuh', 'Tablet', 8000.00, 12000.00),
(4, 4, 'Ibuprofen', 60, 'Obat anti inflamasi', 'Tablet', 6000.00, 9000.00),
(5, 5, 'Antasida', 90, 'Obat maag', 'Kapsul', 7000.00, 11000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `tgl_pembelian` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_admin`, `tgl_pembelian`, `total`) VALUES
(1, 1, '2024-03-30', 200000.00),
(2, 1, '2024-03-31', 150000.00),
(3, 1, '2024-04-01', 180000.00),
(4, 1, '2024-04-02', 170000.00),
(5, 1, '2024-04-03', 190000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `tgl_penjualan` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_admin`, `tgl_penjualan`, `total`) VALUES
(6, 1, '2024-04-03', 50000.00),
(7, 1, '2024-04-04', 75000.00),
(8, 1, '2024-04-05', 60000.00),
(9, 1, '2024-04-06', 70000.00),
(10, 1, '2024-04-07', 80000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak_obat`
--

CREATE TABLE `rak_obat` (
  `id_rak` int(11) NOT NULL,
  `nama_rak` varchar(100) NOT NULL,
  `keterangan_rak` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rak_obat`
--

INSERT INTO `rak_obat` (`id_rak`, `nama_rak`, `keterangan_rak`) VALUES
(1, 'Rak A', 'Rak untuk obat umum'),
(2, 'Rak B', 'Rak untuk obat resep'),
(3, 'Rak C', 'Rak untuk obat herbal'),
(4, 'Rak D', 'Rak untuk suplemen'),
(5, 'Rak E', 'Rak untuk obat anak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_opname`
--

CREATE TABLE `stok_opname` (
  `id_opname` int(11) NOT NULL,
  `id_detailobat` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stok_opname`
--

INSERT INTO `stok_opname` (`id_opname`, `id_detailobat`, `id_admin`, `tanggal`) VALUES
(1, 1, 1, '2024-04-01'),
(2, 2, 1, '2024-04-02'),
(3, 3, 1, '2024-04-03'),
(4, 4, 1, '2024-04-04'),
(5, 5, 1, '2024-04-05');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD PRIMARY KEY (`id_detailobat`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_detailbeli` (`id_detailbeli`);

--
-- Indeks untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`id_detailbeli`),
  ADD KEY `id_pembelian` (`id_pembelian`);

--
-- Indeks untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id_detailjual`),
  ADD KEY `id_penjualan` (`id_penjualan`);

--
-- Indeks untuk tabel `detail_stokopname`
--
ALTER TABLE `detail_stokopname`
  ADD PRIMARY KEY (`id_detailopname`),
  ADD KEY `id_opname` (`id_opname`),
  ADD KEY `id_detailobat` (`id_detailobat`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`),
  ADD KEY `fk_rak` (`id_rak`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `rak_obat`
--
ALTER TABLE `rak_obat`
  ADD PRIMARY KEY (`id_rak`);

--
-- Indeks untuk tabel `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD PRIMARY KEY (`id_opname`),
  ADD KEY `id_detailobat` (`id_detailobat`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `detail_obat`
--
ALTER TABLE `detail_obat`
  MODIFY `id_detailobat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id_detailbeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id_detailjual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `detail_stokopname`
--
ALTER TABLE `detail_stokopname`
  MODIFY `id_detailopname` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `rak_obat`
--
ALTER TABLE `rak_obat`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `stok_opname`
--
ALTER TABLE `stok_opname`
  MODIFY `id_opname` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD CONSTRAINT `detail_obat_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`),
  ADD CONSTRAINT `detail_obat_ibfk_2` FOREIGN KEY (`id_detailbeli`) REFERENCES `detail_pembelian` (`id_detailbeli`);

--
-- Ketidakleluasaan untuk tabel `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `detail_pembelian_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`);

--
-- Ketidakleluasaan untuk tabel `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`);

--
-- Ketidakleluasaan untuk tabel `detail_stokopname`
--
ALTER TABLE `detail_stokopname`
  ADD CONSTRAINT `detail_stokopname_ibfk_1` FOREIGN KEY (`id_opname`) REFERENCES `stok_opname` (`id_opname`),
  ADD CONSTRAINT `detail_stokopname_ibfk_2` FOREIGN KEY (`id_detailobat`) REFERENCES `detail_obat` (`id_detailobat`);

--
-- Ketidakleluasaan untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `fk_rak` FOREIGN KEY (`id_rak`) REFERENCES `rak_obat` (`id_rak`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD CONSTRAINT `stok_opname_ibfk_1` FOREIGN KEY (`id_detailobat`) REFERENCES `detail_obat` (`id_detailobat`),
  ADD CONSTRAINT `stok_opname_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
