//---------------------------------------------signup page call------------------------------------------------------
//Get user data from request
var getUserData = (req_data) => {
    var userData = {
        email: req_data.email,
        pass: req_data.password[0],
        re_pass: req_data.password[1],
        fname: req_data.first_name,
        lname: req_data.last_name,
        mob: req_data.mob_no,
    }

    return userData;
}
//
var ConfirmingPassWord = (pass, re_pass) => {
    if (pass !== re_pass) {
        var err = {
            message: "Error ! Password does not match the confirm password.",
            alert: true
        };
        throw err;
    }
}
//Hashing password
var Hashing = (text) => {
    return SHA256(text).toString();
}
exports.signup = function (req, res) {
    message = '';
    if (req.method == "POST") {
        var post = req.body;

        var user = getUserData(post);

        hash_pass = Hashing(user.pass);

        var duplicate_no = 1062;

        var sql = SqlString.format('CALL addUser(?,?,?,?,?)', [user.fname, user.lname, user.mob, user.email, hash_pass]);

        try {
            ConfirmingPassWord(user.pass, user.re_pass);

        } catch (err) {
            console.log(JSON.stringify(err, undefined, 2));
            res.render('signup.ejs', {
                message: err.message,
                alert: err.alert
            });
            return;
        }
        db.query(sql, (err, result) => {

            if (err) {
                console.log(JSON.stringify(err, undefined, 2));
                if (err.errno === duplicate_no) {
                    message = "Error! That email is taken"
                    res.render('signup.ejs', {
                        message: message,
                        alert: true
                    })
                }

                return;
            }

            message = "Successfully! Your account has been created.";
            res.render('signup.ejs', {
                message: message,
                alert: false
            });
        });

    } else { //GET method
        if (req.session.userId == null) {
            res.render('signup.ejs', {
                message: message,
                alert: false
            });
        } else {
            res.redirect('/');
        }
    }
};

//-----------------------------------------------login page call------------------------------------------------------
exports.login = function (req, res) {
    var message = '';
    var sess = req.session;
    if (req.method == "POST") {
        var post = req.body;
        var email = post.email;
        var pass = post.password;

        hash_pass = SHA256(pass).toString();

        var sql = SqlString.format('CALL getUserAuth(?,?)', [email, hash_pass]);

        db.query(sql, function (err, results) {
            if (err) throw err;
            console.log(JSON.stringify(results[0], undefined, 2));
            if (results[0].length > 0) {
                req.session.userId = results[0][0].id;
                req.session.user = results[0][0];
                res.redirect('/profile');
            } else {
                message = 'Email or password is not correct.';
                res.render('login.ejs', {
                    message: message
                });
            }

        });
    } else if (req.session.userId == null) {
        res.render('login.ejs', {
            message: message
        });
    } else {
        res.redirect('/');
    }

};
//-----------------------------------------------dashboard page functionality----------------------------------------------

// exports.dashboard = function (req, res, next) {

//     var user = req.session.user,
//         userId = req.session.userId;
//     console.log('ddd=' + userId);
//     if (userId == null) {
//         res.redirect("/login");
//         return;
//     }

//     var sql = "SELECT * FROM `users` WHERE `id`='" + userId + "'";

//     db.query(sql, function (err, results) {
//         res.render('dashboard.ejs', {
//             user: user
//         });
//     });
// };
//------------------------------------logout functionality----------------------------------------------
exports.logout = function (req, res) {
    req.session.destroy(function (err) {
        res.redirect("/login");
    })
};
//--------------------------------render user details after login--------------------------------
exports.profile = function (req, res) {

    console.log("Login successfully");
    var userId = req.session.userId;
    if (userId == null) {
        res.redirect("/login");
        return;
    }

    var sql = SqlString.format('CALL getUserInfo(?)', [userId]);
    db.query(sql, function (err, result) {
        res.render('profile.ejs', {
            data: result[0][0]
        });
    });
};

//---------------------------------edit users details after login----------------------------------
exports.editprofile = function (req, res) {
    var userID = req.session.userId;
    if (userID == null) {
        res.redirect("/login");
        return;
    }
    var message = "";
    if (req.method == "POST") {
        var post = req.body;
        console.log(JSON.stringify(post, undefined, 2));
        var first_name = post.first_name;
        var last_name = post.last_name;
        var Bdate = post.Bdate;
        var phone = post.phone;
        var address = post.address;

        
		
        var sql = SqlString.format('CALL updateUserInfo(?,?,?,?,?,?)', [userID, first_name, last_name, Bdate, phone, address]);
        db.query(sql, (err, results) => {
            if (err) console.log(JSON.stringify(err, undefined, 2));
            res.redirect('profile');
        });
    } else { //GET method
        var sql = SqlString.format('CALL getUserInfo(?)', [userID]);
        db.query(sql, function (err, results) {
            res.render('edit_profile.ejs', {
                data: results[0][0],
            });
        });
    }
};