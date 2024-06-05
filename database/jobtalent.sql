-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2024 pada 03.41
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `linktree`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `list`
--
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    username VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    bio TEXT,
    status ENUM('provide', 'seeker')
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE providers (
    provider_id INT PRIMARY KEY,
    user_id INT,
    provider_name VARCHAR(100) NOT NULL,
    description TEXT,
    price_start INT,
    price_end INT,
    created_at TIMESTAMP,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    seeker_id INT,
    provider_id INT,
    appointment_date TIMESTAMP NOT NULL,
    status ENUM('pending', 'confirmed', 'completed', 'cancelled'),
    created_at TIMESTAMP,
    FOREIGN KEY (seeker_id) REFERENCES users(id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

CREATE TABLE messages (
    message_id INT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    content TEXT NOT NULL,
    sent_at TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT NOT NULL,
    created_at TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    like_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    created_at TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

--
-- Dumping data untuk tabel `list`
--

-- INSERT INTO `list` (`id`, `name`, `link`) VALUES
-- (298, '1sqsqsqs', 'dwdwd'),
-- (358, 'gygyugugbhbhbbj', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `list`
--

-- ALTER TABLE `list`
--   ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `list`
--

-- ALTER TABLE `list`
--   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
