-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 29, 2018 at 03:12 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlbh-2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `MaHD` int(11) UNSIGNED NOT NULL,
  `TongTien` int(11) NOT NULL,
  `KhachHang` int(11) NOT NULL,
  `TrangThai` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`MaHD`, `TongTien`, `KhachHang`, `TrangThai`, `Date`) VALUES
(1, 4990000, 1, 'Chưa giao', '2018-05-23 03:37:50'),
(2, 4990000, 1, 'Chưa giao', '2018-05-25 03:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `MaCTHD` int(11) UNSIGNED NOT NULL,
  `MaKH` int(11) NOT NULL,
  `MaSP` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `Gia` int(11) NOT NULL,
  `ThanhTien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `MaLoai` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenLoai` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Nhom` varchar(20) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`MaLoai`, `TenLoai`, `Nhom`) VALUES
('1', 'Balo nữ', 'Balo'),
('2', 'Balo nam', 'Balo'),
('3', 'Balo laptop', 'Balo'),
('4', 'Balo du lịch - thể thao', 'Balo'),
('5', 'Túi sách nữ', 'Túi xách'),
('6', 'Túi sách nam', 'Túi xách'),
('7', 'Túi xách du lịch - thể thao', 'Túi xách'),
('8', 'Túi sách máy ảnh', 'Túi xách');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `ID` int(11) UNSIGNED NOT NULL,
  `FileName` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL,
  `SanPham` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `MaNSX` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenNSX` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`MaNSX`, `TenNSX`) VALUES
