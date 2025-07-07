CREATE TABLE IF NOT EXISTS `fx_hud` (
  `charid` varchar(50) DEFAULT NULL,
  `health` int(11) DEFAULT 1,
  `stamina` int(11) DEFAULT 1,
  `corehealth` int(11) DEFAULT 1,
  `corestamina` int(11) DEFAULT 1,
  `hunger` int(11) DEFAULT 1,
  `thirst` int(11) DEFAULT 1,
  `stress` int(11) DEFAULT 1,
  `xp` int(11) NOT NULL DEFAULT 1,
  `level` int(11) NOT NULL DEFAULT 1,
  `settings` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `fx_hud`
ADD COLUMN IF NOT EXISTS `health` INT(11) DEFAULT 1,
ADD COLUMN IF NOT EXISTS `stamina` INT(11) DEFAULT 1,
ADD COLUMN IF NOT EXISTS `corehealth` INT(11) DEFAULT 1,
ADD COLUMN IF NOT EXISTS `corestamina` INT(11) DEFAULT 1;

INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `metadata`, `desc`)
VALUES
    ('apple', 'Apple', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('consumable_haycube', 'Haycube', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('bandage', 'Bandage', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('bread', 'Bread', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('consumable_chocolate', 'Chocolate', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('snackplate', 'Snack Plate', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('cheese', 'Cheese', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('fruitcake', 'Fruit Cake', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('chocolatecake', 'Chocolate Cake', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('cookie', 'Cookie', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('consumable_kidneybeans_can', 'Kidneybeans', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('fruitplate', 'Fruit Plate', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('lobster', 'Lobster', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('oyster', 'Oyster', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('water', 'Water', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('coffe', 'Coffe', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('chamomiletea', 'Chamomiletea', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('beer', 'Beer', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('liquor', 'Liquor', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('gin', 'Gin', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('wine', 'Wine', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('whisky', 'Whisky', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('honeywhisky', 'Honey Whisky', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('cigarette', 'Cigarette', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('cigar', 'Cigar', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('adrenaline', 'Adrenalin', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('horseadrenaline', 'Horse Adrenalin', 10, 1, 'item_standard', 1, '{}', 'nice item'),
    ('horsebrush', 'Horse Brush', 10, 1, 'item_standard', 1, '{}', 'nice item')

ON DUPLICATE KEY UPDATE
    `item` = VALUES(`item`),
    `label` = VALUES(`label`),
    `limit` = VALUES(`limit`),
    `can_remove` = VALUES(`can_remove`),
    `type` = VALUES(`type`),
    `usable` = VALUES(`usable`),
    `metadata` = VALUES(`metadata`),
    `desc` = VALUES(`desc`);