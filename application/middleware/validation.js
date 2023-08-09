var bcrypt = require('bcrypt');
const db = require('../config/database');
module.exports ={
    checkUsername : function(req,res,next){
        next();
    },
    checkEmail : function(req,res,next){
        next();
    },
    checkPassword : function(req,res,next){
        next();
    },
    doesUsernameExist : async function(req,res,next){
        var {username} = req.body;
        var [results, _] = await db.query(`select id from users where username = ?`, [username])
        if(results && results.length > 0){
          return res.redirect('/registration')
        } else{
            next();
            //look at loging for flash message
        }
    },
    doesEmailExist: async function(req,res,next){
     var {email} = req.body;
        var [results, _] = await db.query(`select id from users where email = ?`, [email])
     if(results && results.length > 0){
      return res.redirect('/registration')
    }else{
        next();
    }
    },
    
}
