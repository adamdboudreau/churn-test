var churnBoxColour = "333";
var churnBoxHeight = "250";
var i=0;
var imageSet = new Array();

if(window.location.href.indexOf("todaysparent") > -1) {		// Today's Parent images

    churnBoxColour = "00AAB5";
    churnBoxHeight = "200";

    imageSet[i++] = "https://www.todaysparent.com/wp-content/uploads/2017/06/slow-cooker-ribs-recipe-2560x1920-440x248.jpg";
    imageSet[i++] = "https://www.todaysparent.com/wp-content/uploads/2015/11/extreme-preemies-how-can-something-so-little-survive-440x248.jpg";
    imageSet[i++] = "https://www.todaysparent.com/wp-content/uploads/2017/10/toy-guide-2017-paw-patrol-toys-1280x960-440x248-1508773411.jpg";
    imageSet[i++] = "https://www.todaysparent.com/wp-content/uploads/2015/10/easy-halloween-face-painting-tutorials-440x248-1506018490.jpg";
    imageSet[i++] = "https://www.todaysparent.com/wp-content/uploads/2017/02/how-to-change-busy-toddlers-diaper-440x248.jpg";

}else{			// Macleans images

    imageSet[i++] = "http://www.macleans.ca/wp-content/uploads/2017/11/FEATURE-IMAGE-300x300.png";
    imageSet[i++] = "http://www.macleans.ca/wp-content/uploads/2017/11/NOV20_BETHUNE_WEATHER_FEATURE01.jpg";
    imageSet[i++] = "http://www.macleans.ca/wp-content/uploads/2017/11/MCINTYRE_HOUSING_FEATURE.jpg";
    imageSet[i++] = "http://www.macleans.ca/wp-content/uploads/2017/11/NOV23_CASTALDO_FEATURE01.jpg";
    imageSet[i++] = "http://www.macleans.ca/wp-content/uploads/2014/06/queens-park-300x300-1510689105.jpg";
}


var churnItemsLimit = 2;
var w = window.innerWidth;

if(w > 600){
    churnItemsLimit = 3;
}
if(w > 800){
    churnItemsLimit = 4;
}
if(w > 1000){
    churnItemsLimit = 5;
}


var injectHTML = "";
// Today's Parent Colour
// injectHTML += '<div class="churn-box" id="churnBox" style="display:none; margin: 0 auto 0 auto; position: fixed; width: 100%; height: 200px; text-align: center; top: 0px; z-index: 10000000; background-color: #00AAB5; padding: 5px; color: #FFFFFF; font-weight: bold;">';
// Other Colour
injectHTML += '<div class="churn-box" id="churnBox" style="display:none; margin: 0 auto 0 auto; position: fixed; width: 100%; height: '+churnBoxHeight+'px; text-align: center; top: 0px; z-index: 10000000; background-color: #'+churnBoxColour+'; padding: 5px; color: #FFFFFF; font-weight: bold;">';
injectHTML += '<div class="churn-x" style="float: right; font: Helvetica; font-size: 20px; margin-top: 10px; margin-right: 10px; cursor: pointer;" onclick="closeChurnBox();">X</div><br clear="all" />';
injectHTML += '<div class="churn-items" style="margin: auto; text-align: center; display: inline-block;">';
for(var i=0;i<churnItemsLimit;i++){
    injectHTML += '<div class="churn-item" style="display: inline-block; float: left; padding: 5px;">';
    injectHTML += '<div class="churn-item-img">';
    // injectHTML += ' <img src="https://www.todaysparent.com/wp-content/uploads/2017/02/Nickelodeons-refreshing-new-princess-is-our-favorite-girl-power-advocate--300x225.png" width="150" height="112.5" />';
    injectHTML += ' <img src="'+imageSet[i]+'" width="150" height="112.5" />';
    injectHTML += '</div>';
    injectHTML += '<div class="churn-item-heading">Related Item '+(i+1)+'</div>';
    injectHTML += '</div>';
}
injectHTML += '</div>';
injectHTML += '</div>';


// Today's Parent Article
// document.getElementById("infiniteScrollStream").innerHTML += injectHTML;

// Elsewhere
document.getElementsByTagName("body")[0].innerHTML += injectHTML;


function openChurnBox(){

    // document.getElementById("infiniteScrollStream").style.marginTop = "200px";
    document.getElementById("churnBox").style.display = "";

}

function closeChurnBox(){

    document.getElementById("churnBox").style.display = "none";
    // document.getElementById("infiniteScrollStream").style.marginTop = "0px";

}



// Detects URL bar movement on desktop

var mouseY = 0;
var topValue = 0;
window.addEventListener("mouseout",function(e){
        mouseY = e.clientY;
        if(mouseY<topValue) {
            // alert("Check out this related content (URL)");

            console.log("Check out this related content (URL)");
            openChurnBox();
        }
    },
    false);

// Scroll velocity detection

var checkScrollSpeed = (function(settings){
    settings = settings || {};

    var lastPos, newPos, timer, delta,
        delay = settings.delay || 50; // in "ms" (higher means lower fidelity )

    function clear() {
        lastPos = null;
        delta = 0;
    }

    clear();

    return function(){
        newPos = window.scrollY;
        if ( lastPos != null ){ // && newPos < maxScroll
            delta = newPos -  lastPos;
        }
        lastPos = newPos;
        clearTimeout(timer);
        timer = setTimeout(clear, delay);
        return delta;
    };
})();



// listen to "scroll" event
window.onscroll = function(){
    var scrollSpeed = checkScrollSpeed();
    if (scrollSpeed < -220 || scrollSpeed > 220){

        console.log("Check out this related content (ScrollVelocity: "+scrollSpeed+")");
        openChurnBox();

    }
};

