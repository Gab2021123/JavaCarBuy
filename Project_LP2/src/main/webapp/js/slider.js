/**
 * 
 */const slider=document.querySelector('#slider');
let sliderSection=document.querySelectorAll('.slider_section');
let sliderSectionLast=sliderSection[sliderSection.length-1];

const btnLeft =document.querySelector('#arrowLeft');
const btnRigth =document.querySelector('#arrowRight');

slider.insertAdjacentElement('afterbegin',sliderSectionLast);

function moveRight(){
    let sliderSectionFirst=document.querySelectorAll('.slider_section')[0];
    slider.style.marginLeft="-200%";
    slider.style.transition="all 0.5s";
    setTimeout(function(){
        slider.style.transition="none";
        slider.insertAdjacentElement('beforeend',sliderSectionFirst);
        slider.style.marginLeft="-100%";
    },500)
};
function moveLeft(){
    let sliderSection=document.querySelectorAll('.slider_section');
    let sliderSectionLast=sliderSection[sliderSection.length-1];
    slider.style.marginLeft="0";
    slider.style.transition="all 0.5s";
    setTimeout(function(){
        slider.style.transition="none";
        slider.insertAdjacentElement('afterbegin',sliderSectionLast);
        slider.style.marginLeft="-100%";
    },500)
};

btnLeft.addEventListener('click',moveLeft);
btnRigth.addEventListener('click',moveRight);

setInterval(moveRight,5000);