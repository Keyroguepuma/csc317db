var container = document.getElementById('main-content');
var url = "https://jsonplaceholder.typicode.com/albums/2/photos";
var photoCounter = document.getElementById('counter-element');





function fadeout(ev){
    const divElement = ev.currentTarget;
    var counter = 1;
    var timer = setInterval(function(){
        counter -= 0.05;
        if(counter < 0){
            clearInterval(timer);
            container.removeChild(divElement);
            photoCounter.textContent = "The number of Photots are: " + container.children.length;
            
        }
        
        
        divElement.style.opacity = counter;
        
        
    },10);

}

function buildCardDOMAPI(data){
    var cardDiv = document.createElement('div');
    cardDiv.setAttribute('class', "photo");
    var imgTag=document.createElement('img');
    imgTag.src = data.thumbnailUrl;
    imgTag.alt = "something";
    var titleTag = document.createElement('p');
    titleTag.appendChild(document.createTextNode(data.title));
    cardDiv.appendChild(imgTag);
    cardDiv.appendChild(titleTag);
    cardDiv.addEventListener('click', fadeout);
    return cardDiv;
}


function build(data){
    return  `<div class="photo"> 
    <img src="${data.thumbnailUrl}" alt=""> 
    <p>${data.title}</p>
     </div>`;
}

fetch(url)
    .then(function(resp){
        return resp.json();
    })
    .then(function(data){
        var cards = data.map(function(photo){
            return buildCardDOMAPI(photo);
        });
        container.append(...cards);
        photoCounter.textContent = "The number of Photos are:  " + container.children.length; 
    })