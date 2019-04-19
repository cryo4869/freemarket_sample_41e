$(document).on('turbolinks:load', function() {
  //カテゴリー
  var middleCategory = $('#category-middle');
  var bottomCategory = $('#category-bottom');
  var size = $('#size');
  $('#category-top').on('change',function () {
    var topValue = $('#category-top option:selected').val();
    bottomCategory.hide();
    size.hide();
    if (topValue != '' ){
      $.ajax({
        url: '/sells/category_middle',
        type: "get",
        data: {
          parent_id: topValue
        }
      })
    .done (function () {
        middleCategory.show();
        size.show();
      })
    }
    else{
      middleCategory.hide();
    }
  });
  $('#category-middle').on('change',function () {
    var topValue = $('#category-top option:selected').val();
    var middleValue = $('#category-middle option:selected').val();
    if (topValue != '') {
      $.ajax({
        url: '/sells/category_bottom',
        type: "get",
        data: {
          top_id: topValue,
          parent_id: middleValue,
        }
      })
        .done (function () {
          bottomCategory.show();
        })
    }
  });
  $('#category-bottom').on('change',function () {
    var bottomValue = $('#category-bottom option:selected').val();
    if (bottomValue  != '') {
      $('#brand,#size').addClass('display-block');
    }
    else{
      $('#brand').removeClass('display-block');
    }
  });
    //配送方法
    $('#delivery_fee_owner').on("change",function() {
        var noselect = $('#delivery_fee_owner option:selected').val();
        if (noselect == 1 || noselect == 2){
            $('#shipping_method').removeClass('display-none').addClass('display-block');
        }else{
            $('#shipping_method').removeClass('display-block').addClass('display-none');
        }
        $.ajax({
            type: 'GET',
            url: '/sells/shipping_method',
            data: {
            delivery_fee_owner_id: $(this).val()
        }
    })
    .done (function (data) {
        $('.shipping-method').html(data);
        })
    });
    //価格表示
    $('#product_price').on('change',function () {
        var price = $('input[name="product[price]"]').val();
        var charge = price * 0.1;
        var SalesProfit = price - charge;
        if (price >= 300){
        $('#charge').text("").html(`¥${orgFloor(charge,1)}`);
        $('#profit').text("").html(`¥${orgCeil(SalesProfit,1)}`);
        }
        else{
          $('#charge , #profit').text('-');
        }
     //小数点処理
        function orgFloor(value,base) {
        return Math.floor(value * base) / base;
        }
        function orgCeil(value,base) {
        var inComma = Math.ceil(value * base) / base;
        return String(inComma).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
        }
    });
    //クリックしてアップロード
    var formCount = 0;
    $('#file-upload').on('click',function () {
      var test = $('input[name="images[image]['+formCount+']"]').eq(formCount);
        $('#file-upload').children('input[name="images[image][' + formCount + ']"]')[0].click();
    });
    //画像プレビュー
    $('#file-upload').on('change',$('#file-upload').children('input[name="images[image][' + formCount + ']"]'),function (e) {
      var imgCount= $('.sell-upload__item').length;
      var file = e.target.files[0];
      var reader = new FileReader();
        reader.onload = function (e) {
          formCount += 1;
          var count = 1 + imgCount;
          var count2 = 4 - imgCount;
            var imgsrc = e.target.result;
            var dropbox = $('.sell-upload__drop-box');
            if (imgCount > 8){
              dropbox.remove();
            }
              dropbox.each(function () {
                var html = appendImage(imgsrc);
                if (imgCount <= 4) {
                  $(this).removeClass(function (index,className) {
                    var removeClassName = 'have-item';
                    reg = new RegExp("\\b" + removeClassName +"\\S+",'g');
                    return (className.match(reg) || []).join(' ');
                  });
                  $(this).addClass('have-item-' + count);
                  $('.sell-upload__items').children('ul').eq(0).append(html);
                  image_tag = build_file_tag(count);
                  dropbox.append(image_tag);
                }
                else if(imgCount >= 4) {
                  $(this).removeClass(function (index,className) {
                    var removeClassName = 'have-item';
                    reg = new RegExp("\\b" + removeClassName +"\\S+",'g');
                    return (className.match(reg) || []).join(' ');
                  });
                  $(this).addClass('have-item' + count2);
                  $('.sell-upload__items').children('ul').eq(1).append(html);
                }
                });
            //プレビュー表示
          function build_file_tag(num) {
            var html = `<input name="images[image][${num}]" style="display: none;" type="file" id="image${num}">`;
            return html;
          }
          function appendImage(file) {
            var html = `<li class="sell-upload__item">
                  <figure class="sell-upload__figure">
                  <img class="file1" src="${file}">
                  </figure>
                  <div class="sell-upload__button">
                  <a href="" class="sell-upload__edit">編集</a>
                  <a href="">削除</a>
                  </div>
                  </li>`;
            return html;
          }
        };
        reader.readAsDataURL(file);
    });
  });
