CREATE TABLE IF NOT EXISTS `fx_pedmenu` (
  `charid` varchar(50) DEFAULT NULL,
  `data` longtext NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE IF NOT EXISTS `fx_pedmenu_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `charid` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `ped` varchar(100) NOT NULL,
  `request_date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

