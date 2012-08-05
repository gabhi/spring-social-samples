
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `roleName` varchar(40) NOT NULL DEFAULT 'ROLE_TRAVELER',
`enabled` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` VALUES(2, 'habuma', 'freebirds', 'Craig', 'Walls', 'ROLE_JOBSEEKER', 1);
INSERT INTO `Account` VALUES(3, 'kdonald', 'melbourne', 'Keith', 'Donald', 'ROLE_EMPLOYER', 1);
INSERT INTO `Account` VALUES(4, 'rclarkson', 'atlanta', 'Roy', 'Clarkson', 'ROLE_JOBSEEKER', 1);
INSERT INTO `Account` VALUES(5, 'abhijit', 'abhijit', 'abhijit', 'gaikwad', 'ROLE_JOBSEEKER', 1);




-- --------------------------------------------------------

--
-- Table structure for table `UserConnection`
--

DROP TABLE IF EXISTS `UserConnection`;
CREATE TABLE IF NOT EXISTS `UserConnection` (
  `userId` varchar(255) NOT NULL,
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(512) DEFAULT NULL,
  `imageUrl` varchar(512) DEFAULT NULL,
  `accessToken` varchar(256) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`providerId`,`providerUserId`),
  UNIQUE KEY `UserConnectionRank` (`userId`,`providerId`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
