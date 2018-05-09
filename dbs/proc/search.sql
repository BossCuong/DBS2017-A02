
DELIMITER //
DROP PROCEDURE IF EXISTS search //
CREATE PROCEDURE 
  search( keyword varchar(100))
BEGIN  
	IF CHARACTER_LENGTH(keyword) = 0 THEN
		SELECT tieuDe,noiDung,datePost,imgSrc from post,company
		WHERE company.id=post.idCompany ; 
	ELSE
		SELECT tieuDe,noiDung,datePost,imgSrc from post,company
		WHERE company.id=post.idCompany 
		and post.id in 
		(SELECT id FROM post
		WHERE 
		post.tieuDe like keyword or post.noidung like keyword or post.id in 
		(SELECT id FROM company
		WHERE name like keyword)); 
    END IF;
END 
//
DELIMITER ;
