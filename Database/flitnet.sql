-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 22, 2023 lúc 05:50 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `flitnet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id_account` int(11) NOT NULL,
  `id_type` int(11) DEFAULT NULL,
  `username` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `time_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id_account`, `id_type`, `username`, `password`, `email`, `time_created`) VALUES
(4, 1, 'admin', '$2b$10$88QJAQJMvZqiasxeeSzJ9.NX50QMFKex35Yqph1ENxIfM3D888J.2', 'admin@gmail.com', '2023-04-22'),
(5, 2, 'user', '$2b$10$EeZVq2giKYW4iNup4iP/ge7SrXKFZ8K7e7O8uqaoggxG9jeOX5wbW', 'user@gmail.com', '2023-04-22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookmark`
--

CREATE TABLE `bookmark` (
  `id_bookmark` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `time_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `movie`
--

CREATE TABLE `movie` (
  `id_movie` int(11) NOT NULL,
  `id_type_movie` int(11) NOT NULL,
  `title_movie` varchar(1000) NOT NULL,
  `description_movie` text NOT NULL,
  `release_year` year(4) NOT NULL,
  `language` varchar(1000) NOT NULL,
  `country` varchar(1000) NOT NULL,
  `director` varchar(1000) NOT NULL,
  `poster` varchar(1000) NOT NULL,
  `trailer` varchar(1000) NOT NULL,
  `movie` varchar(1000) NOT NULL,
  `time_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `movie`
--

INSERT INTO `movie` (`id_movie`, `id_type_movie`, `title_movie`, `description_movie`, `release_year`, `language`, `country`, `director`, `poster`, `trailer`, `movie`, `time_created`) VALUES
(1, 5, 'The Dark Night', 'Cuộc sống của những cư dân thành phố Gotham bị đảo lộn do hàng loạt vụ giết người xảy ra mà không tìm ra hung thủ. Kẻ đứng sau tất cả âm mưu đen tối này là Joker, kẻ được các băng đảng trong thành phố thuê để trừ khử Người Dơi. Bộ 3 Người dơi – Trung úy Gordon – Luật sư Harvey Dent vốn gắn bó với nhau chống lại các thế lực xấu nay bị chia rẽ. Mọi chuyện sẽ diễn tiến ra sao? Hãy cùng theo dõi The Dark Knight để có câu trả lời.', 2008, 'English', 'England', 'Christopher Nolan', 'moive-thedarkknight2.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-03'),
(2, 4, 'Avatar: The Way of Water', 'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora. Once a familiar threat returns to finish what was previously started, Jake must work with Neytiri and the army of the Na\'vi race to protect their home.', 2022, 'English', 'England', 'James Cameron', 'movie-avatar2.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(3, 5, 'Captain America: The First Avenger', 'Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a \"Super-Soldier serum\". But being Captain America comes at a price as he attempts to take down a warmonger and a terrorist organization.', 2011, 'English', 'US', 'Joe Johnston', 'movie-captainamerica.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(4, 5, 'Guardians of the Galaxy Vol. 2 ', 'The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord\'s encounter with his father the ambitious celestial being Ego.', 2017, 'English', 'England', 'James Gunn', 'movie-guardiansofthegalaxy.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(5, 5, 'Iron Man', 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 2008, 'English', 'England', 'Jon Favreau', 'movie-ironman.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(6, 4, 'John Wick: Chapter 4', 'John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.', 2023, 'English', 'England', 'Chad Stahelski', 'movie-johnwick4.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(7, 1, 'Ant-Man and the Wasp: Quantumania', 'Scott Lang and Hope Van Dyne, along with Hank Pym and Janet Van Dyne, explore the Quantum Realm, where they interact with strange creatures and embark on an adventure that goes beyond the limits of what they thought was possible.', 2023, 'English', 'England', 'Peyton Reed', 'movie-antman3.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(8, 3, 'Kuntilanak 2', 'Dinda who escapes the Kuntilanak (female vampire ghost) terror, without the agreement of Aunt Donna, intends to meet someone who is believed to be her biological mother, Karmila.', 2019, 'English', 'England', 'Rizal Mantovani', 'movie-maguong2.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(9, 2, 'Puss in Boots: The Last Wish', 'When Puss in Boots discovers that his passion for adventure has taken its toll and he has burned through eight of his nine lives, he launches an epic journey to restore them by finding the mythical Last Wish.', 2023, 'English', 'England', 'Joel Crawford', 'movie-meodihia.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(10, 6, '6/45', 'A comical encounter between South and North Korean soldiers over the 5.7 billions won lottery that crossed the military demarcation line on the wind', 2022, 'English', 'England', 'Gyu-tae Park', 'movie-trungso.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(11, 2, 'Sonic the Hedgehog 2', 'When the manic Dr Robotnik returns to Earth with a new ally, Knuckles the Echidna, Sonic and his new friend Tails is all that stands in their way.', 2020, 'English', 'England', 'Jeff Fowler', 'movie-sonic2.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14'),
(12, 5, 'Doctor Strange in the Multiverse of Madness', 'Doctor Strange teams up with a mysterious teenage girl from his dreams who can travel across multiverses, to battle multiple threats, including other-universe versions of himself, which threaten to wipe out millions across the multiverse. They seek help from Wanda the Scarlet Witch, Wong and others.', 2022, 'English', 'England', 'Sam Raimi', 'movie-doctor2.jpg', 'CoMau.mp4', 'CoMau.mp4', '2023-04-14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating`
--

CREATE TABLE `rating` (
  `id_rating` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `time_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_account`
--

CREATE TABLE `type_account` (
  `id_type` int(11) NOT NULL,
  `role_name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `type_account`
--

INSERT INTO `type_account` (`id_type`, `role_name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_movie`
--

CREATE TABLE `type_movie` (
  `id_type_movie` int(11) NOT NULL,
  `type_name_movie` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `type_movie`
--

INSERT INTO `type_movie` (`id_type_movie`, `type_name_movie`) VALUES
(1, 'Science'),
(2, 'Comedy'),
(3, 'Horror'),
(4, 'Fiction'),
(5, 'Hero'),
(6, 'Drama');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id_account`),
  ADD KEY `id_type` (`id_type`);

--
-- Chỉ mục cho bảng `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`id_bookmark`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id_movie`),
  ADD KEY `id_type_movie` (`id_type_movie`);

--
-- Chỉ mục cho bảng `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_rating`),
  ADD KEY `id_account` (`id_account`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Chỉ mục cho bảng `type_account`
--
ALTER TABLE `type_account`
  ADD PRIMARY KEY (`id_type`);

--
-- Chỉ mục cho bảng `type_movie`
--
ALTER TABLE `type_movie`
  ADD PRIMARY KEY (`id_type_movie`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `id_bookmark` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `movie`
--
ALTER TABLE `movie`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `rating`
--
ALTER TABLE `rating`
  MODIFY `id_rating` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `type_account`
--
ALTER TABLE `type_account`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `type_movie`
--
ALTER TABLE `type_movie`
  MODIFY `id_type_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_account` (`id_type`);

--
-- Các ràng buộc cho bảng `bookmark`
--
ALTER TABLE `bookmark`
  ADD CONSTRAINT `bookmark_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`),
  ADD CONSTRAINT `bookmark_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);

--
-- Các ràng buộc cho bảng `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`id_type_movie`) REFERENCES `type_movie` (`id_type_movie`);

--
-- Các ràng buộc cho bảng `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `account` (`id_account`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`id_movie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
