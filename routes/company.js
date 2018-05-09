//---------------------------------company page call-------------------------------
exports.company = function (req, res) {
    var message = '';
    var sql = "SELECT * FROM company";
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

    //Get request parameter
    var companyName = req.params.companyName;

    //SQL query
    var sql = SqlString.format("SELECT * FROM company WHERE name = ?", [companyName]);

    db.query(sql, (err, result) => {
        if (err) throw err;

        if (result.length > 0) {
            res.render('company_profile.ejs', {
                data: result
            });
        } else res.send('Page not found');
    });
};

exports.db = function (req, res) {
    // load database len 
    var sql = "SELECT * FROM company";
    db.query(sql, function (err, result) {
        if (err) throw err;
        else {
            res.render('index.ejs', {
                data: result
            });
        }
    });
};