CREATE DATABASE mangahub;
GO
drop database mangahub
USE mangahub;
use master;
GO
drop table account
CREATE TABLE account (
  userid INT PRIMARY KEY IDENTITY(1,1),
  fullname VARCHAR(50) NOT NULL,
  username VARCHAR(30) NOT NULL UNIQUE, 
  password VARCHAR(50) NOT NULL,    
  useravatar TEXT,
  role VARCHAR(18) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(15) NOT NULL  
);
GO

CREATE TABLE comics (
  id INT IDENTITY(1,1) PRIMARY KEY,
  title NVARCHAR(50) NOT NULL UNIQUE,   
  author NVARCHAR(30),
  published_date DATE,
  descriptionComic NVARCHAR(500),
  viewer NVARCHAR(10),
);
GO

CREATE TABLE genres (
  genre_id INT IDENTITY(1,1) PRIMARY KEY, 
  genre_name NVARCHAR(30) NOT NULL
);
GO

CREATE TABLE comic_genres (
  comic_id INT NOT NULL,
  genre_id INT NOT NULL,
  FOREIGN KEY (comic_id) REFERENCES comics(id) ON DELETE CASCADE,
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE,
  PRIMARY KEY (comic_id, genre_id)
);
GO




CREATE TABLE favlist (
  user_id INT,  
  comic_id INT, 
  FOREIGN KEY (user_id) REFERENCES account(userid) ON DELETE CASCADE,
  FOREIGN KEY (comic_id) REFERENCES comics(id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, comic_id)
);
GO

CREATE TABLE history (
  user_id INT,
  comic_id INT, 
  last_chapter INT,
  FOREIGN KEY (user_id) REFERENCES account(userid) ON DELETE CASCADE,
  FOREIGN KEY (comic_id) REFERENCES comics(id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, comic_id, last_chapter)
);

CREATE TABLE comment (
  user_id INT,
  comic_id INT, 
  comment_chapter INT,
  content TEXT,
  date_comment date,
  FOREIGN KEY (user_id) REFERENCES account(userid) ON DELETE CASCADE,
  FOREIGN KEY (comic_id) REFERENCES comics(id) ON DELETE CASCADE,
  PRIMARY KEY (user_id, comic_id, comment_chapter)
);

