DELIMITER //
#--------------------------------------------------------------add user in signup page---------------------------------------------
DROP PROCEDURE IF EXISTS `addUser`//

CREATE PROCEDURE `addUser`(
    IN  _fname  VARCHAR(100),
    IN  _lname  VARCHAR(100),
    IN  _phone  VARCHAR(15),
    IN  _email  VARCHAR(100),
    IN  _pass   VARCHAR(100))
BEGIN
    INSERT INTO users (first_name, last_name, phone, email, pass) VALUES (_fname,_lname,_phone,_email,_pass);
END;//

#--------------------------------------------------------------get user auth in login page---------------------------------------------
DROP PROCEDURE IF EXISTS `getUserAuth`//

CREATE PROCEDURE `getUserAuth`(
    IN  _email  VARCHAR(100),
    IN  _pass   VARCHAR(100))
BEGIN
    SELECT id, email FROM users WHERE email = _email AND pass = _pass;
END;//


#--------------------------------------------------------------get user info for profile page---------------------------------------------
DROP PROCEDURE IF EXISTS `getUserInfo`//

CREATE PROCEDURE `getUserInfo`(
    IN  _id  INT(11))
BEGIN
    SELECT * FROM users WHERE id = _id;
END;//

#--------------------------------------------------------------update user info for edit profile page---------------------------------------------
DROP PROCEDURE IF EXISTS `updateUserInfo`//

CREATE PROCEDURE `updateUserInfo`(
    IN  _id          INT,
    IN  _first_name  VARCHAR(100),
    IN  _last_name   VARCHAR(100),
    IN  _Bdate       DATE,
    IN  _phone       VARCHAR(15),
    in  _address     VARCHAR(500))
BEGIN
	IF _Bdate=NULL
	THEN
    UPDATE users
		SET    first_name = _first_name,
				last_name  = _last_name,
				phone      = _phone,
				address    = _address
		WHERE  id = _id;
	ELSE
    UPDATE users
		SET    first_name = _first_name,
				last_name  = _last_name,
				Bdate      = _Bdate,
				phone      = _phone,
				address    = _address
		WHERE  id = _id;
	END IF;
END;//

DELIMITER ;