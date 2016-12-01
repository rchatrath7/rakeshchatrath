/**
 * Created by rchatrath on 11/25/2016.
 */
var slideIndex = 0;

function showSlides() {
    var i, j;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (j = slideIndex % 3; j < dots.length; j++){
        dots[j].className = dots[j].className.replace(" darken-color", "");
    }

    slideIndex++;
    if (slideIndex> slides.length) {slideIndex = 1}
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " darken-color";
    setTimeout(showSlides, 8000);
}
