//--------------------------------render search --------------------------------
exports.search = function (req, res) {
    var message = '';

    res.render('searchPage.ejs', {
        message: message
    });

};

//---------------------------------------------signup page call------------------------------------------------------
exports.signup = function (req, res) {
    message = '';
    if (req.method == "POST") {
        var post = req.body;

        var email = post.email;
        var pass = post.password;
        var fname = post.first_name;
        var lname = post.last_name;
        var mob = post.mob_no;

        if (email == "" || pass == "" || lname == "" || fname == "" || mob == "") {
            message = "Please fill all";
            res.render('signup.ejs', {
                message: message
            });
            console.log("Missing information");
            return;
        } else console.log(`Signup sucessfully,accout detail: \n ${JSON.stringify(post,undefined,2)}`);

        var sql = "INSERT INTO `users`(`first_name`,`last_name`,`mob_no`,`email`, `password`) VALUES ('" + fname + "','" + lname + "','" + mob + "','" + email + "','" + pass + "')";
        var query = db.query(sql, function (err, result) {
            console.log(err);
            //if (err) throw err;
            message = "Successfully! Your account has been created.";
            res.render('signup.ejs', {
                message: message
            });
        });

    } else {
        res.render('signup');
    }
};

//-----------------------------------------------login page call------------------------------------------------------
exports.login = function (req, res) {
    var message = '';
    var sess = req.session;

    if (req.method == "POST") {
        var post = req.body;
        var name = post.user_name;
        var pass = post.password;

        var sql = "SELECT id, first_name, last_name, user_name FROM `users` WHERE `user_name`='" + name + "' and password = '" + pass + "'";
        db.query(sql, function (err, results) {
            if (results) {
                req.session.userId = results[0].id;
                req.session.user = results[0];
                console.log(results[0].id);
                res.redirect('/home/dashboard');
            } else {
                message = 'Wrong Credentials.';
                res.render('login.ejs', {
                    message: message
                });
            }

        });
    } else {
        res.render('login.ejs', {
            message: message
        });
    }

};
//-----------------------------------------------dashboard page functionality----------------------------------------------

exports.dashboard = function (req, res, next) {

    var user = req.session.user,
        userId = req.session.userId;
    console.log('ddd=' + userId);
    if (userId == null) {
        res.redirect("/login");
        return;
    }

    var sql = "SELECT * FROM `users` WHERE `id`='" + userId + "'";

    db.query(sql, function (err, results) {
        res.render('dashboard.ejs', {
            user: user
        });
    });
};
//------------------------------------logout functionality----------------------------------------------
exports.logout = function (req, res) {
    req.session.destroy(function (err) {
        res.redirect("/login");
    })
};
//--------------------------------render user details after login--------------------------------
exports.profile = function (req, res) {

    var userId = req.session.userId;
    if (userId == null) {
        res.redirect("/login");
        return;
    }

    var sql = "SELECT * FROM `users` WHERE `id`='" + userId + "'";
    db.query(sql, function (err, result) {
        res.render('profile.ejs', {
            data: result
        });
    });
};

//---------------------------------edit users details after login----------------------------------
exports.editprofile = function (req, res) {
    var userId = req.session.userId;
    if (userId == null) {
        res.redirect("/login");
        return;
    }

    var sql = "SELECT * FROM `users` WHERE `id`='" + userId + "'";
    db.query(sql, function (err, results) {
        res.render('edit_profile.ejs', {
            data: results
        });
    });
};