exports.job=function(req,res){
// load database len trang job
   var sql="select tieuDe,noiDung,datePost,imgSrc from post,company where company.id=post.idCompany";          
   db.query(sql, function(err, result){  
     if(err){
            throw err;
        } else {     
			
            res.render('job.ejs', {data:result});                
        }
   });
};
