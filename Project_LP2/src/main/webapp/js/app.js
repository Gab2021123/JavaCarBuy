

//Entrada de variables de la pagina web
let btnDisplayCar=document.getElementById('btn_display--car');
let car_buy=document.getElementById('car-buy');
let menuDisplay=document.getElementById('btn-Menu');
let menu_left=document.getElementById('menu-left');
let content=document.getElementById('content');
let section=document.getElementById('section');
let iconDisplay=document.querySelectorAll('#icon_menu');
let menuLeftDisplay=document.getElementById('menu_left_list');
let menu_on=false;


/**
 * Modal script
 */




let enlaceMenu_on=false;


//Evento para abrir o cerrar el modal






/*Eventos para despleggar el nuevo menu que se creara*/
function displayMenuLeft(){
   if(menu_on==false){
      menu_left.classList.add("iconDisplay");
      content.style.left="5rem";
      section.style.left="5rem";
      menuLeftDisplay.style.width="5rem";
      menu_on=true;
   }
   else{
      menu_left.classList.remove('iconDisplay');
      content.classList.remove('display_main_virtual');
      content.style.left="0rem";
      section.style.left="0rem";
      menu_on=false;
   }
}

function displayEnlaceMenu(){

     
   if(enlaceMenu_on==false){
         menu_left.style.width="11rem";
         content.style.left="11rem";
         section.style.left="11rem";
         menuLeftDisplay.style.overflow="visible";
         console.log("Desliza el main")
         enlaceMenu_on=true;
   }else{
      menu_left.style.width="5rem";
      menuLeftDisplay.style.overflow="hidden";
      content.style.left="5rem";
      section.style.left="5rem";
      console.log("no delsiza el main");
      enlaceMenu_on=false;
   }
   
   
}

/*Se ps*/
menuDisplay.addEventListener('click',displayMenuLeft);
for(let i=0;i<iconDisplay.length;i++){
let enlaces=iconDisplay[i];
enlaces.addEventListener('click',displayEnlaceMenu);

}

/**Modificar la cantidad de carritos de compras */

let valorInicial=0;
let deshabilitadoBtn=document.getElementById('btn');
document.getElementById("btn").disabled=true;
const añadirServicios=(valuePar)=>{
    document.getElementById('amount').value;
    if(valuePar.value == 'increase'){
        valorInicial++;
    }else {
        valorInicial--;
    }
    document.getElementById("amount").textContent=valorInicial;
if(valorInicial===0){
        document.getElementById("btn").disabled=true;
}
else{
        document.getElementById("btn").disabled=false;  
}
}


/**
 * 
 */