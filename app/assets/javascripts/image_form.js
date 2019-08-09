$(function() {
  var dropzone = $(".sell-form__upload-box__dropbox__container");
  var input_area = $(".sell-form__upload-box__dropbox__container__list");
  var preview = $("#preview");

  var images = [];
  var new_image_files = [];

  $(".sell-form__upload-box__dropbox").on("change", 'input[type= "file"]#upload-image', function() {
    var file = $(this).prop("files")[0];
    // console.log("show_file")
    // console.log(file);
    new_image_files.push(file);
    // console.log("show_new_image_files");
    // console.log(new_image_files);
    var reader = new FileReader();

    var img = $(`<div class="add_img">
                  <div class="img_area">
                    <img class="image">
                  </div>
                </div>`);
    var btn_wrapper = $(`<div class="btn_wrapper">
                          <a class="btn_delete">全削除</a>
                        </div>`);
    img.append(btn_wrapper);
    // console.log("show_img");
    // console.log(img);

    reader.onload = function(e) {
      img.find("img").attr({
        src: e.target.result
      });
    };
    reader.readAsDataURL(file);
    images.push(img);
    // console.log("show_reader_result");
    // console.log(reader.result);
    // console.log("show_images");
    // console.log(images);

    if (images.length <= 4) {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.data("image", index);
        // console.log("show_image_child");
        // console.log(image.find());
        preview.append(image);
        // console.log("show_preview")
        // console.log(preview)
      })
      dropzone.css({
        "width": `calc(100% - (20% * ${images.length}))`
      })
    } else if (images.length == 5) {
      $("#preview").empty();
      $.each(images, function(index, image) {
        // console.log("show_image")
        // console.log(image);
        image.data("image", index);
        preview.append(image);
      });
      dropzone.css({
        display: "none"
      });
    }

    var new_image = $(
      `<input multiple= "multiple" name="item_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
    );
    input_area.append(new_image);

    $(".sell-form__upload-box__dropbox").on("click", ".btn_delete", function() {

      var target_image = $(this).parent().parent();
      // console.log("show_target_image");
      // console.log(target_image);
      var target_image_num = target_image.data("image");
      // console.log("show_target_image_num");
      // console.log(target_image_num);

      target_image.remove();
      images.splice(target_image_num, 1);
      // console.log("images_after_delete");
      // console.log(images);
      new_image_files.splice(target_image_num, 1);
      // console.log("imagefiles_after_delete");
      // console.log(new_image_files);

      if(images.length == 0) {
        $('input[type= "file"]#upload-image').attr({
          "data-image": 0
        })
      }
      if (images.length <= 4) {
        $("#preview").empty();
        $.each(images, function(index, image) {
          // console.log("show_image");
          // console.log(image);
          image.data("image", index);
          preview.append(image);
        })
        dropzone.css({
          "width": `calc(100% - (20% * ${images.length}))`,
          "display": "block"
        })
      } else if (images.length == 5) {
        $("#preview").empty();
        $.each(images, function(index, image) {
          image.data("image", index);
          preview.append(image);
        })
        dropzone.css({
          "display": "none"
        })
      }
    })
  })

  $("#new_item").on("submit", function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    if (new_image_files.length == 0) {
      formData.append("new_images[images][]", " ");
    } else {
      new_image_files.forEach(function(file) {
        formData.append("new_images[images][]", file);
      });
    }
    $.ajax({
      url:         "/items",
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
    })
    return false;
  });
});