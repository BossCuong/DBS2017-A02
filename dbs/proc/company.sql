DELIMITER //

#--------------------------------------------------------------get company info for company page---------------------------------------------
DROP PROCEDURE IF EXISTS `getUserInfo`//

CREATE PROCEDURE `getCompanyInfo`(
    IN  _companyName  VARCHAR(100))
BEGIN
    SELECT * FROM company WHERE name = companyName;
END;//

DELIMITER ;