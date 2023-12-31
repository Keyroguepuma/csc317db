var pathToFFMPEG = require("ffmpeg-static");
var promisify = require('util').promisify;
var exec = promisify(require("child_process").exec);
var db = require('../config/database');

module.exports = {
    makeThumbnail: async function (req, res, next) {
        if (!req.file) {
            next(new Error("File upload failed"));
        } else {
            try {
                var destinationOfThumbnail = `public/uploads/images/thumbnail-${req.file.filename.split(".")[0]}.png`;
                var thumbnailCommand = `"${pathToFFMPEG}" -ss 00:00:01 -i ${req.file.path} -y -s 200x200 -vframes 1 -f image2 ${destinationOfThumbnail}`;
                var { stdout, stderr } = await exec(thumbnailCommand);
                req.file.thumbnail = destinationOfThumbnail;
                next();
            } catch (error) {
                next(error);
            }
        }
    },
    getPostById: async function(req,res,next){
        var {id} = req.params;

        try{
            var [results, _] = await db.execute(`SELECT p.id, p.title, p.description, p.video, p.createdAt, u.username
            FROM posts p
            JOIN users u 
            ON p.fk_userId = u.id
            WHERE p.id = ?;` , [id]);

            const post = results[0];
            if(!post){
                req.flash("error", "This is not the post youre looking for")
                return req.session.save(function(err){
                    if (err) next(err);
                    return res.redirect('/')
                })



            }else{
                res.locals.post = post;
                next();

            }

        }catch(err){
            next(err)
        }

    },

    getCommenstsForPostId: async function(req,res,next){
        const {id} = req.params;
        try{
            var [results, _] = await db.execute(`SELECT c.id, c.text, c.createdAt, u.username
            FROM comments c
            JOIN users u
            ON c.fk_userId = u.id
            WHERE c.fk_postId=?;`, [id]);
            res.locals.post.comments = results;
            next();

        }catch(err){
            next(err);
        }
    },

    
    getRecentPosts: async function(req, res, next) {
        try{
            var [results, _] = await db.execute(`SELECT id, title, description, thumbnail, createdAt
            FROM posts
            ORDER BY createdAt DESC
            LIMIT 10;`);
            res.locals.results = results;
            next();
        
        }catch(err){
            next(err);

        }
    }
}