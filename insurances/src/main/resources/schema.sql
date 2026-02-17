CREATE TABLE IF NOT EXISTS `insurances` (
    `insurance_id` int NOT NULL AUTO_INCREMENT,
    `mobile_number` varchar(15) NOT NULL,
    `insurance_number` varchar(100) NOT NULL,
    `insurance_type` varchar(100) NOT NULL,
    `total_insurance` int NOT NULL,
    `created_at` date NOT NULL,
    `created_by` varchar(20) NOT NULL,
    `updated_at` date DEFAULT NULL,
    `updated_by` varchar(20) DEFAULT NULL,
    PRIMARY KEY (`insurance_id`)
    );