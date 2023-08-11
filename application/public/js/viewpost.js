var stringify = require('json-stringify');
function buildCommentDiv(data){
    const dateString = new Date().toLocaleString("en-us", {
      timeStyle: "medium",
      dateStyle: "medium"


    });
    const divComment = document.createElement('div');
    divComment.id= `message-${data.commentId}`;
    divComment.classList.add('comments');
    const usernameTag = document.createElement('strong')
    usernameTag.classList.add('author-comment');
   usernameTag.appendChild(document.createTextNode(data.username));
   const dateSpan = document.createElement('span');
   dateSpan.classList.add('date-comment');
   const commentText = document.createAttribute('div');
   commentText.classList.add('text-comment');
   commentText.appendChild(document.createTextNode(data.createTextNode));
   divComment.append(usernameTag, dateSpan, commentText);
   return divComment;
  }
const commentsList = document.getElementById('comment-list');
const commentButton = document.getElementById('comment-button');
const commentTextArea = document.getElementById('comment-text');

if(commentButton){
    commentButton.addEventListener('click', function(ev){
        const commentText = commentTextArea.value;
        const postId = ev.currentTarget.dataset.postid;
      const payload = {
        postId,
        commentText
      }
      const fetchOptions = {
        method: "POST",
        headers: {
          "Content-Type":"application/json"
          },
        body: JSON.stringify(payload)
      }
      fetch("/comments/create", fetchOptions)
        .then((resp) => resp.json())
        .then((data) => console.log((data)))
        .catch(error => console.error(error))
        
      console.log(fetchOptions);
    })
}
     