-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2020 at 08:38 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `royal library`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `emailId` varchar(50) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `emailId`, `phoneNo`, `message`, `date`) VALUES
(1, 'first name', 'first_email@gmail.com', '1234567890', 'this is test message', '2020-11-21 18:44:26'),
(2, 'mera naam', 'meraEmail@gmail.com', '2132435465', 'fasdf', '2020-11-21 19:06:47'),
(3, 'mera naam', 'meraEmail@gmail.com', '2132435465', 'fasdf', '2020-11-22 07:57:27'),
(4, 'tera naam', 'dfsEmail@gmail.com', '3423434543', 'dfvsdfvdfvfv', '2020-11-22 08:12:09'),
(5, 'tera naam', 'dfsEmail@gmail.com', '3423434543', 'dfvsdfvdfvfv', '2020-11-22 08:18:30'),
(6, 'vdfssdfv', 'dgffg@fgdsf', '435345345', 'fgsdgdfggf', '2020-11-22 08:22:49'),
(7, 'eferf', 'qwrefqerg', '234343434', 'etgrtwghrth', '2020-11-23 05:28:46'),
(8, 'shafaque eqbal', 'shafaque.ckp@gmail.com', '734547236', 'this is a test message', '2020-11-23 05:29:21'),
(9, 'jkfjk', 'sdfhdfkjh@sdfgg', 'fghkjsdfhj', 'gkjdfhkjghsdf', '2020-11-28 15:38:39'),
(10, 'shazi', 'shafaque.ckp@gmail.com', '9835125668', 'this is a message by shazi', '2020-11-28 15:47:00'),
(11, 'me', 'meraEmail@gmail.com', '2132435465', 'njk', '2020-11-28 19:27:52'),
(12, 'me', 'meraEmail@gmail.com', '2132435465', 'njk', '2020-11-28 19:31:09'),
(13, 'me', 'meraEmail@gmail.com', '2132435465', 'njk', '2020-11-28 19:33:15'),
(14, 'me', 'meraEmail@gmail.com', '2132435465', 'njk', '2020-11-28 19:33:23'),
(15, 'dasd', 'dasd', 'devilliers', 'adsd', '2020-11-28 19:34:38');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) DEFAULT NULL,
  `title` text NOT NULL,
  `subtitle` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `img_file` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `slug`, `title`, `subtitle`, `content`, `img_file`, `date`) VALUES
