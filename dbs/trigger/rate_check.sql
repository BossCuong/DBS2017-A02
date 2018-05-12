drop trigger if exists rate_check;
delimiter //
 CREATE TRIGGER rate_check BEFORE insert ON danhgia
    FOR EACH ROW
   BEGIN
        declare msg varchar(128);
		if new.star=0 then 
		set msg = 'MyTriggerError: Please choose number Star you will rate this company!! ';
        signal sqlstate '45000' set message_text = msg;
     
		end if;
   END;//
 delimiter ;