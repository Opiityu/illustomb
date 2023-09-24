/*global Swiper*/

/*global Swiper*/

const swiper = new Swiper('.swiper', {
  // Options
  loop: true, // Infinite loop
  pagination: {
    el: '.swiper-pagination', // Pagination element
  },
  navigation: {
    nextEl: '.swiper-button-next', // Next button element
    prevEl: '.swiper-button-prev', // Previous button element
  },
  autoplay: {
    delay: 3000, // Time between slides in milliseconds (5 seconds in this example)
  },
});
