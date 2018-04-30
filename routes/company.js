//--------------------------------render company profile--------------------------------
exports.profile = function (req, res) {
    var message = '';
    console.log(req.params.companyName);
    res.render('company_profile.ejs', {
        message: message
    });

};
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