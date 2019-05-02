$(document).on('turbolinks:load', function () {
  var sub_photo = $('.item-details__main__photo__sub');
  var top_photo = $('.item-details__main__photo__top');

  sub_photo.children('img').on('mouseover', function () {
    sub_photo.children('img').css('opacity', '0.4');
    $(this).css('opacity', '1');

    small_image_src = $(this).attr('src');
    top_photo.children('img').attr('src', small_image_src);
  })
});
