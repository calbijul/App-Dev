-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 11:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbcea`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `course_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`course_id`, `department_id`, `course_name`) VALUES
(1, 1, 'Civil Engineering'),
(2, 1, 'Architecture'),
(3, 1, 'Mechanical Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_department`
--

CREATE TABLE `tbl_department` (
  `department_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_department`
--

INSERT INTO `tbl_department` (`department_id`, `emp_id`, `department_name`) VALUES
(1, 1, 'College of Engineering and Architecture'),
(2, 0, 'Mechanical Engineering'),
(3, 0, 'Architecture'),
(4, 0, 'Electrical Engineering'),
(5, 0, 'Computer Engineering'),
(6, 0, 'test'),
(7, 0, 'awdwad');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `emp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `emp_fname` varchar(20) NOT NULL,
  `emp_mname` varchar(20) NOT NULL,
  `emp_lname` varchar(20) NOT NULL,
  `emp_email` varchar(50) NOT NULL,
  `emp_phone` int(11) NOT NULL,
  `emp_username` varchar(30) NOT NULL,
  `emp_password` varchar(20) NOT NULL,
  `emp_address` varchar(50) NOT NULL,
  `emp_gender` varchar(20) NOT NULL,
  `emp_relation` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`emp_id`, `user_id`, `course_id`, `emp_fname`, `emp_mname`, `emp_lname`, `emp_email`, `emp_phone`, `emp_username`, `emp_password`, `emp_address`, `emp_gender`, `emp_relation`) VALUES
(1, 1, 1, 'Daves', 'Rabe', 'Cape', 'avra.cape.coc@phinmaed.com', 123456789, 'Yuri', '1234', 'CDO', 'Male', 'Single'),
(2, 4, 2, 'Mark', 'Duterte', 'Palma', '@example.com', 123456789, 'Mark', 'Palma', 'Patag, CDO', 'Male', 'Single'),
(3, 2, 1, 'April Rose', 'Quiboloy', 'Rangcasajo', 'april@example.com', 123456789, 'April', 'Rangcasajo', 'Lumbia, CDO', 'Female', 'Single'),
(4, 3, 1, 'Rowen', 'Pacquiao', 'Simon', 'simon@example.com', 123456789, 'Rowen', 'Simon', 'Lumbia, CDO', 'Male', 'Single'),
(5, 5, 1, 'Christian', 'Ronaldo', 'Cabiladas', 'haha@example.com', 123456789, 'Christian', 'Cabiladas', 'Bulua, CDO', 'Male', 'Taken'),
(7, 1, 1, 'Daves', 'Rabe', 'Cape', 'avra.cape.coc@phinmaed.com', 123456789, 'Yuri', '1234', 'CDO', 'Male', 'Single'),
(8, 4, 2, 'Bruce', 'Banner', 'Wayne', 'batman@example.com', 8, 'Batman', 'Affleck', 'Gotham City', 'Male', 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE `tbl_question` (
  `question_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `question_text` varchar(100) NOT NULL,
  `question_optionA` varchar(100) NOT NULL,
  `question_optionB` varchar(100) NOT NULL,
  `question_optionC` varchar(100) NOT NULL,
  `question_optionD` varchar(100) NOT NULL,
  `question_answer` varchar(50) NOT NULL,
  `question_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`question_id`, `test_id`, `subject_id`, `emp_id`, `question_text`, `question_optionA`, `question_optionB`, `question_optionC`, `question_optionD`, `question_answer`, `question_status`) VALUES
(1, 2, 1, 1, '1. What is 5 x 5?', '21', '1000', '25', '100', '25', 1),
(2, 2, 1, 2, 'How are you?', 'Ok', 'Hehe', 'Oh yeah', 'Like', 'Like', 1),
(3, 2, 1, 2, '1+1?', '2', '11', '6', '23', '2', 1),
(5, 2, 1, 2, 'Unsa na?', 'Ambot', 'Naa man ka gamay', 'Wala', 'Boang ka?', 'Wala', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_result`
--

CREATE TABLE `tbl_result` (
  `result_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `result_score` int(3) NOT NULL,
  `result_status` tinyint(1) NOT NULL,
  `result_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_result`
--

INSERT INTO `tbl_result` (`result_id`, `test_id`, `stud_id`, `emp_id`, `subject_id`, `section_id`, `result_score`, `result_status`, `result_date`) VALUES
(3, 3, 1, 5, 8, 3, 100, 1, '2023-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `sched_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `sched_day` varchar(50) NOT NULL,
  `sched_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`sched_id`, `section_id`, `emp_id`, `stud_id`, `sched_day`, `sched_time`) VALUES
(1, 1, 1, 1, 'M/W/TH/F', '2023-09-15 15:25:11'),
(2, 2, 1, 1, 'M/W', '0000-00-00 00:00:00'),
(3, 2, 1, 1, 'M/W/F', '2023-10-25 09:01:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_section`
--

CREATE TABLE `tbl_section` (
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `section_code` varchar(50) NOT NULL,
  `section_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_section`
--

INSERT INTO `tbl_section` (`section_id`, `subject_id`, `section_code`, `section_name`) VALUES
(3, 8, 'COC-FA-CEA-01', 'COC-FA-CEA-01'),
(4, 9, 'COC-FA-CEA-02', 'COC-FA-CEA-02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `stud_no` varchar(15) NOT NULL,
  `year_id` int(11) NOT NULL,
  `student_fname` varchar(50) NOT NULL,
  `stud_mname` varchar(50) NOT NULL,
  `stud_lname` varchar(50) NOT NULL,
  `stud_email` varchar(50) NOT NULL,
  `stud_image` varbinary(100) NOT NULL,
  `stud_address` varchar(50) NOT NULL,
  `stud_gender` varchar(50) NOT NULL,
  `stud_contact` varchar(11) NOT NULL,
  `stud_password` varchar(50) NOT NULL,
  `stud_relation` varchar(50) NOT NULL,
  `stud_status` tinyint(1) NOT NULL,
  `stud_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_student`
--

INSERT INTO `tbl_student` (`student_id`, `emp_id`, `department_id`, `course_id`, `stud_no`, `year_id`, `student_fname`, `stud_mname`, `stud_lname`, `stud_email`, `stud_image`, `stud_address`, `stud_gender`, `stud_contact`, `stud_password`, `stud_relation`, `stud_status`, `stud_date`) VALUES
(1, 1, 1, 1, '02-2122-034265', 0, 'Jak', 'Cole', 'Roberto', 'jakroberto@phinmaed,com', 0x696d6167652e706e67, 'Bugo, Cagayan de Oro City', 'Male', '09054711392', 'Roberto', 'Single', 1, '2023-09-15'),
(3, 2, 1, 2, '02-2122-034265', 0, 'Daves', 'Rabe', 'Cape', 'avra.cape.coc@phinmaed.com', 0x433a5c66616b65706174685c74682e6a7067, 'ZONE 6, BUGO CAGAYAN DE ORO CITY', 'Male', '09063661855', 'Cape.123.', 'Single', 1, '2023-09-22'),
(14, 2, 1, 2, '02-2122-034265', 0, 'Jupeta', 'Gaspar', 'Gumamela', 'jupeta@example.com', 0x74682e6a7067, 'Zone 6, Cugman Cagayan De Oro City', 'Others', '09063661855', '12345', 'Taken', 1, '2023-10-19'),
(15, 5, 1, 2, '02-1234-123456', 0, 'Alexis', 'Alejo', 'Lore', 'alexislore@gmail.com', 0x367179687063637371787977623736356964326a646d616b6633736e696b74765f68712e6a7067, 'Zone 6, Cugman Cagayan De Oro City', 'Female', '0987654321', 'Alexislore', 'Taken', 1, '2023-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `stud_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `stud_no` varchar(50) NOT NULL,
  `stud_fname` varchar(50) NOT NULL,
  `stud_mname` varchar(50) NOT NULL,
  `stud_lname` varchar(50) NOT NULL,
  `stud_email` varchar(50) NOT NULL,
  `stud_image` mediumblob NOT NULL,
  `stud_address` varchar(50) NOT NULL,
  `stud_gender` varchar(50) NOT NULL,
  `stud_contact` varchar(50) NOT NULL,
  `stud_password` varchar(50) NOT NULL,
  `stud_relation` varchar(50) NOT NULL,
  `stud_status` int(11) NOT NULL,
  `stud_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`stud_id`, `emp_id`, `department_id`, `course_id`, `year_id`, `stud_no`, `stud_fname`, `stud_mname`, `stud_lname`, `stud_email`, `stud_image`, `stud_address`, `stud_gender`, `stud_contact`, `stud_password`, `stud_relation`, `stud_status`, `stud_date`) VALUES
(1, 5, 1, 1, 1, '02-2122-034265', 'Fitz', 'Gomez', 'Labe', 'labe@gmail.com', 0x89504e470d0a1a0a0000000d4948445200000153000000e4080600000025f3c70d000000017352474200aece1ce90000000467414d410000b18f0bfc61050000000970485973000016250000162501495224f000001dc349444154785eeddd0f6c5357822ef08f7dac266847c2d90d1dfba9b3c588d218d18223607054988d33306a58a8700aa3261b466d02526b13ed9b24209ad0d1833023929879a20e5d41d24ac326ec4263344d09db228c0650d292514c8117336d85cb143d670befc5e875148f8874f6dc3f098e3134811353e0fb49cebdf7f8dc3fbe523e9f7bcf49ee1421818888eecb5f99532222ba0f0c5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a44a400c3948848018629119102990bd38bcd58699b02dbea6644cc2222a247c584c234f8fa144c9932de573e769e335724227ac44d284c3d7b05c4500c6d1bec46414113fa852c4b7e0d0da2ef9d1238d08358d4a8a69be7c5d19840ec7daf7c6f72c40fee84ffa2b94044944113bfcccfb2a2e4852273218d2c0b9cafb4a1759bcb2cc89438ba8e85cc7922a2cc9ab47ba6ae75c530dbaf1911efac43fd0173818828c326af036a5e15aad698f393ed8b767837b3638b881e1cf561fa711dea8e98f3238613889e69459d270f36b73f29f4121838d30effc642cc5aa195cb4bf5370a619b928d599e91708ca3a7b114f9f66cbd63cbe62844f1c60a146e0e1aef1eaf43e1d252b45fd29642a87ed6ec007bdd783f3d6dbfadd8b97e64bf723b67fc2875cd42b6b68f45a5684ed379163fd38c8aa2b9f2f88c7de8c7b2a30b03c366054d9acf3a70526e7b91cd582779db0321f8d7e763d60cb9bd19b350f84697fcb4b74b5c6a87af28cfa8a79d9b1515683e935a539ebbca3c64cfc883ef48baad10d1a412f722e815daaa286812fd66916e2826da5e73086fd05cd65d161d7b02a2a9cc91b2cea038b1b749346d72098b5e5e2f3a7697084f59917068cbf088c05772edbd1e61c9f58ab6af86f4b5862eb488925cf9fe6b1dfaf2888ed7b475dca2e98259704743a2fb9d94fdeed5f65b2f02ed6d223052bea45ef4996be83eaad28fcbbdf58488dd94cb43fda2a5ccae7f26d7f6919aa99fd5dcf68626d1d2de22ea5f761adbcead1247236da27c7991f036b488968672e1b66ac76f1125ed83e6b60c83f25c3b72e5b9e8313f7f4f4078b4cf9fe314b51fe945a67ed154a06d03c2b2e9a859464499727f617a87d7d8303585eb854b7b3f358007db4489563edb25aa0e1941321439218ef6c6e4dc65d1b41cc2b1b55b2f1fd5532b5cf71ca6a6af642869fbb51689fad3c901d62d6a17dcbeadb4db97016bd7b6b161ecb18c7ed6dc12d1123142d030127816e1aa396a84f208794ef5a04dde56541e638e5d547599cba6c1df96e8e73935f0074f0744554d40745f330b882863eeef323f7568d4cd184e6c759b6fa6989a8569e6ec18962c646b53eb4a94ae95712265e5ba51b4d02ae7a621ebfb40e47000ad9712fa7bba25a528bedfdead276db06953871b9ee78dfd1a5cc8d307220c219174f96effa10b16ab1596e4aa369bd1c9f64534e9d68534f2596d79c8cfcdd28b0c0ed873b5695ceea308d6a97aa1e1693bf2b469d2b622878308a208ee17cc0293c59907fd2c7f1c42e80bbd486779de8ba6062f5c39660111658cda7ba653ad709714dd5b2ffe5f672139760c5694bee28533de8e0a871d851bfd08eaa1ea40558d6c574eaab1e3649d5bbb31186b43f99372e19b08828d15285c558fc91c8c1589caad5f6fc64af31eede8ebd96a73bf21442fe83344f480a9ef8052dc8b6f5915405fcf51d4bf6c43dffe6a143b6cc82bf123346056c824bdc3280fb39ef5a14bb6180307ab8d16e2a48820aa75aa2da8457772eb3fe515c8d4880922baabc91b1aa5d2ec22d4b6f72116e990a16a4754865861810fc1ebe6fb19103fe243deb3c5e89ad984eecf4fa045b68c1ddfbfbd2dad8e03f6d972722e8cbe2f8d1222faeefa8e876904fe37db47870b65e57a64a876a36bab0bb8d48cb6c3196a9e0e0751b7b119e127bda8dfee1e7baf731269f76921dbc0cd0dc1b443a6e287ebe0ff83b940440fd4bd85e9b0d91974218ae43fbfbf2f8383690303670268fad89cd765c155e4bec3dff70f62f01b632e7e515e261bb3e90d6ba34dc7e9521411ad15fc4d0283499d52896b31b9c75be2d7d58eef749695c29323bf52de2e875bbbb5f1a579c48938c2077d28da330dee854691461b075bbdb9193d196cb1139161e2619a1840fb71b3dbe57a1f424706c6154a03bd7de8d366be8a209cd4a01ce8ec36cacf85d0d199aea5d9839d6b5662e7f1a8d1bb9e88a0755f10915c2f4ad76a3dfe06cbf7b56eaf3082bb77a2f5ed3a780f458d51027790e80c199d3827bb11ba9af409123de80b1bb3918b61e3b3cd73c2a5f5c27fe147f5ea3a341f6cc6cef5c5283f12d3de959fa90fc1b77da83e682cdfe9b322114644ffe382a46deb1218089be19fbcce4c2feab67be41787169ed528b44f333aa0a66523af3282e2b76ae134ab6a9d51f5aff8e06f9421bbbdcb2c23a28c1113608cb54cf7badbf8ce5b83c9935fda58d4b4db1b330e55aebbca219c0b9dc2a10f6a97af1cbb7095358913da30d464d78e8ada02abac6315ce0d6de272f218ce1469f7ab8d5b4d377e76e478c20151b250dbbe45d8979488267d6c6abf08ac926556a728d9ab8df84cff59dd0d720b69c7e67a45c71dd6491eab1b0b0544f90b0e21bf3a8ccfbfa656747c6ebe396a501cdde414961ca75c77ecc07f229a7c53b41ff297978888eec3c3d19b4f44f41dc73025225280614a44a400c3948848018629119102f7d49bbf65cb16738e881e65bb76ed32e7e8db4c384cb520e509267a3cf0f77dfc267499cf134bf478d17edf79253a3ebc674a44a400c39488480186291191020c5322220518a644440a4c6a98461a0bf5ffbf59d838e6d99de3167c5d7b809c0f41739988e8bb8a2d5322220518a644440a304c8988147830617a3d8cd6ca95c8b3671bcf34b2cdc5ca8dcd777e16befebcfa7ccc9aa1dd43cdc62c5729fc27532a1ff1c9f70ae13f3780506329f2cd6d67dbf351da18c240d283f0888854cb7c985e0fc2b7340f150763b0adaa434b7b1b02afd81193615858508ce67366bd5121d41514a2e9ea5c781bdad0d2500cfb97eda876bb517ddcac326a105d9bdd286e8fc3bdb9196def34a1d81e45fbe642b8df301f0248443419b47f74325e9b376f36e7c6a7bfc1ad3f1c4e7fa09c6e50b495596499e3b687be0d9dae152e59d7b226202e9b65230fbe73bcd621d74cd25525ecb2dc5e73c22c90461e5897eb151dd7cc32cdcda3a26ab62c9f5d25926a13d1384df4f7fe7195d996e9d536741c88036575a85f63310b0d59cf57c35706c48f0411fcc22cd439e159efc198da2fe4a3484ea20303b73d6bdfb9d678d6fca8a945c82f90d32f12e99fcb4f44a44066c3341cd19f55ef7238c686a3ce02e7b36e390d217ac12831d8617bd29c4d753506f3c9f5a3ec36edf9f929a66a3f64ddabfa12119172990dd361d9f294936953b38ce571b1dd394cd3b059ade65caa38126c9a12d1245112a6d1fda57acfbcef88597027b285a8b548878613c63211d123424998da73b211fe328ed840fab14d8ed90e63c6e9807621dfd3db8ddb6bc611bea0dd0470c3feac514244f4b05073992f4352eb100a1e6e4578643ce77018c16366383e6d14e1c9521497c9b6e99166d41f197bcd9d38d384c00139b3ca03cf6ca38c88e861a1264c6796c2bb49b63e4fd6a16845297c951558b9c88dba93b255fa9a17e5f3cc7af222bf64772bbcb911346f746365a51fad07dbd1fcc64ae4afd9891e6b119ab67b91a60b8988e83b4d5107940545bb8fa263ab07b6880cc7b75ad11d77a0a4e104427b528635e5781038dd8dc01a1b629df5a82829459d36807f4d0027c24751b5c0ac4744f41099d0d349f9403da2c70f7fefc74751cb9488e8f1c63025225280614a44a400c39488480186291191020c532222052614a6daf0086d9804113d1e382c6afc2634ce74040395e8f1c0201dbf7b0a5322221a8bf74c8988146098121129c03025225280614a44a4c084c234d258882953a6a47fbd1e346b11113d7e2614a68e9a1310376338fa3f5c668905ee6d27101b12107b3d6659a685b17307839c881eac895fe64fb5a2e8857cf3bfe117c3fba61bd6893c6c54b58f3b7034f579cf444419766ff74c6d36334c658aeacfa47f5022f0bfd98c1e738988e84179883ba0e2e879d387fae37c183e113d78190fd3e8e13a14bb66215befb8cac62ce74a54bc1b46ea93f4e367fc281da9679b8b424f052a5654c3b83b1a416b891b453b423252a5b78bcd8eb042f82fea15d24a5ced41eb8e5214dacd7ad77be05f9f8f5933b47de4a1f4edb0513199acd3bc7125e6dab4ed8f1ccb4e748d79567502f17341f83716ca6df9f4634c5c6a876f8571fcd9727f75c7ccd04f44d05e39b23d1bf2d637df7aa26bb2e101841ae5b13a6ce67ef350fc4610d194baf14e1ff2666423af32689c0b227a30b43f279db00b4dc22d5705bca2c32c1a8fcb7b3dc202bb28d9d72f86b482d809515ba06dc7224ada07f53aba684078721cc2db1e33eafdff7ed152e6b87d7f23c7f1dab71fc5d0e916d1d4e015ae1c6d7f6e517f28204ad69488fabd6da26def48b94bd4f79a2b686e9e1055b9b2bca0569c88690543a27f5f89b06bfb5c522ffaf44a43a2fb9d2611a871cbcfa66dc32b5aba6a85674dad08b4b789c026b7b06ae5391e11e8ed16b56bdca2647b40eeb356142db0c8fa10aeedc69646ddec134dcbadc255d32162da09188a898e1a97be7debda1671d9a8a5eb6f70ebdb408e571c35cb8828f33218a6fda2490fceb1ebc464c0ea81f2ab5b817279b70c8879b5a2db5cd6dd9441b4e4dec3d410138135da315845d1f66e9114dfa27b9b533f0e7743bf592205bdb7970919b0b3b56d948b8e9b6691e6668728d7cf895bd49ed6937754c76b46683ad606449ffeed601a39fee74782d970a2467e71ac0a8c094d7984a27681b6fd942f9e6bdd32c8ab44e074f2a721a24ccbe065be0df69956581658c63cfad96ab5e9d39eafa2fa54332d4bd6b8d88ec0fec8adcbffa92e947aeef789fa56d8643311980bf71ad798e37039f3f5e9d070d20d871fdae0cab1c29a936d16686cb0fd509b4611bda41718a6eadd71920379cfeb3b19e5b0e7e953db22379cc9231fe6d9656de94c4c6ecd341c44f0dd08dc05456627df0817f2f411697174f574eb25ba1c17bc0d4df03e9ffc698828d33218a61678de8961305c0fd91a33ee5fbe518cbcd79b8db793585f2e8777c120da37ce85dd5d01ff1123541d355598ecd1acc9a18e85b5e8be1643db2b321c65c8468ef851b16225ea4f9aef4f864b5144ae03a15fcc32ef03df7a15bf6d54895f8c2062cc12d17744c63ba0463a66e6ae6942f4e96a74edf69aef24b11421d0db87a3db4b60bbd08a6acf5cd89ca5f09f1cd3eb9319664750ded373e13b0614ed6e437581f9de64f83c8a909c94fc7650bb0593fe15aa325ab444f49d91d1300dff6625ec8e7a0cbe7c14fdbd1da87fc575e701ff53ed28dad686beaffad12143d57eb51dd56e377c4732d8677d3d08df22078a8fdbd1d4731927f6c996f13c8b79393f49ec3679412f5bc8e1a44b7922face9bf4308dfcc68fa0369ce7a21fd5bfe8c240591d9a5f71dc3590228d75681fc9cc2c073c3254bb8fd4ca9089a0f9401b32d53e0dbe598ee6737678b7d7c33df636e8e49969873d07881ef0c37fce2c4b36acfdf96cfb6d43c988e8c1bab7308d257598dccd393fea62320cb5bf92322f5f111fc4a036350d5c1ffbb7a0f1eb5a8af620b07becdf35653dbf12ee79e642aa6f12e618cb282217bfa5e59a6e4c675a11442f69db8a23917cc0891862c9cbf278bf658f13632941b9fcb2c1f510aa5f2884ef6018713339135f86e02f2947ffeca25b5f46da38d8cdd5683ea3f428886882261ea6c303e83ad66d86691ffacea469237d3380f0919d287eb919f68222a36c91131ed9e242671d4a5ff5a3f55d3f7c9e62d487cdf52f75a3794785bc9c36167b7678b0724708d16fb4a50422ef0610bce880b7ac14a38d444b96d1237f2c80bab75be1dfb85306f65d7ab5bf0922a4771e85d07d7a20a97597404f6f9f317b2902e3901c702ed1ee4c46e1ffc54ab9fd76797ca528de188411ff51f47536c3f7469bbe9c3823cf855e1e41e40f49e7449eafb0fc22d1443f0f632029cc131f8f74248d5dc7bdb909555aeffc4008cd2579c89e6674404db317a23547b6ec5fbef519430da5f035ca73b9a60e5d6619113d0062024607888ff735bb4a1c4d1a8b39d8552bdc33b5319756e178c12b3a3ed70a8f0aef028bb0cc748bda2e63ac647f4391702c740a67aed5dc9645d8979488a6d0d8f19b9abebd25c29903b9be47d4df6daca5396674ec4b1bb7da21bcb795bb45d305b9cecd3e112873ea83ee2d335da2a4c1189bdabfa748965985b32c20fae4e7eb782d757df9d2c6be8e8ec74d7e19db4eb7ce98f1ac43fda26dab47b8f4f30561cd2d12e57bc68e8dd50cbeef959fdf229c9b3a6e7b8f8832678af643feb21211d17dc8f8d02822a24711c39488480186291191020c5322220518a644440adc536ffe962d5bcc39227a94eddab5cb9ca36f33e130d582942798e8f1c0dff7f19bd0653e4f2cd1e345fb7de795e8f8f09e291191020c5322220518a644440a304c8988146098121129a02c4c238d85faffdc4cf7b239f2b072a31fc14b49ffe79388e811a2bc656a5f5e0eef266fd2ab1cf99638baf757a378697e669fe1444494219310a65508ec0924bd5ad0d17319d1d3b570238ce68dc5f05f342b13113d223276cfd4f27c3d3a7697c0723d84fa8676b5cf4d22227ac032da016579b914e5b381f8b16e84521e6c17eddc8952f75cd8f4fbacd998e52a46ddc148daa7700e9c6c4645514addc3c6739688881e848c8629a6e6234f7b28fcf56ef4fdc128d2841b0b91b7ba0e2138e1dbdb86b677eae09ed68d9d25f9706fee1ad38ad59ebdef74fbd011b3a33cb9eeba3c143686cd5a444419a6fda393f1dabc79b33977bb9187ed8d79285c1a230f92f306cd82de7a21f355589637e90fa71b7533265acab487c93944d547665934203c3972fd82fab175c5a0e8d86097755da2bed72c222225eef67b4fb764b6652ad97fa8354d6f091d6a458f6c917ab757c1a93d5f7fc4542bca5ff7ca772268ed341e621c391c44f0ba05de4db563ebc202cfab25b26e0f3ade1ffbbc7d22a24cc8789846bf4a0ebb28c2e7b47b9d79c85b68948cb1240ff97212bf683c5f3e120dc99f7624aeb6a3fd60caeb421cd9f2ddf09751766e1151c665384ce3487ca34d5db0d9b56902d03ba2b2644b549bde4d04d14bda348cd6ca529496a4bc3636438b5a5c8d21a64d89883228b3613a1c42f73139cdc983639e563012a223a17a370ed8676b530f025f09ed5e6ffa57a84ad62422caac8c8669747f1bdaaecb0bf5b22278f410b5c3b9406ba2ca903da92da7f8b80fdd726299e7d003d26675ca9f21447ab537537c5c873cdb5ce4bfa1b74f8988322a63613a70b20e156f0611cff1a0aab2c82c05dcebcae5457f14ad8d7e84935ba7c30368dddb2c2feaed287fc1a8ef5a570a37e2687e6b27c2c9035087a3686e90750712c85fea360b8988326742cf80badb634bb47f7432777348ffdbfca25c79f93e6a10d1d33de83e179541ea84775f08813516f33d8336ced42dd7cd2a28816fed4ad8b362081d6842ebc9049c9b5a11dae3c1c81a2375b1a008de8da5983b5a77008ed73ad0bdf7565d22ba7f7c5cd13869613a5ee319677afbcb22ec0bdcc2b329204ec4ccca695c3e542b3c050e61d5d7b10a478147d4b6f78b21f3fd64b1504094bf305217c29a5b24caf7748b41f37d225287e34cc74759cb94881e4dfcbd1f9f8c8f3325227a14314c8988146098121129c03025225280614a44a400c3948848810985a9363c421b2641448f070e8b1abf098d331dc140257a3c3048c7ef9ec2948888c6e23d5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a4c1192393f2e67cf9ec5a953a770edda35b384eec58c1933b06cd9322c5ebcd82c21a287d984c2540bd2d3a74fe3a73ffd299e7cf249b394eec5d5ab57f1e1871f62e9d2a50c54a247c0842ef3b5162983540ded1c6ae7523ba744f4f09b50986a97f60c5275b473c9db25448f067640111129c03025225280614a44a400c3948848818c85e9d7a75b50b9f6c758303b1bd9d9f2f5cc8ff0e3b5956839fdb559e31e450278516eefc53d9f990593ec831afdf8c7ec6ff86b9cda538f03117399881e3b1908d31b38b57d0516afaec181f309ccf949052a36ca57c153489c3f809ad58bf16263afacf5f0fa6cef06bcf8cb87fb3310d1fd99fc300db7a0fe37bd40c10efcfe7f7f8243ffd288c65df2f52f87f049f747a82a004efdca87a69366fdefba7f6cc4e0e0207e5739c72c2022ca40987e76fa14649462edab3e3c37d5281bf5778b50f77a199ec26738f041a7594844f4f0c9d83dd3ffbc71878be07f588c65980ecbfffb4f5c318b46ee4bd67c602e27e9acd2eeb9d6e0f6e8bd81de7d957871fe4c7ddd6716af43e5be944b6ff3fe6acd0746dd758b9fd1ebce9cbf021bf61875bffe0f3fd62f5f8099b23cfb991f637de3f1b1db1873cff433045667e347bfd4fe8ae914b6e5dfe9d888e85137e9613a67e9322c92d3ce5faec686c6f7d0fba7bf186f8c98ba0a7b06bfc4b9772b640bf5de5df9571fd6367c8a27fe6907f6b73462b5f5531cd8b2022bb6a484a1f4d93bebb1d67f05d67faac3fe401d964fff0ceffd722d36f9366095ef43585655a129b00365b3aea0f3571bb0e99dd1984ff103aca8dc8fc69f3f27e79f43d9aefd72dfebe41c113d6e26bf65ea94c1b473399ef8bfe7f19e0ca615f3adb225f863bc58568340472faefcd9ac779fae7c6ec5a623bfc7fe9a32bc545c81c6f7cf62ffcfa6e3b37d8d68099b954ca7ce4f47ddb1df614fa5ac5b5a85fdbb2b6400de4067db15acfab78fcc721ff6fc5b135ed2ca4f1e47fa3107d331e7272f61d92c8b9cb7c82f8e97e4be17ddd79702113d9c327299ffdceb8770feec6fb1e3e7cb31e7097941fea7f338f5410bb655acc082279fc18b5b3a7165d8ac7c8fa6ffac0c15cf9a0bbae978a9420bc95ebc7f4cbb6b9be427abb1769639af59381ffaff6d5af253ac5ea89718a6cf41ee1239bd9140dc2821224a2b63f74cbff7f42af8fed7217cf2c7017c79f6231cf2d7e1a59fccc113b2cd776adf7aacabbdfd727c22e6cf7d4ec6678a05f3315f4ece473e1ddbb2fc9befdd5e57f3cc9c944bf42c7cefafcd5922a2bbc85898de2283ece94558feaabcbc3efc09ce87eab0ecef202fc70fe0f0ff31aba83255db9b94d2b25cf6d433e65c8aff664e8988266872c3f4cf9da8d17ad7cb5aee70cf51869db30a75af6aedc14efcb1cf28bbb31bf8cb44eeb1def88b11a2ffdd8a1fe8054444936372c3f46f9e82f50979f1fec14778ff4f66591af13f6b17f88b604de9b931ca937d864bfde66c8a4faffcd19c4bd2fba93ec6f5b9bf7f2afd653d119122937c99ff1c5e7a79950cb2e3a8ffe77a9c4ad33cfdfa743d02ff7e0558ba1aab463a90acd3f57b97bde7cf1acba61b1f1c42e7057321c58ddfb52090fcdef07904f61ec0152cc3da35dae0acc93684bfdc67271a113dbc26fd9ee953afbe85b736ca683ce9c78bcf3c831fad5e8fca2d35a8d9b201eb962dc0e2d57e9cfadb5568dce9c3e81f682e5c87b54b812b7b3760852f80031d0710d8b20eabfff914ac05e947714ec7a7d8f6d28ba8dc7300efb50550e9598b6d278165ff73077c0eb3d224f9c10f9e903f7b71a83980f7b4e15e4631113d4632d001351dab76fd1e67437b50f58fb9c8ba720a07f6b5a065df7179d13e07cbdfd88f4f4eff366558d31cf8defd088d3f9f8fafff631b2a2bb6a1a56f3ad6feab2cfb076d4ce7ede6571ec647de2770a9751b36f8b6e1c36f7e84aa777f8fdf55a60f5f95a6176f42e3cf9e43fcdfe5be2bead179d97c83881e1b137a3ae9962d5bb075eb56738954f8f5af7f8d5dbb76994b44f4b0ca40cb9488e8d1c73025225280614a44a400c3948848018629119102130ad3193366e0ead5abe612dd2fed5c6ae794881e7e130ad365cb96e1c30f3f64a02aa09d43ed5c6ae794881e7e131a67aa397bf62c4e9d3a856bd7ae9925742fb416a916a48b17ebff4995881e72130e532222ba1d3ba08888146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a44a400c39488480186291191020c5322220518a644440a304c8988146098121129c03025225280614a4474df80ff029e8b9ab0ed34fa410000000049454e44ae426082, 'Zone 6, Bugo Cagayan De Oro City', 'Male', '09063661855', 'labe123', 'Single', 1, '2023-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subject`
--

CREATE TABLE `tbl_subject` (
  `subject_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `subject_code` varchar(50) NOT NULL,
  `subject_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subject`
--

INSERT INTO `tbl_subject` (`subject_id`, `emp_id`, `year_id`, `subject_code`, `subject_name`) VALUES
(8, 5, 1, 'MAT 171', 'Calculus 1 for Engineers'),
(9, 5, 1, 'MAT 076', 'Calculus 2'),
(10, 7, 1, 'MAT 133 ', 'Physics 1'),
(11, 1, 1, 'NCE 1201', 'Engineering Drawing and Plans'),
(12, 1, 1, 'NCH 1102', 'Chemistry for Engineers');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_test`
--

CREATE TABLE `tbl_test` (
  `test_id` int(11) NOT NULL,
  `test_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_test`
--

INSERT INTO `tbl_test` (`test_id`, `test_type`) VALUES
(1, 'Pre-test'),
(2, 'Post-test'),
(3, 'Exam-proper');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_type`) VALUES
(1, 'Admin'),
(2, 'Dean'),
(3, 'Head'),
(4, 'Assistant'),
(5, 'Faculty');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_year`
--

CREATE TABLE `tbl_year` (
  `year_id` int(11) NOT NULL,
  `year_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_year`
--

INSERT INTO `tbl_year` (`year_id`, `year_level`) VALUES
(1, 'First Year'),
(2, 'Second Year'),
(3, 'Third Year'),
(4, 'Fourth Year'),
(5, 'FifthYear'),
(6, 'Sixth Year'),
(7, 'Sevent Year');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `tbl_department`
--
ALTER TABLE `tbl_department`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tbl_result`
--
ALTER TABLE `tbl_result`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `stud_id` (`stud_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD PRIMARY KEY (`sched_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `student_id` (`stud_id`);

--
-- Indexes for table `tbl_section`
--
ALTER TABLE `tbl_section`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`stud_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `year_id` (`year_id`);

--
-- Indexes for table `tbl_test`
--
ALTER TABLE `tbl_test`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_year`
--
ALTER TABLE `tbl_year`
  ADD PRIMARY KEY (`year_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_department`
--
ALTER TABLE `tbl_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_question`
--
ALTER TABLE `tbl_question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_result`
--
ALTER TABLE `tbl_result`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_section`
--
ALTER TABLE `tbl_section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_test`
--
ALTER TABLE `tbl_test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_year`
--
ALTER TABLE `tbl_year`
  MODIFY `year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD CONSTRAINT `tbl_course_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `tbl_department` (`department_id`);

--
-- Constraints for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD CONSTRAINT `tbl_employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_employee_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`course_id`);

--
-- Constraints for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD CONSTRAINT `tbl_question_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tbl_test` (`test_id`),
  ADD CONSTRAINT `tbl_question_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employee` (`emp_id`);

--
-- Constraints for table `tbl_result`
--
ALTER TABLE `tbl_result`
  ADD CONSTRAINT `tbl_result_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tbl_test` (`test_id`),
  ADD CONSTRAINT `tbl_result_ibfk_2` FOREIGN KEY (`stud_id`) REFERENCES `tbl_students` (`stud_id`),
  ADD CONSTRAINT `tbl_result_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employee` (`emp_id`),
  ADD CONSTRAINT `tbl_result_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `tbl_section` (`section_id`),
  ADD CONSTRAINT `tbl_result_ibfk_5` FOREIGN KEY (`subject_id`) REFERENCES `tbl_subject` (`subject_id`);

--
-- Constraints for table `tbl_schedule`
--
ALTER TABLE `tbl_schedule`
  ADD CONSTRAINT `tbl_schedule_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employee` (`emp_id`),
  ADD CONSTRAINT `tbl_schedule_ibfk_3` FOREIGN KEY (`stud_id`) REFERENCES `tbl_student` (`student_id`);

--
-- Constraints for table `tbl_section`
--
ALTER TABLE `tbl_section`
  ADD CONSTRAINT `tbl_section_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `tbl_subject` (`subject_id`);

--
-- Constraints for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD CONSTRAINT `tbl_student_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employee` (`emp_id`),
  ADD CONSTRAINT `tbl_student_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `tbl_department` (`department_id`),
  ADD CONSTRAINT `tbl_student_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`course_id`);

--
-- Constraints for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD CONSTRAINT `tbl_students_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `tbl_year` (`year_id`),
  ADD CONSTRAINT `tbl_students_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employee` (`emp_id`),
  ADD CONSTRAINT `tbl_students_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `tbl_department` (`department_id`),
  ADD CONSTRAINT `tbl_students_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`course_id`);

--
-- Constraints for table `tbl_subject`
--
ALTER TABLE `tbl_subject`
  ADD CONSTRAINT `tbl_subject_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employee` (`emp_id`),
  ADD CONSTRAINT `tbl_subject_ibfk_2` FOREIGN KEY (`year_id`) REFERENCES `tbl_year` (`year_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
