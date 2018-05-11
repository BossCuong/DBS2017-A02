exports.job=function(req,res){
// load database len trang job
   //var sql="select tieuDe,noiDung,datePost,imgSrc from post,company where company.id=post.idCompany";
	sql= ' select post.id,tieuDe,noiDung,datePost,imgSrc,(select avg(star) from danhgia where danhgia.companyID=company.id )as star'
		+' from post,company'
		+' where company.id=post.idCompany'
		+' order by post.id;';  
   db.query(sql, function(err, result){  
     if(err){
            throw err;
        } else {     
			
            res.render('job.ejs', {data:result});                
        }
   });
};
//--------------------------------render detail post--------------------------------
exports.detail = function (req, res) {
	var postId = req.params.postId;
    //Get request parameter
    console.log('Open page for post id='+postId);

    //SQL query lay thong tin company
    var sql = SqlString.format("SELECT * FROM company WHERE name ="
	+ "(select name from company where company.id=(select idCompany from post where post.id= ?))", [postId]);
	
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
			//Lay bai dang co id =postId
			sql=SqlString.format("SELECT  * from post where id=? ;", [postId]);
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
						res.render('detail_post.ejs', {data:result,star:starAVG,danhgia:danhgia,post:Post});								
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