
exports.search = function (req, res) {
	if (req.method == "POST") {
	    var post = req.body;
        var keyword = post.search_Box;	
		var kqText='';
		var kqJobText='';
		
		var sql = "call search('%"+keyword+"%')";
		
		db.query(sql, function (err, result) {
        if (err) throw err;
        else {
			if(keyword!=""){
				kqText='Kết quả tìm kiếm "'+keyword+ '"';				
			}
			if(result[0].length==0)kqJobText='Rất tiếc không có kết quả nào.';
			else	kqJobText='Có '+result[0].length+' công việc dành cho bạn';	
            
			res.render('searchPage.ejs', {
                data: result,kqText: kqText,kqJobText:kqJobText});
        }
		});
	}
};