$(document).on('turbolinks:load', function() {
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
        $('#charge').text("").html(`¥${charge}`);
        $('#profit').text("").html(`¥${SalesProfit}`);
    });
    //クリックしてアップロード
    $('#file-upload').on('click',function () {
        $('#file').get(0).click();
    });
    //画像プレビュー
    function buildHtml(file) {
    var preview = $('.sell-upload__items');
    var list = $('#list1');
    var html = `<li class="sell-upload__item">
                  <figure class="sell-upload__figure">
                  <img class="file1" src="${file}">
                  </figure>
                  </li>`;
      list.append(html);
    }
    function buildHtml2(file){
      var preview2 = $('.sell-upload__items2');
      var list = $('#list2');
      var html = `<li class="sell-upload__item">
                  <figure class="sell-upload__figure">
                  <img class="file2" src="${file}">
                  </figure>
                  </li>`;
      preview2.append(html);
    }
    $('#file').on('change',function () {
      if (!this.files.length) {
        alert("画像ファイルを指定してください。");
        return false;
      }
      var files = $(this).prop('files');
      var len = files.length;
      for ( var i = 0; i < len; i++ ) {
        var file = files[i];
        var reader = new FileReader();
      }
        reader.onload = function (e) {
            var src = e.target.result;
            var imgCount= $('.sell-upload__item').length;
            var dropbox = $('.sell-upload__drop-box');
            var itemcontainer = $('.sell-upload__items-container');
          if (imgCount <= 4){
            while(imgCount >= 4) {
              dropbox.addClass(
                function (index) {
                  return 'have-item' + -1;
                })
            }
            //dropbox.removeClass('have-item-0').addClass('have-item-1');
            buildHtml(src);
          }else{
            buildHtml2(src);
          }
        };
        reader.readAsDataURL(file);
    });
  });
