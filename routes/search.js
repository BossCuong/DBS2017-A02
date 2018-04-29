
exports.search = function (req, res) {
	if (req.method == "POST") {
	    var post = req.body;
        var keyword = post.search_Box;	
			
		var sql = "select * from post";
		db.query(sql, function (err, result) {
        if (err) throw err;
        else {
            res.render('searchPage.ejs', {
                data: result,keyword: keyword
    
            });
        }
		});
	}
};