INSERT INTO account (fullname, username, password, useravatar, role, email, phone) VALUES
('Vuaga 1260', 'vuaga1260', '123', 'avatar1.jpg', 'admin', 'vuaga1260@example.com', '123456789'),
('User 2', 'user2', 'password1234', 'avatar2.jpg', 'user', 'user2@example.com', '113456789'),
('User 3', 'user3', 'password1235', 'avatar3.jpg', 'user', 'user3@example.com', '122456789'),
('beobuonba', 'tcqb', '123', 'admin1.jpg', 'admin', 'admin1@example.com', '123446789'),
('Admin 2', 'admin2', 'adminpassword2', 'admin2.jpg', 'admin', 'admin2@example.com', '123456799');
Go
INSERT INTO comics (title, author, published_date, descriptionComic, viewer) VALUES
(N'Naruto', 'Masashi Kishimoto', '1999-09-21',N'Naruto là một cậu bé có mơ ước trở thành hokage của làng Konoha,được Hokage phong ấn trong người một trong 9 quái vật của thể giới : Cửu vĩ Hồ ly.Vì cho cậu là một con quái vật, ko ai dám chơi với cậu!& Vì muốn được thừa nhận nên rất phá phách.', '200k'),
(N'Berserk', 'Kentaro Miura', '1989-08-25',N'Trong bối cảnh loạn lạc của chiến tranh, mỗi con người khi sinh ra đều mang một sứ mệnh và vai trò nhất định. Đặc biệt, có những người được xem là có khả năng thay đổi thế giới, họ được gọi là "God Hand" và có quyền phán xét mọi việc.', '150k'),
(N'One Piece', 'Eiichiro Oda', '1997-07-22',N'Monkey D. Luffy, 1 cậu bé rất thích hải tặc có ước mơ tìm được kho báu One Piece và trở thành Vua hải tặc - Pirate King. Lúc nhỏ, Luffy tình cờ ăn phải trái quỉ (Devil Fruit) Gomu Gomu, nó cho cơ thể cậu khả năng co dãn đàn hồi như cao su nhưng đổi lại cậu sẽ không bao giờ biết bơi.', '300k'),
(N'My Hero Academia', 'Kohei Horikoshi', '2014-07-07',N'Vào tương lai, lúc mà con người với những sức mạnh siêu nhiên là điều thường thấy quanh thế giới. Đây là câu chuyện về Izuku Midoriya, từ một kẻ bất tài trở thành một siêu anh hùng. Tất cả ta cần là mơ ước.', '250k'),
(N'Demon Slayer: Kimetsu no Yaiba', 'Koyoharu Gotouge', '2016-02-15',N'Tanjiro là con cả trong một gia đình không còn người cha. Một hôm, Tanjiro đi bán than ở một ngôi làng nọ và phải ở lại đó qua đêm vì có tin đồn rằng, về đêm, luôn có một con quỷ lởn vởn ở ngọn núi gần đó. Khi Tanjiro đi về nhà vào ngày hôm sau, bi kịch đang chờ đón cậu.', '220k'),
(N'呪術廻戦 Jujutsu Kaisen', 'Gege Akutami', '2018-03-05',N'Yuuji Itadori là một thiên tài có tốc độ và sức mạnh, nhưng cậu ấy muốn dành thời gian của mình trong Câu lạc bộ Tâm Linh. Một ngày sau cái chết của ông mình, anh gặp Megumi Fushiguro, người đang tìm kiếm vật thể bị nguyền rủa mà các thành viên CLB đã tìm thấy.', '180k'),
(N'Solo Leveling', 'Chugong', '2016-07-25', N'Sung Jin-Woo là một Thợ Săn hạng E yếu ớt, nhưng sau khi sống sót từ một ngục tối kép và nhận được khả năng thăng cấp, anh trở thành Thợ Săn mạnh nhất.', '210k'),
(N'Beastars', 'Paru Itagaki', '2016-09-08', N'Trong một thế giới động vật, Legoshi, một con sói xám, điều hướng cuộc sống tại Cherryton Academy, nơi căng thẳng giữa động vật ăn cỏ và động vật ăn thịt luôn tồn tại.', '190k'),
(N'Blue Archive', 'NEXON Games', '2021-02-04', N'Một nhóm học sinh tại thành phố Kivotos tham gia vào các hoạt động điều tra bí ẩn và chiến đấu chống lại các thế lực đen tối để bảo vệ thành phố.', '100k'),
(N'Cổ Chân Nhân', N'Cổ Chân', '2019-12-06', N'Tiểu thuyết tu chân tập trung vào nhân vật chính nỗ lực đạt đến đỉnh cao của quyền lực và sức mạnh thông qua luyện đan, sử dụng cổ trùng và tham gia vào các cuộc chiến sinh tử.', '160k'),
(N'Oyasumi PunPun', 'Inio Asano', '2007-03-15', N'Câu chuyện về cuộc sống đầy biến động của PunPun Punyama, từ thời thơ ấu cho đến khi trưởng thành, qua các mối quan hệ và những thay đổi nội tâm phức tạp.', '140k'),
(N'SCP đơn giản hoá', 'SCP Foundation', '2007-01-19', N'Một tập hợp các tài liệu mô tả các đối tượng, thực thể, địa điểm và hiện tượng dị thường mà Tổ Chức SCP giữ kín để bảo vệ nhân loại.', '120k'),
(N'Mahou Shoujo ni Akogarete', 'Akihiro Ononaka', '2019-03-29', N'Tình yêu của một cô gái bình thường với các Mahou Shoujo (Cô gái phép thuật) và cách cô ấy dấn thân vào thế giới phép thuật đầy nguy hiểm.', '130k'),
(N'Paradise Hell', 'Unknown', '2019-06-13', N'Trận chiến giữa thiên đàng và địa ngục, nơi các linh hồn và quỷ dữ đấu tranh để giành quyền kiểm soát số phận con người.', '110k'),
(N'Quý Tộc Nhà Nông', 'Hiromu Arakawa', '2017-04-04', N'Thế giới nơi quý tộc và nông dân sống chung, câu chuyện về một chàng trai trẻ từ nông thôn nỗ lực thay đổi cuộc sống của mình và gia đình.', '170k'),
(N'Là Sát Thủ, Nhưng Tôi Còn Mạnh Hơn Cả Anh Hùng', 'Akira Oda', '2019-06-14', N'Một sát thủ chuyên nghiệp tái sinh vào thế giới khác và nhận ra mình còn mạnh hơn cả những anh hùng ở đó.', '200k'),
(N'ELDEN RING: The road to the Erdtree', 'Nikiichi Tobita', '2022-09-21', N'Tiểu thuyết dựa trên trò chơi "Elden Ring", theo chân các nhân vật trong hành trình tìm kiếm Erdtree và khám phá thế giới đầy bí ẩn.', '150k'),
(N'Tình Yêu Bị Ngăn Cấm', 'Musawo', '2014-08-12', N'Trong một xã hội nơi chính phủ chọn bạn đời cho mỗi người, Yukari Nejima và Misaki Takasaki chiến đấu vì tình yêu thực sự của mình.', '120k'),
(N'Thế giới không hoàn hảo', N'Trần Cao Quốc Bảo', '2015-06-04', N'Một câu chuyện giả tưởng về thế giới bị chia cắt bởi các thế lực khác nhau, nơi một nhóm người trẻ đấu tranh để tìm kiếm sự hoàn hảo.', '140k'),
(N'Toàn trí độc giả', 'singNsong', '2020-01-13', N'Kim Dokja phát hiện ra thế giới xung quanh mình trở thành một cuốn tiểu thuyết mà anh đã đọc, và anh phải sử dụng kiến thức của mình để sống sót.', '180k'),
(N'Dark gathering', 'Kenichi Kondo', '2019-03-25', N'Một câu chuyện kinh dị xoay quanh Keitaro Gentoga, người bị kéo vào thế giới của các linh hồn và ác quỷ.', '130k'),
(N'Conan', 'Gosho Aoyama', '1994-01-19', N'Shinichi Kudo, một thám tử trẻ tuổi bị thu nhỏ thành một đứa trẻ, sử dụng cái tên Conan Edogawa và tiếp tục giải quyết các vụ án.', '250k'),
(N'Arya bàn bên', 'Unknown', '2023-07-03', N'Arya, một cô gái bí ẩn, ngồi bên cạnh nhân vật chính và những sự kiện kỳ lạ bắt đầu xảy ra trong lớp học.', '90k'),
(N'Anh hùng thận trọng', 'Light Tuchihi', '2016-06-10', N'Seiya Ryuuguuin, một anh hùng cực kỳ cẩn trọng, được triệu hồi đến một thế giới khác để cứu nó khỏi sự diệt vong.', '160k'),
(N'SHIKANOKO NOKONOKO KOSHITANTAN', 'Unknown', '2023-07-03', N'Câu chuyện về Shikanoko, một chiến binh mạnh mẽ với khả năng siêu nhiên, trong hành trình tìm kiếm sự thật và công lý.', '95k'),
(N'SHY', 'Miki Bukimi', '2019-08-07', N'Teru Momijiyama, một siêu anh hùng nhút nhát với tên gọi "Shy", cố gắng bảo vệ thế giới trong khi vượt qua sự bất an của mình.', '140k'),
(N'Nhân Vật Webtoon Na Kang Lim', 'Lee Kyung-Min', '2022-03-22', N'Na Kang Lim, một nhân vật webtoon có ý thức tự nhận thức về sự tồn tại của mình trong thế giới webtoon và những gì xảy ra tiếp theo.','456k'),
(N'Shangri-La Frontier', 'Katarina',N'2017-05-19',N'Hizutome Rakurou rất thích thể loại game rác. Thử thách tiếp theo của cậu là game thánh - Shangri-la Frontier với tổng số người chơi lên tới 30 triệu người. Tập hợp đồng đội trong một thế giới rộng lớn và gặp những kẻ thù cũ trên đường đi, cậu sẽ thay đổi số phận của mọi người chơi. Truyện được chuyển thể từ tiểu thuyết nổi tiếng trên trang syosetu ni narou.','89k'),
(N'Baki', 'Keisuke Itagaki', '1991-01-27',N'con đánh cha','678k'),
(N'Grand Blue', 'Yoshioka Kimitake', '2014-10-06',N'hài đại học','89k'),
(N'Slam Dunk', 'Miki Bukimi', '1990-12-17','đánh nhau bản bóng rổ','2m'),
(N'Nhật Ký Thường Ngày Của Tiên Vương', 'Unknown', '2018-06-27 ','pokemon bản Trung Quốc','45k'),
(N'Quánh nhau học đường',N'Tuấn Khỉ','2024-7-5',N'như tên','4m'),
(N'Cô bé tóc trắng bàn bên siêu cute','tôi','2022-1-23',N'đừng chọc tôi nữa cô bé ơi','67k'),
(N'Conan2',N'Akira','1994-4-3',N'thám tử lừng danh Conan, sau khi bị biến nhỏ vẫn cứu người, chắc vậy','3m'),
(N'con thú mõ vịt này sắp đi đời rồi','Yoshika Kage','2019-11-5',N'cùng tác giả với cô gái bàn bên anya, nôpij dung nmhej nhàng qua ngày','67k'),
(N'Một doujin Touhou về Remilia x Flandre.','Minakata Sunao Nakatani Nio','2000-4-5',N'Một doujin Touhou về Remilia x Flandre.','34k'),
(N'The POOL','Sakura Gamon','2023-12-6',N'Một bộ truyện kinh dị không gian mới toanh đến từ tác giả của Ajin, Sakurai Gamon-sensei. Truyện kể về một đội lính không gian bất ngờ nhận được một tín hiệu cầu cứu đến từ khu mỏ bỏ hoang nơi mà họ sẽ phải đối đầu với những sinh vật ngoài hành tinh đáng sợ để sinh tồn.','367k'),
(N'cô công chúa xinh đẹp nhưng xấu xa','MUMO','2019-7-2',N'chưa có','9k'),
(N'Sau khi bị dũng sĩ cướp đi mọi thứ','Hahaoya','2022-7-19',N'cướp đời t, t cướp mẹ m','54k'),
(N'One-Punch','ONE','2019-4-26',N'Thế giới đầy quái vật bí ẩn xuất hiện và gây ra nhiều thảm họa. Nhân vật chính Saitama (Onepunch Man), một siêu anh hùng dễ dàng đánh bại các quái vật hay những nhân vật phản diện khác chỉ với một cú đấm.Tuy nhiên, sau khi trở thành quá mạnh, Saitama đã trở nên nhàm chán trong những trận chiến của mình và luôn cố gắng để tìm đối thủ mạnh hơn để chiến đấu.','2m'),
(N'lời tuyên án của đức mẹ','Kazuki','2024-5-16',N'Một gia đình ba người những tưởng đang hạnh phúc, cho đến khi Kiritaka, người con trai duy nhất của Nagare Mari "tự sát" vì "quá đau khổ". Cho rằng bản thân đã vô tình dồn ép con trai yêu quý, Mari toang tìm đến cái chết, nhưng không... cô vô tình phát hiện ra sự thật con trai mình đã liên tục bị bắt nạt suốt một thời gian dài bởi những con quỷ đội lốt người tại trường học. Và rồi tình thương con da diết của Mari... đã vượt ngoài tầm kiểm soát của trái tim cô.','134k'),
(N'Blue Lock','BlueONE','2022-6-16',N'chơi bóng như chơi đá, đá banh như đá đồ','67k'),
(N'gái2,5D ôi thật đẹp','TOKDO','2017-5-6',N'như tên','89k'),
(N'Naze Boku no Sekai wo Daremo Oboeteinai no ka?','Kei Sazane','2018-4-6','Naze Boku no Sekai wo Daremo Oboeteinai no ka?','56k'),
(N'The Role of the Femme Fatale','sasuke','2019-7-12',N'Học viện nữ sinh Kairan Một trường nội trú giàu lịch sử và truyền thống, chỉ dành cho trẻ mồ côi. Ở đấy có một hệ thống đặc biệt, trong đó sinh viên được cho những "các vai diễn" phù hợp với mục tiêu cá nhân của họ.','78k');
GO

