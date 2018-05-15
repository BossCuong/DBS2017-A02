DELIMITER //
CREATE TRIGGER before_users_update 
    BEFORE UPDATE ON users
    FOR EACH ROW 
BEGIN
    INSERT INTO users_edit
    SET action = 'update',
        first_name = OLD.first_name,
        last_name  = OLD.last_name,
        phone      = OLD.phone,
        address    = OLD.address,
        Bdate      = OLD.Bdate,
        changeDate = NOW();
END//
DELIMITER ;