var express = require('express');
var router = express.Router();
const db = require('../config/database');

//localhost:300/users/registration
router.post('/registration', async function(req,res,next){
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
    var [insertResult, _] = await db.execute(`INSERT INTO users (username, email, password) VALUE (?,?,?)`, [username,email,password])


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

module.exports = router;
