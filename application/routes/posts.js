var express = require('express');
var router = express.Router();
var multer = require('multer');
const { makeThumbnail } = require('../middleware/posts');
const { isLoggedIn } = require('../middleware/auth');
const db = require('../config/database');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/uploads/videos')
    },
    filename: function (req, file, cb) {
        const fileExt = file.mimetype.split('/')[1];
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
        cb(null, `${file.fieldname}-${uniqueSuffix}.${fileExt}`)
    }
  })
  
  const upload = multer({ storage: storage })


//localhost:3000/posts/create
router.post('/create', isLoggedIn, upload.single('videofile'), makeThumbnail, 
    async function(req,res,next){
    var {title, description} = req.body;
    var { path, thumbnail} = req.file;
    var {userId} = req.session.user;
    try{
        var [insertResult, _] = await db.execute(`INSERT INTO posts (title, description, video, thumbnail, fk_userId)
        VALUE
        (?,?,?,?,?);`,[title,description, path, thumbnail, userId]);

        if(insertResult && insertResult.affectedRows){
            req.flash("success", "Your post was created")
            return req.session.save(function(err){
                if (err) next (err);
                return res.redirect('/');
            })
        }else{
            req.flash("error", "Your post could not be made, please try again later")
            return req.session.save(function (err){
                if (err) next (err);
                return res.redirect('/postvideo')
            })
        }

    }catch(err){
        next(err);
    }
})



module.exports = router;
