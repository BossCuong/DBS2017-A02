module.exports.user = (req, res) => {

    var sql;
    sql = "SELECT * FROM users";

    db.query(sql, (err, result) => {
        res.json(result);
    })
}


module.exports.company = (req, res) => {

    var sql;
    sql = "SELECT * FROM company";

    db.query(sql, (err, result) => {
        res.json(result);
    })
}

module.exports.post = (req, res) => {

    var sql;
    sql = "SELECT * FROM post";

    db.query(sql, (err, result) => {
        res.json(result);
    })
}

module.exports.user_edit = (req, res) => {

    var sql;
    sql = "SELECT * FROM users_edit";

    db.query(sql, (err, result) => {
        res.json(result);
    })
}