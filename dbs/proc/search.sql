
DELIMITER //
DROP PROCEDURE IF EXISTS search //
CREATE PROCEDURE 
  search( keyword varchar(100))
BEGIN  
	IF CHARACTER_LENGTH(keyword) = 0 THEN
		select post.id,tieuDe,noiDung,datePost,imgSrc,(select avg(star) from danhgia where danhgia.companyID=company.id )as star
		from post,company 
		where company.id=post.idCompany
        order by post.id; 
	ELSE
		SELECT post.id,tieuDe,noiDung,datePost,imgSrc, (select avg(star) from danhgia where danhgia.companyID=company.id )as star
		from post,company
		WHERE company.id=post.idCompany 
		and post.id in 
		(SELECT id FROM post
		WHERE 
		post.tieuDe like keyword or post.noidung like keyword or post.id in 
		(SELECT id FROM company
		WHERE name like keyword))
        order by post.id; 
    END IF;
END 
//
DELIMITER ;