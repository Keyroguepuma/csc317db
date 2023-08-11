var express = require('express');
const { isLoggedIn } = require('../middleware/auth');
const { getRecentPosts} = require('../middleware/posts');
var router = express.Router();

/* GET home page. */
router.get('/', getRecentPosts, function(req, res, next) {
   res.render('index', { title: 'Home'});
  
});
router.get("/login" , function(req,res,next){
  res.render('login', {title: 'Login'})
})

router.get("/postvideo" , isLoggedIn, function(req,res,next){
  res.render('postvideo', {title: 'Post Video'})
})
router.get("/registration" , function(req,res,next){
  res.render('registration', {title: 'Register'/*, js:["validation.js"]*/})
})


module.exports = router;
