var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/index', function(req, res, next) {
  res.render('index', {title: 'Home'});
});
router.get("/login" , function(req,res,next){
  res.render('login', {title: 'Login'})
})
router.get("/postvideo" , function(req,res,next){
  res.render('postvideo', {title: 'Post Video'})
})
router.get("/registration" , function(req,res,next){
  res.render('registration', {title: 'Register'})
})
router.get("/viewpost" , function(req,res,next){
  res.render('viewpost', {title: 'View Post'})
})

module.exports = router;
