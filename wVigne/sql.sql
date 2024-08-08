INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_vigneron', 'Vigne', 1);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_vigneron', 'Vigne', 1);

INSERT INTO `jobs` (`name`, `label`) VALUES
('vigne', 'Vigne');

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`) VALUES
('vigne', 0, 'recruit', 'Recrue', 10),
('vigne', 1, 'experimente', 'Expérimenté', 240),
('vigne', 2, 'boss', 'Patron', 400)
;