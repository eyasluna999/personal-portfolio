-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2024 at 11:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(3, 'gab', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(4, 'user', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(5, 'user123', '95c946bf622ef93b0a211cd0fd028dfdfcf7e39e'),
(6, 'gab123', '8aefb06c426e07a0a671a1e2488b4858d694a730');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(19, 5, 2, 'AMD Ryzen 7 5800X3D', 21500, 3, 'R75800X3D image.png'),
(20, 5, 5, 'EVGA RTX 3060 12GB GPU', 20000, 3, 'EVGA RTX 3060 1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE `creditcard` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `ccnumber` bigint(100) NOT NULL,
  `expmonth` int(2) NOT NULL,
  `expyear` int(4) NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creditcard`
--

INSERT INTO `creditcard` (`id`, `name`, `ccnumber`, `expmonth`, `expyear`, `cvv`) VALUES
(19, 'Juan Dela Cruz', 4834456792039484, 4, 2030, 304),
(20, 'Gab', 4783459340923049, 4, 2030, 304),
(21, 'gab', 4834554602932823, 4, 2030, 304),
(22, 'Gab Dalida', 4834450692107382, 5, 2030, 304),
(23, 'ss', 2222222222222, 4, 2030, 304),
(24, 'zzz', 0, 0, 0, 0),
(25, 'Gab', 0, 0, 0, 0),
(26, 'Gab', 0, 0, 0, 0),
(27, 'eee', 4834468290329409, 4, 2030, 304),
(28, 'Gab', 0, 0, 0, 0),
(29, 'asdfjklasdjfkl', 0, 0, 0, 0),
(30, 'gab', 0, 0, 0, 0),
(31, 'Gab', 0, 0, 0, 0),
(32, 'admin', 0, 0, 0, 0),
(33, 'admin', 0, 0, 0, 0),
(34, 'ee', 0, 0, 0, 0),
(35, 'Gab', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(9, 6, 'Gab', '0492392392', 'daz@gmail.com', 'Cash on Delivery', 'flat no. 69, Cedar St., Liverpool, UK, - 32222', 'Koorui 24E3 144HZ Gaming Monitor (7500 x 1) - ', 7500, '2024-06-08', 'pending'),
(10, 5, 'eee', '0983424782', 'dalidagab01423@gmail.com', 'Credit Card', 'flat no. ssss, sss, ss, sss, - 5555', 'Koorui 24E3 144HZ Gaming Monitor (7500 x 1) - ', 7500, '2024-06-14', 'pending'),
(11, 5, 'Gab', '0934578934', 'Gab@gmail.com', 'Cash on Delivery', 'flat no. wejrkljawelkra, asdfjklasdj, jasdklfjkl, asdjfklasdjklf, - 3409', 'Samsung 980 NVMe SSD 1TB (5500 x 1) - ', 5500, '2024-06-14', 'pending'),
(12, 4, 'asdfjklasdjfkl', '0387234897', 'ggg@hotmail.com', 'Cash on Delivery', 'flat no. 69 Cedar Street, Tom Hook, Liverpool, United Kingdom, - 4103', 'MSI RTX 4060TI 16G Gaming X GPU (32500 x 1) - ', 32500, '2024-06-14', 'pending'),
(13, 6, 'gab', '0912379728', 'zzz@gmail.com', 'Cash on Delivery', 'flat no. 111, 111, 11, 11, - 1111', 'EVGA RTX 3060 12GB GPU (20000 x 1) - ', 20000, '2024-07-06', 'pending'),
(14, 6, 'Gab', '0923478923', 'zzz@gmail.com', 'Cash on Delivery', 'flat no. 111, 11, 11, 11, - 1111', 'MSI RTX 4060TI 16G Gaming X GPU (32500 x 1) - ', 32500, '2024-07-06', 'pending'),
(15, 6, 'admin', '111', 'z@gmail.com', 'Cash on Delivery', 'flat no. 1, 1, 1, 1, - 1', 'AMD Ryzen 7 5800X3D (21500 x 1) - ', 21500, '2024-07-06', 'pending'),
(16, 6, 'admin', '0923092390', 'gab123@gmail.com', 'Cash on Delivery', 'flat no. 11, 11, 11, 11, - 1111', 'AMD Ryzen 5 5600 CPU (8000 x 1) - ', 8000, '2024-07-06', 'pending'),
(17, 6, 'ee', '0930294023', 'z@gmail.com', 'Cash on Delivery', 'flat no. 1, 1, 1, 1, - 1', 'AMD Ryzen 7 5800X3D (21500 x 1) - ', 21500, '2024-07-06', 'pending'),
(18, 6, 'Gab', '0923409230', 'z@gmail.com', 'Cash on Delivery', 'flat no. 1, 1, 1, 1, - 1', 'AMD Ryzen 7 5800X3D (21500 x 1) - ', 21500, '2024-07-06', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'AMD Ryzen 5 5600 CPU', 'Specifications:\r\nCores: 6 Cores\r\nThreads: 12 Threads (SMT On)\r\nBase Clock - 3.5GHz\r\nMax Boost Clock - Up to 4.4GHz\r\nL1 Cache - 384KB\r\nL2 Cache - 3MB\r\nL3 Cache - 32MB\r\nDefault TDP - 65W\r\nProcessor Technology for CPU \r\nCPU Socket - AM4', 8000, 'R53600.png', 'ph-11134207-7r98o-lksxmfbmj8az60.jpeg', 'ph-11134207-7r98o-lksxmfbmhtqj22.jpeg'),
(2, 'AMD Ryzen 7 5800X3D', 'Specifications:\r\nPlatform: AM4\r\nCPU Cores: 8\r\nThreads : 16\r\nL1 Cache: 512KB\r\nL2 Cache: 4MB\r\nL3 Cache: 96MB\r\nTDP: 105w', 21500, 'R75800X3D image.png', 'R75800X3d image2.jpeg', 'R75800x3d image3.jpeg'),
(5, 'EVGA RTX 3060 12GB GPU', 'SPECIFICATIONS\r\nBoost Clock: 1710 MHz\r\nMemory Clock: 14000 MHz Effective\r\nCUDA Cores: 4864\r\nBus Type: PCIe 4.0\r\nMemory Detail: 8192MB GDDR6\r\nMemory Bit Width: 256 Bit\r\nMemory Bandwidth: 448 GB/s\r\nDIMENSIONS\r\nHeight: 4.33 in - 110mm\r\nLength: 7.94 in - 201.8mm\r\nWidth: Dual Slot', 20000, 'EVGA RTX 3060 1.jpg', 'e27c616d-c898-4059-9cc7-0f0cf5b3cada.b83471fea4d5bb40714369bcedd901da.webp', '0ed37aef-f64c-4fd3-aac9-90437bb7ee7a.225596c4ceeb85641ba9107b02a5bb75.webp'),
(6, 'GSKILL Trident Z Neo 16GB RAM', 'Specifications:\r\nMemory Type\r\nDDR4\r\nCapacity\r\n16GB (8GBx2)\r\nMulti-Channel Kit\r\nDual Channel Kit\r\nTested Speed (XMP/EXPO)\r\n3200 MT/s\r\nTested Latency (XMP/EXPO)\r\n16-18-18-38\r\nTested Voltage (XMP/EXPO)\r\n1.35V\r\nRegistered/Unbuffered\r\nUnbuffered\r\nError Checking (ECC)\r\nNon-ECC\r\nSPD Speed (Default)\r\n2133 MT/s\r\nSPD Voltage (Default)\r\n1.20V\r\nFan Included\r\nNo\r\nWarranty\r\nLimited Lifetime\r\nFeatures\r\nIntel XMP 2.0 (Extreme Memory Profile) Ready', 3450, 'TRIDENTZ1.png', 'tridentz2.png', 'tridentz3.png'),
(7, 'MSI RTX 4060TI 16G Gaming X GPU', 'Specifications:\r\nBoost Clock / Memory Speed\r\n2640 MHz / 18 Gbps\r\n16GB GDDR6\r\nDisplayPort x 3 (v1.4a)\r\nHDMI™ x 1 (Supports 4K@120Hz HDR, 8K@60Hz HDR, and Variable Refresh Rate as specified in HDMI™ 2.1a)\r\nTWIN FROZR 9 Thermal Design\r\nTORX Fan 5.0: Fan blades linked by ring arcs and a fan cowl work together to stabilize and maintain high-pressure airflow.', 32500, 'msi rtx 4060ti.png', 'msi rtx 4060ti2.png', 'msi rtx 4060ti3.png'),
(8, 'ASRock B550M Pro 4 Motherboard', 'Supports AMD AM4 Socket Ryzen™ 3000, 3000 G-Series, 4000 G-Series, 5000 and 5000 G-Series Desktop Processors*\r\n8 Power Phase Design, Digi Power\r\nSupports DDR4 4733+ (OC)\r\n1 PCIe 4.0 x16, 1 PCIe 3.0 x16, 1 PCIe 3.0 x1, 1 M.2 Key E for WiFi\r\nGraphics Output Options: HDMI, DisplayPort, D-Sub\r\nAMD CrossFireX™\r\n7.1 CH HD Audio (Realtek ALC1220/ALC1200 Audio Codec), Nahimic Audio\r\n6 SATA3, 1 Hyper M.2 (PCIe Gen4 x4), 1 M.2 (PCIe Gen3 x2 & SATA3)\r\n2 USB 3.2 Gen2 (Rear Type A+C), 8 USB 3.2 Gen1 (4 Front', 6700, 'b550.png', 'b550-3.png', 'b550-2.png'),
(9, 'Seasonic M12II 520W PSU', 'Specifications :\r\n\r\n80PLUS®	Bronze\r\nForm Factor	Intel ATX 12 V\r\nDimensions	170 mm (L) x 150 mm (W) x 86 mm (H)\r\nFan Information	Fan Size	120 mm\r\nFan Control	Seasonic S2FC\r\nFan Bearing	Fluid Dynamic Bearing\r\nLife Expectancy	50,000 hours at 40 °C, 15 % - 65 % RH\r\nCable Information	Modularity	Fully Modular\r\nCable type	Flat black cables', 3500, 'M12II-bronze.png', 'M12II-fully-modular.png', 'm12ii-evo-520-620-750-850-am2-connectors.jpg'),
(10, 'Seagate Barracuda 1TB HDD', 'Specifications:\r\nForm:	Internal 3.5&#34;\r\nStorage Type:	Disk Drive\r\nCapacity:	1TB\r\nRotational Speed:	7200 RPM\r\nConnectivity Type:	SATA 600\r\nSustained Transfer Rate:	210MB/s\r\nCache Size:	64MB\r\nPower:	Internal\r\nHeight:	0.78&#34;\r\nDepth:	5.78&#34;\r\nWidth:	3.5&#34; (internal), 4&#34; (external)\r\nWeight:	0.88 lbs.\r\nManufacturer Part Number:	ST1000DM010', 2500, 'seagate hdd.png', 'seagate hdd2.png', 'seagate hdd3.png'),
(11, 'Samsung 980 NVMe SSD 1TB', 'Sequential Read:	3,500 MB/s\r\nSequential Write:	3,000 MB/s\r\nRandom Read:	480,000 IOPS\r\nRandom Write:	500,000 IOPS\r\nEndurance:	600 TBW\r\nWarranty:	5 Years', 5500, '980.jpg', '980-2.jpg', '980-2.jpg'),
(12, ' Lian Li O11 Dynamic EVO XL Case', 'Specifications:\r\nFull-tower chassis with two modes: Normal Mode/ Reverse Mode\r\nFront and side tempered glass panels with a removable pilar for a seamless view of components and RGB lighting\r\nSupports up to 3x 420mm radiators and a maximum of 11 fans\r\nOffers mounting space for 7 storage drives\r\nDual-chamber layout with cable management compartment and three cable holders\r\nNumber of PSU supported : 1\r\n', 8500, 'case1.jpg', 'case2.jpg', 'case3.jpg'),
(13, 'Koorui 24E3 144HZ Gaming Monitor', 'Specifications:\r\ntype: gaming monitor\r\nproduct form: planar\r\nscreen size: 23.8 inch\r\nscreen type: ips panel\r\nresolution ratio: 1920 x 1080\r\nrefresh rate: 165 hz\r\nviewing angle: 178 degree\r\ncolor: black\r\nvesa: 100 x 100 mm\r\ninterface hdmi: 1.4 x 2 , dp 1.2 , audio\r\ncolor gamut: 99% sRGB\r\nmaximum color: 16.7 m\r\ndisplay ratio: 16 : 9\r\nresponse time: 1 ms\r\nrefresh rate: 144hz\r\nSKU : PH3022192\r\n', 7500, 'monitor1.jpg', 'monitor2.jpeg', 'monitor3.jpeg'),
(14, 'Pulsar X2V2 Wireless Gaming Mouse', 'Tech Specifications:\r\nPAW3395\r\n\r\n26000 DPI\r\n\r\n650 IPS\r\n\r\n50g Acceleration\r\n\r\n1000Hz/1ms Polling Rate\r\n', 6000, 'mouse1.png', 'mouse2.png', 'mouse3.png'),
(15, 'RK R65 Trimode Gaming Keyboard', 'Specifications:\r\nConnectivity: Wired, Wireless, Bluetooth\r\n', 3300, 'cn-11134207-7r98o-ls14iu4oe0mled.jpeg', 'cn-11134207-7r98o-ls14iu4oe0mled.jpeg', 'cn-11134207-7r98o-ls14iu4off71eb.jpeg'),
(16, 'Logitech G Pro X Wired Gaming Headset', 'Specifications:\r\nDriver: Hybrid mesh PRO-G 50 mm\r\nMagnet: Neodymium\r\nFrequency Response: 20 Hz - 20 kHz\r\nImpedance: 32 Ohms\r\nSensitivity: 91.7 dB SPL @ 1 mW & 1 cm\r\nMATERIALS\r\nFork: Aluminum\r\nHeadband: Steel\r\nEar and head pads: Memory Foam Leatherette\r\nExtra Ear pads: Memory Foam Cloth\r\nPRO MICROPHONE\r\nMicrophone Pickup Pattern\r\nType: Electret Condenser\r\nSize: 6 mm\r\nFrequency Response: 100 Hz-10 KHz', 6700, 'headset3.png', 'headset1.jpg', 'headset2.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'eyasluna', 'dalidagab01423@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(2, 'test', 'asdasdsad@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(3, 'gab123', 'gabdalida@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(4, 'gab2024', 'gabdalida123@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(5, 'gab2024', 'gab123@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(6, 'dddd', 'zzz@gmail.com', '40fa37ec00c761c7dbb6ebdee6d4a260b922f5f4');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
