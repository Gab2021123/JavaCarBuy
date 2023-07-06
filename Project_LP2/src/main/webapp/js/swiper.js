const swiper = new Swiper('.card_slider', {
    slidesPerView: 12,
    spaceBetween: 10,
    sliderPerGroup: 12,
    loop: true,
    centerSlide: "true",
    fade: "true",
    grabCursor: "true",
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
      dynamicBullets: true,
    },
  
    breakpoints:{
        0:{
            slidesPerView:1,
        },
        520:{
            slidesPerView:2,
        },
        768:{
            slidesPerView:3,
        },
        1000:{
            slidesPerView:4,
        },
        1278:{
            slidesPerView:5,
        },
        1478:{
            slidesPerView:6,
        },
        1668:{
            slidesPerView:7,
        },
        1878:{
            slidesPerView:8,
        },

        2068:{
            slidesPerView:9,
        },
        2268:{
            slidesPerView:10,
        },
        2568:{
            slidesPerView:11,
        },
        2778:{
            slidesPerView:12,
        },


    },
  });/**
 * 
 */