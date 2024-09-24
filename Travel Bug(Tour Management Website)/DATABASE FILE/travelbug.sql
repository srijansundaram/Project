

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `travelbug`
--

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE IF NOT EXISTS `tour` (
`tour_id` int(20) NOT NULL,
  `tour_name` varchar(50) NOT NULL,
  `tour_time` varchar(50) NOT NULL,
  `tour_img` varchar(50) DEFAULT 'NA',
  `tour_it` varchar(50) DEFAULT 'NA',
  `tour_price` float NOT NULL,
  `tour_availability` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`tour_id`, `tour_name`, `tour_time`, `tour_img`, `tour_it`, `tour_price`, `tour_availability`) VALUES
(1, 'Corbett National Park', '5 Nights - 6 Days', 'img/tiger.jpg', 'img/it1.jpg', 45500, 'yes'),
(2, 'Nameri & Kaziranga Wildlife Tour', '5 Nights - 6 Days', 'img/assam.jpg', 'img/it2.jpg', 54700, 'yes'),
(3, 'The Spiti Valley Tour', '7 Nights - 8 Days', 'img/spiti.jpg', 'img/it3.jpg', 64000, 'yes'),
(4, 'VALLEY OF FLOWERS TREK', '7 Nights - 8 Days', 'img/flower.jpg', 'img/it4.jpg', 60500, 'yes'),
(5, 'Hornbill Festival Special', '6 Nights - 7 Days', 'img/hornbill.jpg', 'img/it5.jpg', 68500, 'yes'),
(6, 'Gangotri-Gomukh-Tapovan Trek', '10 Nights - 11 Days', 'img/gangotri.jpg', 'img/it6.jpg', 55000, 'yes'),
(7, 'Tryst With Tulips - Offbeat Kashmir', '5 Nights - 6 Days', 'img/kashmir.jpg', 'img/it7.jpg', 65700, 'yes'),
(8, 'Sri-Lanka Eco Tour', '7 Nights - 8 Days', 'img/srilanka.jpg', 'img/it8.jpg', 98600, 'yes'),
(9, 'Bhutan - Land of the Thunder Dragon!', '6 Nights - 7 Days', 'img/bhutan.jpg', 'img/it9.jpg', 73500, 'yes'),
(10, 'TREASURES OF MADAGASCAR', '6 Nights - 7 Days', 'img/mada.jpg', 'img/it10.jpg', 205000, 'yes'),
(11, 'Kenya Migration Safari', '5 Nights - 6 Days', 'img/kenya.jpg', 'img/it11.jpg', 270000, 'yes'),
(12, 'Offbeat Garhwal', '6 Nights - 7 Days', 'img/garhwal.jpg', 'img/it12.jpg', 42470, 'yes');

-- --------------------------------------------------------

-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `client_username` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(25) NOT NULL,
  `client_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `client_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_username`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_password`) VALUES
('harry', 'Harry Den', '9876543210', 'harryden@gmail.com', '2477  Harley Vincent Drive', 'password'),
('jenny', 'Jeniffer Washington', '7850000069', 'washjeni@gmail.com', '4139  Mesa Drive', 'jenny'),
('tom', 'Tommy Doee', '900696969', 'tom@gmail.com', '4645  Dawson Drive', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `query`
--

CREATE TABLE IF NOT EXISTS `query` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `subject` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `query`
--

INSERT INTO `query` (`name`, `e_mail`, `mobile`, `subject`) VALUES
('Nikhil', 'nikhil@gmail.com', 7865423515, 'Hope this works.');

-- --------------------------------------------------------

--
-- Table structure for table `bookedtours`
--

CREATE TABLE IF NOT EXISTS `bookedtours` (
  `tour_id` int(20) NOT NULL,
  `tour_name` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_mobile` varchar(15) NOT NULL,
  `tour_start_date` date NOT NULL,
  `fare` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=574681260 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookedtours`
--

INSERT INTO `bookedtours` (`tour_id`, `tour_name`, `customer_name`, `customer_address`, `customer_email`, `customer_mobile`, `tour_start_date`, `fare`) VALUES
(5, 'Hornbill Festival Special', 'Jospeh', 'A-6/2 The Park New Dehi', 'joseph0213@gmail.com', '9865861785', '2018-07-01', 68500),
(11, 'Kenya Migration Safari', 'Dogesh', '152 Galaxy Appartment Jubilie Hills', 'singhdogesh@gmail.com', '8617856522', '2020-10-14', 270000),
(7, 'Tryst With Tulips - Offbeat Kashmir', 'Rahul', '359 Ivy Gardens Kolkata', 'rahul@gmail.com', '9865868562', '2018-09-10', 65700);