('1', 'OEM'),
('2', 'Cartinoe'),
('3', 'Targus'),
('4', 'Cabinzero'),
('5', 'Seliux'),
('6', 'Tucano'),
('7', 'Micocah'),
('8', 'Simplecarry'),
('9', 'Crumpler');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `MaSP` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `TenSP` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Gia` int(11) NOT NULL,
  `MoTa` text COLLATE utf8_vietnamese_ci NOT NULL,
  `MaLoai` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `NSX` varchar(5) COLLATE utf8_vietnamese_ci NOT NULL,
  `LuotXem` int(11) NOT NULL,
  `NgayThemSP` datetime NOT NULL,
  `HinhAnh` varchar(256) COLLATE utf8_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`MaSP`, `TenSP`, `Gia`, `MoTa`, `MaLoai`, `NSX`, `LuotXem`, `NgayThemSP`, `HinhAnh`) VALUES
('1', 'Ba lô vải đẹp kiểu Hàn ', 250000, 'Phù hợp đi học, đi chơi,đi du lịch\r\nThiết kế thời trang trẻ trung\r\nĐường may tỉ mỉ chắc chắn\r\nDễ phối trang phục\r\nChất liệu Polyester\r\nKích thước: 28cm x 15cm x 42cm\r\nĐể được laptop 15.5ich, thích hợp cho học sinh, sinh viên\r\nNgăn chứa tiện lợi\r\nMàu sắc: xanh', '1', '1', 20, '2018-06-01 00:00:00', ''),
('10', 'Túi Xách Nam Targus CS104D', 120000, 'Túi Xách Nam Targus CS104D - Đen là món phụ kiện thời trang cao cấp dành cho quý ông trẻ trung, sành điệu. Sản phẩm được gia công tỉ mỉ và tinh xảo giúp gia tăng tuổi thọ dài lâu khi sử dụng.\r\nChất liệu da bò cao cấp đã qua quy trình xử lý kỳ công giúp cho bề mặt sản phẩm luôn có độ bóng đẹp hoàn hảo.\r\nBề mặt da không bị rạn nứt hay bong tróc trong suốt thời gian sử dụng.\r\nKhóa kéo không gỉ, hoạt động trơn tru dễ dàng.\r\nThiết kế nhiều ngăn chứa với kích cỡ khác nhau để bạn có thể mang theo nhiều vật dụng cá nhân mỗi khi ra ngoài: Ipad, điện thoại, sổ tay, tài liệu, tai nghe, pin dự phòng,...\r\nDễ dàng kết hợp cùng quần Jeans, Kaki, áo Sơ Mi, áo thun,... nhằm mang lại vẻ ngoài lịch thiệp và sang trọng cho đấng mày râu.\r\nKích thước:  38 x 28  x 6 cm\r\nMàu sắc: Đen', '2', '3', 33, '2018-06-13 00:00:00', ''),
('11', 'Balo Targus TSB90603-70', 1400000, 'Bạn là người ưa thích khám phá những trải nghiệm mới. Một chiếc balo du lịch là vô cùng cần thiết. Với thiết kế vượt trội với việc kết hợp đựng cả máy tính xách tay, balo Targus TSB90603-70 sẽ mang đến cho bạn sự lựa chọn hoàn toàn chưa bao giờ có, sự lựa chọn mới mẻ sẽ mang đến cho bạn mợt chuyến du lịch đầy thú vị.\r\nChất liệu polyester cao cấp có độ bền cao và khả năng chống thấm rất tốt ở phần mặt và phần đáy, bạn có thể thoải mái mang theo bất cứ nơi đâu hay hoàn cảnh nào.\r\nThiết kế chắc chắn với chất liệu cao cấp,màu sắc thời trang trẻ trung, phá vỡ tất cả cấu trúc cơ bản và tăng thêm sự tinh tế đến từng milimet.\r\nTúi được gia công tỉ mỉ với nhiều ngăn đựng tiện dụng không chỉ đựng laptop 15.6 inch mà có thể đựng một số đồ cá nhân khi đi xa hoặc đi công tác.\r\nKích thước: 42.5 x 29 x 17 cm\r\nMàu sắc: Tím', '2', '3', 56, '2018-06-15 00:00:00', ''),
('12', 'BL Seliux F2 Banshee Backpack', 569000, 'Với xu thế năng động hiện nay, các bạn trẻ thường lựa chọn cho mình một chiếc balo thời trang đặc biệt để khẳng định phong cách riêng. Balo Seliux F2 Banshee Backpack được thiết kế bởi ý tưởng độc đáo kết hợp với sự phối màu sáng tạo, mang lại sự trẻ trung, cá tính cho người sử dụng. Chiếc balo có một ngăn chính cho phép bạn mang theo sách vở, quần áo với diện tích rộng, ngăn phụ, và túi bên hông dùng để đựng những vật dụng nhỏ bé một cách tiện dụng.\r\nChất liệu vải cao cấp: vải mặt chính 1000D Canvas hỗ trợ chống thấm, vải lót bên trong 420D Nylon Fluorescent dày chắc, cứng cáp, chống bám bụi, chống ẩm mốc, đem lại độ bền cao.\r\nKích thước: 44 x 30,5 x 12 cm\r\nMàu sắc: Đen/Xám', '2', '5', 60, '2018-06-05 00:00:00', ''),
('123', 'abc', 200000, 'abc', '1', '1', 0, '0000-00-00 00:00:00', ''),
('13', 'Túi Xách Seliux M5 Grant', 300000, 'Seliux M5 Grant là dòng sản phẩm túi đeo chéo cao cấp, thời trang phù hợp cho iPad Air. Túi có 4 màu sắc thời trang, thiết kế tiện lợi với dây quai to bản thay đổi chiều dài linh hoạt, nhiều ngăn dễ dàng sử dụng. Túi Seliux M5 Grant được làm từ chất liệu 1000D Checken Tex SupremeTM bền màu, khả năng kháng nước tốt.\r\nThiết kế của túi Seliux M5 Grant S Black khá nhỏ gọn, nhẹ nhàng, bạn có thể đeo chéo qua vai hoặc đeo 1 bên vai với khả năng nới dài của dây đeo sẽ rất dễ dàng tạo thành kiểu đeo túi như ý muốn.\r\nThiết kế gồm: 1 ngăn chính và 1 ngăn phụ ở mặt sau của túi.\r\nKích thước: 27 x 19 x 7 cm\r\nMàu sắc: Đỏ, Xanh Navy, Đen', '2', '5', 40, '2018-06-05 00:00:00', ''),
('14', 'Túi Đeo Chéo Nữ NCS088 ', 300000, 'Túi Đeo Chéo Nữ NCS088 được may từ chất liệu PU mềm mại, chắc chắn, chất liệu này khó trầy xước, dễ lau chùi khi vấy bẩn cho bạn thoải mái sử dụng lâu dài.\r\nTúi có ngăn chính rộng rãi giúp bạn có thể linh hoạt đựng được nhiều vật dụng khác nhau.\r\nThiết kế trẻ trung, tông màu trang nhã vừa bền màu vừa dễ kết hợp cùng nhiều kiểu trang phục khác nhau.\r\nĐường may tỉ mỉ và chắc chắn, không chỉ mang đến độ bền mà còn mang đến tính thẩm mỹ cao, tinh tế.\r\nPhần dây đeo phù hợp với mọi dáng người, tạo sự thoải mái và tiện lợi.\r\nMang đến sự nổi bật và trẻ trung cho bạn, khiến bạn cảm thấy tự tin hơn mỗi khi đi ra phố. Có thể phối cùng bộ trang phục quần kaki, áo sơ mi, quần bò, áo phông, giày lười…\r\nKích thước: 15 x 9 x 18 cm\r\nMàu sắc: Hồng', '1', '7', 55, '2018-06-07 00:00:00', ''),
('15', 'TX Micocah Postman Small', 2380000, 'Túi máy ảnh Micocah Postman Small là một dạng túi Messenger được thiết kế theo phong cách cổ điển nhưng vẫn giữ được nét tinh thế và sang trọng trong một kiểu dáng túi nhỏ gọn. Ở dòng túi này, bạn có thể để được khá nhiều vậy dụng đi kèm theo bộ máy.\r\nDây đeo túi được làm bằng sợi acrylic có tính năng chống trượt và khả năng phâm bổ trọng lượng trên túi giúp thoài mái trong quá trình duy chuyển.\r\nTúi có nắp chống bụi với chốt khóa nam châm được thiết kế tinh tế với chất liệu vải canvas, có thể vệ sinh khi túi bẩn. Các chi tiết phối viền được làm bằng da từ Ý.\r\nKích thước: 25 x 19 x 11 cm, phía sau Herringbone Postman Small S Olive có một ngăn nhỏ có thể để vừa 1 cái máy tính bảng ipad mini , ngăn chính thiết kế để giữ ổn định thân máy ảnh mirroless hoặc tương đương, và đi kèm theo 1 lens kit, mặt trước túi xách có cách túi nhỏ có thể để thẻ nhớ, pin dự trự, giữa các ngăn có các mút mềm chống va đập hiệu quả.\r\nMàu sắc: Olive', '4', '7', 70, '2018-06-07 00:00:00', ''),
('16', 'Túi Happy Day trẻ trung - T438', 180000, 'Chất liệu: Da PU\r\nKích thước: 24 x 17 x 8cm\r\nMàu sắc: Xanh, Hồng\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm\r\nTúi Happy Day trẻ trung - T438 Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng.', '1', '1', 90, '2018-06-14 00:00:00', ''),
('17', 'Cartinoe VIDA1136 London Style', 749000, 'Thiết kế đơn giản, trẻ trung, màu sắc tươi sáng.\r\nĐường may tinh tế, không bị lộ đường chỉ, mặt trước nổi bật với hai hộp dây kéo kim loại, đem lại vẻ ngoài đơn giản mà không kém phần sang trọng, tinh tế.\r\nChất liệu vải lụa Nylon cao cấp có khả năng chống nước hiệu quả, giúp bảo vệ tốt hơn cho máy tính và các vật dụng hàng ngày của bạn.\r\nKích thước 41 x 31 x 14 cm bao gồm: 1 ngăn chính đựng vừa chiếc Macbook, máy tính lên tới 14\" và các ngăn phụ để đựng các phụ kiện và đồ vật khác đi kèm như sạc, dây cáp, thẻ nhớ, ổ cứng di động, bút.... Bên trong ngăn chính đều được trang bị chống shock, giúp bảo vệ laptop của bạn tránh bị va đập mạnh.\r\nMàu sắc: Xanh Navy', '3', '2', 65, '2018-06-14 00:00:00', ''),
('18', 'Túi Xách Cartinoe 8221', 690000, 'Cartinoe 8221 là dòng sản phẩm túi xách Laptop thời trang, cao cấp của thương hiệu Cartinoe – Đức. Túi xách có thiết kế thích hợp cho Laptop 13.3’’, cộng thêm nhiều ngăn phụ hỗ trợ sắp xếp đồ đạc. Túi xách Cartinoe 8221 được làm từ chất liệu Polyester kết hợp vải lót Nylon 150D bên trong ngăn hạn chế thấm nước tốt, bền màu với thời gian.\r\nThiết kế bao gồm: 1 ngăn chính, 2 ngăn phụ ở mặt trước và sau.\r\nThiết kế thời trang, màu sắc thích hợp cho cả nam và nữ sử dụng, gọn nhẹ, đảm bảo thuận lợi trong việc đeo vai và xách trên tay. Màu sắc của túi xách sang trọng, dễ kết hợp với thời trang của mỗi cá nhân người sử dụng, tạo cảm giác hài hòa, năng động.\r\nKích thước: 35 x 26.5 x 6.5 cm\r\nMàu sắc: Xanh dương, Đen', '2', '2', 30, '2018-06-15 00:00:00', ''),
('19', 'TX Crumpler Muli Messenger', 879000, 'Khóa kéo : Crumpler\r\nLaptop : 15\'\'\r\nThiết kế gồm 1 ngăn chính và 2 ngăn phụ.\r\n1 Ngăn chính lớn cho phép đựng quần áo , sách vở với diện tích lớn.\r\n1 ngăn máy tính xách tay 15\'\'.\r\n1 ngăn khóa kéo ở mặt trước.\r\n1 ngăn khóa kéo ở mặt sau\r\nNệm êm và thoáng khí ở cả lưng và mặt ốp của dây đeo vai.', '2', '9', 35, '2018-06-26 00:00:00', ''),
('2', 'Túi da trẻ trung - T551', 120000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng\r\nTúi da trơn trẻ trung - T551\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, nâu\r\nKích thước: 18 x 15 x 7cm\r\nStyle: KoreaCông dụng: Đi chơi, đi làm', '1', '1', 15, '2018-06-01 00:00:00', ''),
('20', 'Túi xách Cabinzero F27349', 3100000, 'Túi Cabinzero chính hãng F27349 được thiết kế theo dạng tote giúp bạn có thể mang theo nhiều đồ dùng cần thiết.\r\nSử dụng chất liệu da Safiano chủ đạo mang đến cho sản phẩm sự sang trọng.\r\nKích thước lớn mang đến cho bạn sự tiện lợi khi cần lưu trữ nhiều.\r\nLogo bằng kim loại được khắc laser sắc sảo giúp cho túi Cabinzero F27349 nổi bật hơn.\r\nThích hợp cho bạn sử dụng để đi làm, mua sắm hay ăn uống…cùng những người mà bạn yêu mến.\r\nKích thước: 37 x 30 x 12cm\r\nMàu sắc: Kem, Hồng', '1', '4', 80, '2018-06-20 00:00:00', ''),
('21', 'Túi hình quyển sách độc đáo', 120000, 'Chất liệu: Da PU\r\nMàu sắc : trắng, đen\r\nKích thước: 18 x 14 x 7 cm\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm\r\nTrong thế giới thời trang của phái đẹp, chiếc túi luôn chiếm một vị trí quan trọng. Từ những cô nàng bình thường nhất cho tới những ngôi sao hàng đầu, tất cả đều chia sẻ một tình yêu vĩ đại với những chiếc túi\r\nChiếc túi xách hợp dáng người, hợp màu sắc làm tăng vẻ đẹp của trang phục bạn mặc và khẳng định ấn tượng của bạn trong mắt người đối diện. Tuy nhiên, không phải ai cũng biết chọn một chiếc túi xách thực sự phù hợp với phom cơ thể của mình.\r\nMang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng. Chúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp. \r\nVà nếu bạn cũng đang đi tìm một chiếc túi có thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ', '1', '1', 70, '2018-06-20 00:00:00', ''),
('22', 'Tucano Laptop Backpack', 749000, 'Tucano Laptop Backpack - Dòng sản phẩm balo laptop cao cấp mới nhất của thương hiệu K Swiss đến từ Korea. Balo làm từ chất liệu Polyester chống thấm nước cực tốt. Balo Tucano mang đến cho bạn một chiếc balo vừa thời trang, vừa đảm bảo chức năng chống sốc, bảo vệ an toàn cho các thiết bị như: laptop, Macbook 15.6’’..\r\nChất liệu: Hi -Tech hạn chế thấm nước qua lớp vải làm ảnh hưởng đến thiết bị và đồ đạc chứa bên trong.\r\nThiết kế gồm: 1 ngăn chính và 2 ngăn phụ.\r\nKích thước: 47 x 32 x 18 cm\r\nPhù hợp với nhiều đối tượng người dùng như: học sinh, sinh viên, nhân viên văn phòng…\r\nMàu sắc: vàng, xám', '3', '6', 77, '2018-06-21 00:00:00', ''),
('23', 'Balo LadyBug Backpack', 300000, 'Một chiếc balo mini và tiện dụng được các bạn gái rất ưa chuộng trong thời gian gần đây. Balo LadyBug Backpack với màu sắc đa dạng sẽ làm nổi bật cá tính của bạn, giúp thay thế những chiếc túi đeo chéo nhàm chán hay ví cầm tay bất tiện.\r\nThiết kế nhỏ gọn và siêu nhẹ, kích thước kích thước 35 x 26 x 13 cm.\r\nChất liệu Polyester chống thấm nước tốt nên bạn hoàn toàn yên tâm sử dụng chúng dưới thời tiết nắng mưa mà không lo bị hư hại đồ đạc bên trong.\r\nVới kết cấu 1 ngăn chính và 2 ngăn phụ linh hoạt giúp bạn có thể đựng những đồ vật nhỏ mà không sợ bị lẫn hay để quên ở đâu đó.\r\nPhù hợp trong các hoạt động khác nhau như: Đi học, đi chơi, đi dã ngoại...\r\nMàu sắc: Hồng, Turquoise, Xanh dương', '1', '3', 78, '2018-06-14 00:00:00', ''),
('24', 'Balo The Ives Backpack', 600000, 'Cartinoe The Ives Backpack là một trong những sản phẩm nổi tiếng của của thương hiệu Mikkor nhờ những đặc tính ưu việt kết hợp với thiết kế trẻ trung, năng động. Cartinoe The Ives Backpack có khả năng chống thấm nước tốt nhờ chất liệu Kodura 1000D và Polyester 210D. Balo với tông màu trung tính, không chỉ giúp bạn thể hiện phong cách thời trang cá tính mà còn rất dễ dàng khi phối đồ. Balo có thể kết hợp cùng nhiều trang phục và các phụ kiện khác để trở nên thật nổi bật.\r\nThiết kế với một ngăn chính lớn và 2 ngăn hộp mặt trước; ngăn chính rộng rãi đựng được nhiều đồ dùng hàng ngày; 2 hộp trước với rất nhiều ngăn nhỏ đựng phụ kiện như Ipad, tai nghe, điện thoại, chìa khoá, xạc máy...bên ngoài tích hợp với 2 ngăn đựng bình nước.\r\nKích thước 44cm x 29cm x 16cm\r\nMàu sắc: Đỏ', '2', '2', 65, '2018-06-14 00:00:00', ''),
('25', 'Túi bling bling viền ngọc trai', 149000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng. Chúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp.\r\nVà nếu bạn cũng đang đi tìm một chiếc túi có thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ của\r\nTúi bling bling viền ngọc trai tua rua - T201\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, hồng, vàng\r\nKích thước: 19 x 15 x 8cm\r\nStyle: Korea\r\n', '1', '1', 58, '2018-06-12 00:00:00', ''),
('3', 'Túi nhũ kim tuyến siêu sang', 160000, 'Chất liệu: da\r\n Kích thước: 20 x 5x 7cm\r\nMàu sắc: Bạc, Xanh, Đen\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm\r\nTúi nhũ kim tuyến siêu sang - T478 mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng. Chúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp.', '1', '1', 25, '2018-06-02 00:00:00', ''),
('4', 'TX Seliux G3 Widow Duffle', 569000, 'Seliux G3 Widow Duffle là dòng sản phẩm túi xách thể thao – du lịch của thương hiệu Seliux. Túi xách Seliux G3 Widow Duffle thích hợp cho các bạn thường xuyên hoạt động thể thao hoặc đi du lịch/ công tác ngắn ngày chỉ cần đem theo ít đồ. Túi được làm từ chất liệu G1000 và lớp vải lót 210D Nylon hạn chế thấm nước tốt. Túi có kiểu dáng năng động, màu sắc hiện đại, đặc biệt có ngăn đựng giày được thiết kế riêng biệt.\r\nThiết kế gồm: 1 ngăn chính và 3 ngăn phụ.\r\nKích thước: 48 x 22 x 22 cm\r\nMàu sắc: Đen, Xanh Navy, Đỏ', '3', '5', 50, '2018-06-02 00:00:00', ''),
('5', 'Tucano BKLOOP15_BK', 720000, 'Tucano BKLOOP15_BK là dòng sản phẩm balo laptop cao cấp của thương hiệu Tucano đến từ nước Ý. Balo làm từ chất liệu Polyester hạn chế thấm nước cực tốt. Balo Tucano mang đến cho bạn một chiếc balo vừa thời trang, vừa đảm bảo chức năng chống sốc, bảo vệ an toàn cho các thiết bị như: Notebook 15.6’’, Ultrabook 15.6’’ và máy tính xách tay từ 15’’ đến 15.6’’.\r\nThiết kế gồm: 1 ngăn chính và 1 ngăn phụ\r\nKích thước: 44.5 x 29.5 x 12 cm\r\nPhù hợp với nhiều đối tượng người dùng như: Học sinh, sinh viên, công nhân viên…\r\nMàu sắc: Xám', '3', '6', 50, '2018-06-01 00:00:00', ''),
('6', 'Balo Simplecarry H3', 749000, 'Một chiếc ba lô luôn là một trong những phụ kiện không thể thiếu trong các hoạt động như đi học hay đi chơi, dã ngoại. Với cách kết hợp màu sắc hài hòa và kiểu dáng thời trang, hiện đại, Balo Simplecarry H3 chính là người bạn đồng hành đầy cá tính dành cho bạn.\r\nChất liệu Polyester trượt nước cao cấp, hỗ trợ chống thấm, vải lót bên trong dày chắc, cứng cáp, chống bám bụi, chống ẩm mốc, đem lại độ bền cao.\r\nKích thước : 44 x 32 x 18 cm bao gồm 1 ngăn chính, 3 ngăn phụ. Mặt trước là 2 ngăn nhỏ với đầu khóa kéo, đính logo thương hiệu SimpleCarry.\r\nMàu sắc: Xanh dương/Xanh Navy, Xám đậm/Xám, Đỏ đậm/Xám', '1', '8', 30, '2018-06-15 00:00:00', ''),
('7', 'Túi Xách Simplecarry Gymbag', 495000, 'Sau những giờ làm việc căng thẳng, loanh quanh trong văn phòng công ty, chúng ta cần vận động, nâng cao sức khỏe. Khi bạn muốn có buổi luyện tập hiệu quả và chuyên nghiệp tại phòng tập, hãy mang theo túi thể thao Simplecarry Gymbag – một sản phẩm hoàn hảo được thiết kế riêng để giúp bạn đựng đồ thể thao khi đi tập.\r\nĐược làm từ chất liệu cao cấp, với thành phần Polyester trượt nước, giúp sản phẩm có khả năng chống nước cao, độ bền lâu, hạn chế việc rút sợi vải hay sờn, ố màu.\r\nTúi gồm 1 ngăn chính lớn, 1 ngăn bên trái có ngăn đựng điện thoại, vật dụng nhỏ và 1 bên phải là ngăn đựng giày, hoặc áo mưa.\r\nKích thước 23 x 42 x 23 cm\r\nMàu sắc: Xám, Xanh Navy, Đen', '3', '8', 60, '2018-06-13 00:00:00', ''),
('8', 'TX Tucano Contatto Large', 1280000, 'Tucano Contatto Large là là một trong những dòng túi xách nhỏ gọn được thiết kế chuyên nghiệp dành riêng để bảo vệ máy ảnh cá nhân, chiếc túi xách với thiết kế đa dụng, sẽ cùng bạn trải nghiệm những chuyến phượt hay du lịch tràn ngập những điều thú vị.\r\nĐược làm từ những chất liệu bền đẹp và có có khả năng chống thấm nước cao, chống bám bụi cho khả năng bảo vệ máy ảnh, ống kính và các vật dụng khác của bạn luôn ở tình trạng khô ráo và an toàn tối đa.\r\nCác mặt bên của túi được lót lớp đệm dày, mềm, dễ lau chùi tạo cảm giác êm ái cho máy đồng thời tối ưu hóa khả năng chống sốc, cho bạn cảm giác yên tâm khi cất giữ máy.\r\nKích thước: 38 x 23 x 12 cm\r\nMàu sắc: Xám', '4', '6', 55, '2018-06-06 00:00:00', ''),
('9', 'Balo Cabinzero Mini 28L', 1280000, 'Balo dần là phụ kiện thay thế cho những chiếc cặp sách cồng kềnh hay những chiếc túi đeo chéo nhỏ bé. Một chiếc balo được thiết kế ưu việt và thời trang sẽ làm hài lòng mọi khách hàng khó tính nhất. Cabinzero Mini 28L CZ081206 là sự kết hợp hoàn hảo 2 trong 1 giữa một chiếc túi chuyên cho hành lý xách tay và một chiếc va li kéo. Ngoài ra, balo còn tích hợp vi mạch điện tử lưu trữ thông tin hành lý của bạn -luggage trackers – bởi OkoBan giúp bạn phần nào đó tìm lại hành lý khi thất lạc tại sân bay.\r\nChất liệu polyester cao cấp có độ bền cao và khả năng chống thấm rất tốt ở phần mặt và phần đáy của balo Cabinzero Mini 28L bạn có thể thoải mái mang theo bất cứ nơi đâu hay hoàn cảnh nào.\r\nThiết kế chắc chắn, balo có màu tím kết hợp với điểm nhấn khuy màu đen thời trang trẻ trung giúp cho bạn thêm cá tính và năng động, balo được gia công tỉ mỉ với nhiều ngăn đựng tiện dụng khi đi xa hoặc đi công tác.\r\nKích thước: 42x32x25 cm\r\nMàu sắc: Tím', '4', '4', 20, '2018-06-13 00:00:00', ''),
('SP026', 'TX OEM Soho Slim 14\"', 990000, 'OEM Soho Slim 14\" là dòng túi xách cao cấp, mang phong cách đơn giản, hiện đại của thương hiệu OEM– Singapore. Túi xách thích hợp với thiết bị Laptop 14’’ trở xuống và dành cho nhiều đối tượng người sử dụng. Túi xách được làm từ chất liệu Nylon hạn chế thấm nước tốt. Kiểu dáng túi xách gọn nhẹ với 4 ngăn chứa đồ và hai kiểu quai hỗ trợ.\r\nTúi xách thích hợp cho những nhiều đối tượng người sử dụng và linh hoạt trong các môi trường hoạt động khác nhau như: Đi làm, đến trường, các chuyến công tác…\r\nThiết kế gồm: 1 ngăn chính, 2 ngăn phụ phía trước và 1 ngăn phía sau.\r\nKích thước: 38 x 5 x 37 cm\r\nMàu sắc: Đen', '1', '1', 45, '2018-06-20 00:00:00', ''),
('SP027', 'Túi bling bling tua rua', 169000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng. Chúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp. \r\nVà nếu bạn cũng đang đi tìm một chiếc túi có thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ của \r\nTúi lấp lánh bling bling tua rua\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, hồng\r\nKích thước: 19 x 15 x 8cm\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm', '1', '1', 15, '2018-06-04 00:00:00', ''),
('SP028', 'Túi da xước siêu xinh', 120000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, hồng\r\nKích thước: 19 x 15 x 8cm\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm', '1', '8', 75, '2018-06-23 00:00:00', ''),
('SP029', 'Túi mini da siêu chất', 100000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng. Chúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp.\r\nVà nếu bạn cũng đang đi tìm một chiếc túi có thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ của\r\nTúi mini da lì siêu chất - T552\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, đỏ, xám, rêu\r\nKích thước: 21 x 15 x 8cm\r\nStyle: Korea', '1', '1', 65, '2018-06-16 00:00:00', ''),
('SP030', 'Túi mini bag - T555', 120000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng\r\nTúi da trơn trẻ trung - T551\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, nâu\r\nKích thước: 18 x 15 x 7cm\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm', '1', '1', 79, '2018-06-11 00:00:00', ''),
('SP031', 'Balo Brown Noser Backpack', 499000, 'Brown Noser có kiểu dáng đẹp, vuông vắn khá phù hợp với vóc dáng người Việt Nam.\r\n- Chất vải rất sang trọng được may chắc chắn từng đường chỉ. \r\nBalo mang được laptop và khá nhiều đồ đạc cá nhân khác như Ipad, điện thoại, máy ảnh, sách vở, tài liệu...\r\n- Kích thước: 43 x 34 x 26.5 cm\r\n- Vải 1000d Chicken Tex Supreme™ hyper performance tuyệt đối chống thấm nước.\r\n- Ngăn đựng laptop riêng biệt, bảo vệ lappy 15,14,13\\\"\r\n- Rất nhiều ngăn nhỏ tiện lợi đựng mobile, ipod, máy tính...\r\n', '4', '9', 84, '2018-06-08 00:00:00', ''),
('SP032', 'Balo Roady Laptop Navy', 499000, 'Balo Crumpler Roady Navy được thiết kế với những đường nét cơ bản khẳng định được sự mạnh mẽ nhưng vẫn thể hiện được sự tinh tế qua những đường may sắc sảo. Gây ấn tượng cho người dùng từ cái nhìn đầu tiên qua sự kết hợp giữa thiết kế và sắc đen sang trọng. Đây sẽ là sự lựa chọn hoàn hảo của bạn và người thân.\r\nChất liệu vải 1000D Chicken Tex Supreme ™ Nylon được lót lớp Ripstop chống thấm tối ưu, vải lót bên trong dày chắc, cứng cáp, chống bám bụi, chống ẩm mốc, đem lại độ bền cao.\r\nCông nghệ may tiên tiến tạo ra những lớp mút đàn hồi ở ngăn chứa bên trong, nếu đựng laptop thì có tác dụng chống sốc, bảo vệ an toàn cho Laptop 15\'\' của bạn.\r\nDây đeo và quai xách tay chắc chắn\r\nKích thước nhỏ gọn 44 x 30.5 x 12 cm.', '2', '9', 30, '2018-06-19 00:00:00', ''),
('SP033', 'TX Betty Blue Sling', 879000, 'Túi xách Crumpler Betty Blue Sling là một túi vai linh hoạt với chỗ cho một chiếc máy tính bảng mini hoặc lớn hơn của iPad. Nắp ngăn có một nắp clip nam châm giữ hàng ngày quan trọng của bạn nhanh chóng có thể truy cập. Giữ mọi thứ bằng cách cất an toàn điện thoại thông minh, chìa khóa hoặc máy nhắn tin cổ điển vào trong một túi nhỏ gọn bên trong.\r\nTúi xách Crumpler Betty Blue Sling được làm từ chất liệu vải Denim phủ, da thật chi tiết, mịn 210T Ripstop Nylon lót, có khả năng chống thấm nước tối ưu, vải lót bên trong dày chắc, cứng cáp, chống bám bụi, chống ẩm mốc, đem lại độ bền cao.\r\nDây đeo và quai xách tay chắc chắn.\r\nKích thước: 27x31x9cm\r\n', '2', '9', 25, '2018-06-26 00:00:00', ''),
('SP034', 'TX Proper Roady Photo Sling ', 549000, 'Túi xách Proper Roady Photo Sling là dòng sản phẩm bán chạy hiện nay của thương hiệu Crumpler với thiết kế đơn giản mà không kém phần trẻ trung, cùng chất liệu vải cao cấp, đang được rất nhiều bạn trẻ yêu thích tin dùng. Với chiếc túi này, bạn có thể dễ dàng phối hợp cùng nhiều loại trang phục, thích hợp cho mọi hoàn cảnh như đi học, đi chơi hay đi dã ngoại, thể thao...\r\nTúi xách Crumpler Proper Roady Photo Sling 7500 M Navy được làm từ chất liệu vải 1000D Chicken Tex Supreme ™ Nylon, có khả năng chống thấm nước tối ưu, vải lót bên trong dày chắc, cứng cáp, chống bám bụi, chống ẩm mốc, đem lại độ bền cao.\r\nKích thước: 35 x 26 x 15 cm.', '2', '9', 10, '2018-06-26 00:00:00', ''),
('SP035', 'Seliux M6 Nighthawk Sling', 415000, 'Seliux M6 Nighthawk Sling là dòng sản phẩm balo một quai thời trang của thương hiệu Seliux. Balo được làm từ chất liệu 1000D Chicken Tex và vải lót 420D Nylon hạn chế thấm nước cực tốt. Balo phù hợp trong nhiều môi trường hoạt động khác nhau và hợp lý khi đựng iPad Pro.', '2', '5', 56, '2018-06-26 00:00:00', ''),
('SP036', 'Túi tua rua trẻ trung', 120000, 'Túi tua rua trẻ trung - T472 Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng.\r\nVà nếu bạn cũng đang đi tìm một chiếc túi có thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ của Túi mắc tua dua trẻ trung - T472\r\nThông tin sản phẩm:\r\nChất liệu: Da PU\r\nMàu sắc : đen, trắng\r\nKích thước: 18 x 16 x 7cm\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm', '1', '1', 50, '2018-06-26 00:00:00', ''),
('SP037', 'Túi da xước  - T499', 120000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, hồng\r\nKích thước: 19 x 15 x 8cm\r\nStyle: Korea\r\nCông dụng: Đi chơi, đi làm', '1', '1', 65, '2018-06-14 00:00:00', ''),
('SP038', 'Túi lấp lánh bling bling', 300000, 'Mang tới cho các cô nàng sự thoải mái khi đi dạo phố hoặc hẹn hò bè bạn vì không phải cầm mang những vật dụng linh tinh, chiếc túi xách đã trở thành người bạn không thể thiếu các nàng. Chúng có sự đa dạng từ kiểu cách tới màu sắc, size…tùy theo nhu cầu của mình mà các nàng lựa chọn một sản phẩm thích hợp. \r\nVà nếu bạn cũng đang đi tìm một chiếc túi có thể thể hiện được cá tính của bản thân một cách rõ nét nhất và đang... lạc lối, thì hãy cùng khám phá và cảm nhận những nét đẹp và quyến rũ của \r\nTúi lấp lánh bling bling tua rua\r\nThông tin sản phẩm:\r\nChất liệu: da PU\r\nMàu sắc : Đen, hồng\r\nKích thước: 19 x 15 x 8cm\r\nStyle: Korea', '1', '1', 30, '2018-06-15 00:00:00', ''),
('SP039', 'Balo Kakashi  Backpack', 749000, 'Một chiếc balo mini và tiện dụng được các bạn gái rất ưa chuộng trong thời gian gần đây. Balo Kakashi LadyBug Backpack với màu sắc đa dạng sẽ làm nổi bật cá tính của bạn, giúp thay thế những chiếc túi đeo chéo nhàm chán hay ví cầm tay bất tiện.\r\nThiết kế nhỏ gọn và siêu nhẹ, kích thước kích thước 35 x 26 x 13 cm.\r\nChất liệu Polyester chống thấm nước tốt nên bạn hoàn toàn yên tâm sử dụng chúng dưới thời tiết nắng mưa mà không lo bị hư hại đồ đạc bên trong.\r\nVới kết cấu 1 ngăn chính và 2 ngăn phụ linh hoạt giúp bạn có thể đựng những đồ vật nhỏ mà không sợ bị lẫn hay để quên ở đâu đó.\r\nPhù hợp trong các hoạt động khác nhau như: Đi học, đi chơi, đi dã ngoại...\r\nMàu sắc: Hồng, Turquoise, Xanh dương', '1', '8', 65, '2018-06-20 00:00:00', ''),
('SP040', 'Balo Mikkor TIB 005', 569000, 'Mikkor The Ives Backpack TIB 005 M Red là một trong những sản phẩm nổi tiếng của của thương hiệu Mikkor nhờ những đặc tính ưu việt kết hợp với thiết kế trẻ trung, năng động. Mikkor The Arthur Backpack có khả năng chống thấm nước tốt nhờ chất liệu Kodura 1000D và Polyester 210D. Balo với tông màu trung tính, không chỉ giúp bạn thể hiện phong cách thời trang cá tính mà còn rất dễ dàng khi phối đồ. Balo có thể kết hợp cùng nhiều trang phục và các phụ kiện khác để trở nên thật nổi bật.\r\nThiết kế với một ngăn chính lớn và 2 ngăn hộp mặt trước; ngăn chính rộng rãi đựng được nhiều đồ dùng hàng ngày; 2 hộp trước với rất nhiều ngăn nhỏ đựng phụ kiện như Ipad, tai nghe, điện thoại, chìa khoá, xạc máy...bên ngoài tích hợp với 2 ngăn đựng bình nước.\r\nKích thước 44cm x 29cm x 16cm\r\nMàu sắc: Đỏ', '1', '3', 55, '2018-06-20 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('0lH1iYEXzy0DqtFNjd-CbWRSaovRuCxx', 1530270698, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('bzz2YlvV1oMnkS-_6eP83jzp8TWbvlrT', 1530205630, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('fZf03q5MfdipUtQU00d583hTqpez8FdU', 1530201443, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `MaKH` int(11) UNSIGNED NOT NULL,
  `TenKH` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `SDT` varchar(11) COLLATE utf8_vietnamese_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8_vietnamese_ci NOT NULL,
  `Password` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `Permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`MaKH`, `TenKH`, `SDT`, `Email`, `DiaChi`, `Password`, `Permission`) VALUES
(14, 'Mrbuoi', '', 'mrbuoi@gmail.com', '', '123456', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`MaHD`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`MaCTHD`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`MaLoai`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`MaNSX`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`MaSP`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`MaKH`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `MaHD` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `MaCTHD` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `MaKH` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
