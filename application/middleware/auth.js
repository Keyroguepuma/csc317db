module.exports = {
    isLoggedIn: function(req,res,next){
        if(req.session.user){
            next();
          }else{
            req.flash("error", "Error: Must be logged in to create a post!");
            req.session.save(function (err){
              if (err) next (err);
              res.redirect('/login')
            })
          }
    }
}