INSERT INTO genres (genre_name) VALUES
('Drama'),
('Action'),
('Adventure'),
('Fantasy'),
('Comedy'),
('Horror'),
('Sci-Fi'),
('Romance'),
('Slice of life');
GO

INSERT INTO comic_genres (comic_id, genre_id) VALUES
(1, 3), (1, 6), (1, 8),
(2, 1), (2, 4), (2, 7),
(3, 2), (3, 5), (3, 9),
(4, 3), (4, 6), (4, 8),
(5, 1), (5, 4), (5, 7),
(6, 2), (6, 5), (6, 9),
(7, 3), (7, 6), (7, 8),
(8, 1), (8, 4), (8, 7),
(9, 2), (9, 5), (9, 9),
(10, 3), (10, 6), (10, 8),
(11, 1), (11, 4), (11, 7),
(12, 2), (12, 5), (12, 9),
(13, 3), (13, 6), (13, 8),
(14, 1), (14, 4), (14, 7),
(15, 2), (15, 5), (15, 9),
(16, 3), (16, 6), (16, 8),
(17, 1), (17, 4), (17, 7),
(18, 2), (18, 5), (18, 9),
(19, 3), (19, 6), (19, 8),
(20, 1), (20, 4), (20, 7),
(21, 2), (21, 5), (21, 9),
(22, 3), (22, 6), (22, 8),
(23, 1), (23, 4), (23, 7),
(24, 2), (24, 5), (24, 9),
(25, 3), (25, 6), (25, 8),
(26, 1), (26, 4), (26, 7),
(27, 2), (27, 5), (27, 9),
(28, 3), (28, 6), (28, 8),
(29, 1), (29, 4), (29, 7),
(30, 2), (30, 5), (30, 9),
(31, 3), (31, 6), (31, 8),
(32, 1), (32, 4), (32, 7),
(33, 2), (33, 5), (33, 9),
(34, 3), (34, 6), (34, 8),
(35, 1), (35, 4), (35, 7),
(36, 2), (36, 5), (36, 9),
(37, 3), (37, 6), (37, 8),
(38, 1), (38, 4), (38, 7),
(39, 2), (39, 5), (39, 9),
(40, 3), (40, 6), (40, 8),
(41, 1), (41, 4), (41, 7),
(42, 2), (42, 5), (42, 9),
(43, 3), (43, 6), (43, 8),
(44, 1), (44, 4), (44, 7),
(45, 2), (45, 5), (45, 9),
(46, 3), (46, 6), (46, 8);

