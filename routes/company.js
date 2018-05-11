//---------------------------------company page call-------------------------------
exports.company = function (req, res) {
    var message = '';
    var sql = "select * from company";
    db.query(sql, function (err, result) {
        if (err) throw err;
        else {
            res.render('company.ejs', {
                data: result
            });
        }
    });

};

//--------------------------------render company profile--------------------------------
exports.profile = function (req, res) {
	var companyName = req.params.companyName;
    //Get request parameter
    console.log('Dang vao profile cua'+companyName);

    //SQL query lay thong tin company
    var sql = SqlString.format("SELECT * FROM company WHERE name = ?", [companyName]);
	
    db.query(sql, (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
			
			req.session.companyId=result[0].id;
            var starAVG=null; //rate TB
			
			//tinh rate tb
			sql=SqlString.format("SELECT avg(star) as avg FROM  danhgia where companyID=?  ", [req.session.companyId]);
			db.query(sql, function (err,avg) {
				if (err) throw err;
				else{					
						 starAVG=avg;
				}
			});
			
			var Post;
			//Lay vai bai dang moi nhat dua len profile
			sql=SqlString.format("SELECT  * from post where idCompany=? order by id desc;", [req.session.companyId]);
			db.query(sql, function (err,post) {
				if (err) throw err;
				else{	Post=post;				
						console.log('get post of company thanh cong');
						console.log(post.length);
				}
			});	
			
			//lay vai bai danh gia show len
			sql=SqlString.format("SELECT * FROM  danhgia where companyID=?  ", [req.session.companyId]);
			db.query(sql, function (err,danhgia) {
				if (err) throw err;
				else{	//sau khi load data,   load rate, cap nhap rate				
						res.render('company_profile.ejs', {data:result,star:starAVG,danhgia:danhgia,post:Post});								
				}
			});	
			
			
			
			
			
			
			
			
        } else res.send('Page not found');
    });
	
	
	//rate star
	if (req.method == "POST") { 
	    var post = req.body;		
        var cmt	=post.comment.substring(1, post.comment.length );
		var star=post.comment[0];		
		if(star!=0){ 
			console.log('user dang danh gia '+star+'sao');
			console.log('user dang cmt '+cmt);
			//tien hanh ghi lai danh gia vao bds, insert vao bang danh gia		
			sql=SqlString.format("insert into danhgia(star,cmt,userID,companyID)  values(?,?,?,?);",[star, cmt,req.session.userId,req.session.companyId]);
		
			db.query(sql, function (err) {
				if (err) throw err;
				else{					
					console.log('Danh gia cong ty thanh cong');
									
				}
			});			
		}		
	}
	
};

exports.db = function (req, res) {
    // load database len 
    var sql = "select * from company";
    db.query(sql, function (err, result) {
        if (err) throw err;
        else {
            res.render('index.ejs', {
                data: result
            });
        }
    });
};