(1, 'jason statham', 'post1', 'Cloud Computing', 'sneek peek through the world of Cloud computing', 'Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user. The term is generally used to describe data centers available to many users over the Internet.[1] Large clouds, predominant today, often have functions distributed over multiple locations from central servers. If the connection to the user is relatively close, it may be designated an edge server.\r\n\r\nClouds may be limited to a single organization (enterprise clouds[2][3]), or be available to many organizations (public cloud).\r\n\r\nCloud computing relies on sharing of resources to achieve coherence and economies of scale.\r\n\r\nAdvocates of public and hybrid clouds note that cloud computing allows companies to avoid or minimize up-front IT infrastructure costs. Proponents also claim that cloud computing allows enterprises to get their applications up and running faster, with improved manageability and less maintenance, and that it enables IT teams to more rapidly adjust resources to meet fluctuating and unpredictable demand,[3][4][5] providing the burst computing capability: high computing power at certain periods of peak demand.[6]', 'about-bg.jpg', '2020-11-28 15:40:01'),
(2, 'admin2', 'post2', 'my second post', 'second subtitle edited', 'Integer condimentum quis odio ac sagittis. Morbi feugiat tellus eu est iaculis, posuere pellentesque massa accumsan. Sed sollicitudin pulvinar viverra. In nunc nisi, porta non cursus ut, eleifend eu enim. Curabitur sit amet sapien vel eros mollis congue vitae eget quam. Praesent porttitor volutpat tellus, ac lobortis dolor porta et. Nullam vel congue magna. Fusce dolor metus, dignissim quis urna euismod, pharetra placerat quam. Nam tempus risus sed neque fringilla suscipit. Duis pellentesque, justo sed molestie porttitor, arcu diam eleifend sapien, et ultricies sapien enim a erat. Mauris varius sem sit amet lectus aliquet sollicitudin. Pellentesque imperdiet felis ornare, volutpat eros vel, eleifend nulla. Vivamus sit amet accumsan mauris, suscipit feugiat ipsum. Phasellus sit amet purus metus. Pellentesque vitae suscipit elit. Nunc nec vehicula nibh.', '', '2020-11-27 18:46:22'),
(3, 'admin3', 'post3', 'block chain', 'blockchain', 'A blockchain,[1][2][3] originally block chain,[4][5] is a growing list of records, called blocks, that are linked using cryptography.[1][6] Each block contains a cryptographic hash of the previous block,[6] a timestamp, and transaction data (generally represented as a Merkle tree).\r\n\r\nBy design, a blockchain is resistant to modification of its data. This is because once recorded, the data in any given block cannot be altered retroactively without alteration of all subsequent blocks. For use as a distributed ledger, a blockchain is typically managed by a peer-to-peer network collectively adhering to a protocol for inter-node communication and validating new blocks. Although blockchain records are not unalterable, blockchains may be considered secure by design and exemplify a distributed computing system with high Byzantine fault tolerance. The blockchain has been described as \"an open, distributed ledger that can record transactions between two parties efficiently and in a verifiable and permanent way\".[7]\r\n\r\n', '', '2020-11-27 18:46:26'),
(4, 'admin4', 'post4', 'bigdata', 'bigdata hadoop', 'Due to the advent of new technologies, devices, and communication means like social networking sites, the amount of data produced by mankind is growing rapidly every year. The amount of data produced by us from the beginning of time till 2003 was 5 billion gigabytes. If you pile up the data in the form of disks it may fill an entire football field. The same amount was created in every two days in 2011, and in every ten minutes in 2013. This rate is still growing enormously. Though all this information produced is meaningful and can be useful when processed, it is being neglected.', '', '2020-11-27 18:46:31'),
(14, 'me', 'post14', 'Machine learning (ML)', 'ML', 'Machine learning (ML) is the study of computer algorithms that improve automatically through experience.[1] It is seen as a subset of artificial intelligence. Machine learning algorithms build a model based on sample data, known as \"training data\", in order to make predictions or decisions without being explicitly programmed to do so.[2] Machine learning algorithms are used in a wide variety of applications, such as email filtering and computer vision, where it is difficult or unfeasible to develop conventional algorithms to perform the needed tasks.\r\n\r\nA subset of machine learning is closely related to computational statistics, which focuses on making predictions using computers; but not all machine learning is statistical learning. The study of mathematical optimization delivers methods, theory and application domains to the field of machine learning. Data mining is a related field of study, focusing on exploratory data analysis through unsupervised learning.[4][5] In its application across business problems, machine learning is also referred to as predictive analytics.', '', '2020-11-27 15:47:56'),
(15, 'some author', 'post15', 'ML vs AI', 'difference between Machine Learning and Artificial Intelligence', 'The word Artificial Intelligence comprises of two words “Artificial” and “Intelligence”. Artificial refers to something which is made by human or non natural thing and Intelligence means ability to understand or think. There is a misconception that Artificial Intelligence is a system, but it is not a system .AI is implemented in the system. There can be so many definition of AI, one definition can be “It is the study of how to train the computers so that computers can do things which at present human can do better.”Therefore It is a intelligence where we want to add all the capabilities to machine that human contain.\r\n\r\nMachine Learning is the learning in which machine can learn by its own without being explicitly programmed. It is an application of AI that provide system the ability to automatically learn and improve from experience. Here we can generate a program by integrating input and output of that program. One of the simple definition of the Machine Learning is “Machine Learning is said to learn from experience E w.r.t some class of task T and a performance measure P if learners performance at the task in the class as measured by P improves with experiences.”', '', '2020-11-27 15:52:37'),
(16, 'same', 'post16', 'The Internet of things', 'IOT', 'The Internet of things (IoT) describes the network of physical objects—“things”—that are embedded with sensors, software, and other technologies for the purpose of connecting and exchanging data with other devices and systems over the Internet.[1][2][3][4]\r\n\r\nThe definition of the Internet of things has evolved due to the convergence of multiple technologies, real-time analytics, machine learning, commodity sensors, and embedded systems.[1] Traditional fields of embedded systems, wireless sensor networks, control systems, automation (including home and building automation), and others all contribute to enabling the Internet of things. In the consumer market, IoT technology is most synonymous with products pertaining to the concept of the \"smart home\", including devices and appliances (such as lighting fixtures, thermostats, home security systems and cameras, and other home appliances) that support one or more common ecosystems, and can be controlled via devices associated with that ecosystem, such as smartphones and smart speakers.\r\n\r\nThere are a number of serious concerns about dangers in the growth of IoT, especially in the areas of privacy and security, and consequently industry and governmental moves to address these concerns have begun including the development of international standards.', '', '2020-11-27 15:53:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
