var bcrypt = require('bcrypt');
const db = require('../config/database');
var validator = require('validator');
const e = require('express');

module.exports ={
    checkUsername : async function(req,res,next){
        var{username} = req.body;
        var [results, _] = await db.query(`select id from users where username =?`, [username])
        if(validator.isEmpty(username)){
            req.flash("error", "Error: Not valid username");
            req.session.save(function (err){
                if (err) next (err);
                res.redirect('/registration')
        })
        }else{
            next();
        }
    },
    checkEmail : async function(req,res,next){
        var{email} = req.body;
        var [results, _] = await db.query(`select id from users where email =?`, [email])
        if(!validator.isEmail(email)){
            req.flash("error", "Error: Not valid email");
            req.session.save(function (err){
                if (err) next (err);
                res.redirect('/registration')
        })
        }else{
            next();
        }
        
    },
    checkPassword : async function(req,res,next){
        var{password, password2} = req.body;
        var [results, _] = await db.query(`select id from users where password =?`, [password])
        if(!validator.isStrongPassword(password)){
            req.flash("error", "Error: Not valid password");
            req.session.save(function (err){
                if (err) next (err);
                res.redirect('/registration')
        })
        }else{
            next();
        }
        if(password != password2){
            req.flash("error", "Error: Passwords must match");
            req.session.save(function (err){
                if (err) next (err);
                res.redirect('/registration')
        })

        }else{
            next();

        }
    },
    doesUsernameExist : async function(req,res,next){
        var {username} = req.body;
        var [results, _] = await db.query(`select id from users where username = ?`, [username])
     if(results && results.length > 0){
        req.flash("error", "Error: Username already exists");
        req.session.save(function (err){
            if (err) next (err);
            res.redirect('/registration')
    })
    }else{
        next();
    }
    },
    
    doesEmailExist: async function(req,res,next){
     var {email} = req.body;
        var [results, _] = await db.query(`select id from users where email = ?`, [email])
     if(results && results.length > 0){
        req.flash("error", "Error: Email already exists");
        req.session.save(function (err){
            if (err) next (err);
            res.redirect('/registration')
    })
    }else{
        next();
    }
    },
    
}
