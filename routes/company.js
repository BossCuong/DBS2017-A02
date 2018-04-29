//--------------------------------render company --------------------------------
exports.profile = function (req, res) {
    var message = '';

    res.render('company_profile.ejs', {
        message: message
    });

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