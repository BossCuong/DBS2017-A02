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