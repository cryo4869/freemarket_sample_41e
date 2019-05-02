$(document).on('turbolinks:load', function () {
    $('.slick').slick({
      autoplay: true,
      autoplaySpeed: 3000,
      dots: true,
      arrows: true,
      prevArrow: '<div class="slide-arrow prev-arrow"></div>',
      nextArrow: '<div src="" class="slide-arrow prev-next"></div>',
    });
});
