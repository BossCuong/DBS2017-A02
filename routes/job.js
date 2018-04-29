exports.job=function(req,res){
// load database len trang job
   var sql="select * from job";          
   db.query(sql, function(err, result){  
     if(err){
            throw err;
        } else {           
            res.render('job.ejs', {data:result});                
        }
   });
};
