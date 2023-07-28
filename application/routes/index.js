var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'CSC 317 App', name:"Adrian Jimenez" });
});
router.get("/login" , function(req,res,next){
  res.render('login')
})
router.get("/postvideo" , function(req,res,next){
  res.render('postvideo')
})
router.get("/registration" , function(req,res,next){
  res.render('registration')
})
router.get("/viewpost" , function(req,res,next){
  res.render('viewpost')
})

module.exports = router;
