var express = require('express');
var router = express.Router();
//localhost:300/users/registration
router.post('/registration', function(req,res,next){
  console.log(req.body);
  res.end();
})
module.exports = router;
