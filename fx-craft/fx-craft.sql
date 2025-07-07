CREATE TABLE IF NOT EXISTS `fx_craft_book` (
    `bookId` VARCHAR(50) PRIMARY KEY,
    `bookName` VARCHAR(100),
    `allowedJobs` TEXT NOT NULL,     
    `createdAt` VARCHAR(20) DEFAULT NULL,
    `craftData` LONGTEXT NOT NULL DEFAULT '[]'
);



CREATE TABLE IF NOT EXISTS `fx_craft_player` (
    `charid` VARCHAR(50) NOT NULL,
    `job` VARCHAR(50) NOT NULL,
    `totalProduction` INT DEFAULT 0,
    `currentXP` INT DEFAULT 1,
    `currentLevel` INT DEFAULT 1,
    PRIMARY KEY (`charid`, `job`)
);

