exports.job=function(req,res){
// load database len trang job
   //var sql="select tieuDe,noiDung,datePost,imgSrc from post,company where company.id=post.idCompany";
	sql= ' select tieuDe,noiDung,datePost,imgSrc,(select avg(star) from danhgia where danhgia.companyID=company.id )as star'
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