GO



INSERT INTO favlist (user_id, comic_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(2, 5),
(3, 2),
(3, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 5);
GO

INSERT INTO comment (user_id, comic_id, comment_chapter, content, date_comment) VALUES
(1, 1, 1000, N'haha truyện hay thật', '2024-06-19'),
(1, 1, 1001, N'tôi thật nóng lòng đọc chương tiếp theo', '2024-06-20'),
(2, 2, 1, N'haha truyện này thú vị quá', '2014-07-07'),
(3, 3, 1, N'cảm giác rất phấn khích khi đọc truyện này', '2016-02-14'),
(4, 4, 1, N'cố lên, chờ đợi chap mới nhất', '2018-11-05'),
(5, 5, 3, N'chương này hồi hộp quá', '2018-11-05');

INSERT INTO history (user_id, comic_id, last_chapter) VALUES
(1, 1, 1004),  -- Người dùng có ID 1 đã đọc đến chương 1004 của truyện số 1
(2, 2, 5),     -- Người dùng có ID 2 đã đọc đến chương 5 của truyện số 2
(3, 3, 1),     -- Người dùng có ID 3 đã đọc đến chương 1 của truyện số 3
(4, 4, 1),     -- Người dùng có ID 4 đã đọc đến chương 1 của truyện số 4
(5, 5, 3);     -- Người dùng có ID 5 đã đọc đến chương 3 của truyện số 5

SELECT *FROM comics
WHERE title LIKE '%To%';

SELECT * FROM history

SELECT c.* 
FROM comics c 
JOIN comic_genres cg ON c.id = cg.comic_id  
JOIN genres g ON cg.genre_id = g.genre_id  
WHERE g.genre_id LIKE '2';
SELECT id, title, author, published_date FROM comics WHERE title LIKE 'Naruto'