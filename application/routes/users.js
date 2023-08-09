var express = require('express');
var router = express.Router();
var bcrypt = require('bcrypt');
const db = require('../config/database');
const { doesUsernameExist, doesEmailExist } = require('../middleware/validation');

//localhost:300/users/registration
router.post('/registration', doesUsernameExist, doesEmailExist, async function(req,res,next){
  var {username,email,password} = req.body;
  //server side validation
  try{
    var [results, _] = await db.query(`select id from users where username = ?`, [username])
    if(results && results.length > 0){
      return res.redirect('/registration')
    } 
    var [results, _] = await db.query(`select id from users where email = ?`, [email])
     if(results && results.length > 0){
      return res.redirect('/registration')
    }

    // insert into db
    var hashedPassword = await bcrypt.hash(password, 5);

    var [insertResult, _] = await db.execute(`INSERT INTO users (username, email, password) VALUE (?,?,?)`, [username,email,hashedPassword])
   

    //respond
    if(insertResult && insertResult.affectedRows == 1){
      return res.redirect('/login')

    }else{
      return res.redirect('/register');

    }

  }catch(err){
    next(err);
  }


})

router.post("/login", async function(req,res,next){
  var { username, password} = req.body;
  try{
    var [results, _] = await db.execute(`select id, username, email, password from users where  username=? `,[username]);
    const user = results[0];
    if(!user){
      req.flash("error", "Login Failed: Invalid Credentials")
      return req.session.save(function(err){
        return res.redirect("/login");
      })
    }
    var passwordsMatch = await bcrypt.compare(password, user.password);

    if(passwordsMatch){
      req.session.user = {
        userId: user.id,
        username: user.username,
        email: user.email,
      }
      req.flash("success", "You are now logged in")
      return req.session.save(function(err){
        return res.redirect("/");
      })
    }else{
      req.flash("error", "Login Failed: Invalid Credentials")
      return req.session.save(function(err){
        return res.redirect("/login");
      })
    }
  }catch(err){
    next(err);
  }


})

router.post("/logout", function(req,res,next){
  req.session.destroy(function (err){
    if (err) next(err);
    return res.redirect("/");
  })
})

module.exports = router;
