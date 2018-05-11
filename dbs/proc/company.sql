DELIMITER //

#--------------------------------------------------------------get company info for company page---------------------------------------------
DROP PROCEDURE IF EXISTS `getCompanyInfo`//

CREATE PROCEDURE `getCompanyInfo`(
    IN  _companyName  VARCHAR(100))
BEGIN
    SELECT * FROM company WHERE name = companyName;
END;//

DELIMITER ;