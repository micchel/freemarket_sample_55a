$(function() {

  var cate_select = $("#categories");

  function appendSelect(cateNum) {
    if(cateNum == 1) {
      var select_id = `child-form`
      var container_id = `child-container`
    } else if(cateNum == 2) {
      var select_id = `grandchild-form`
      var container_id = `grandchild-container`
    }
    var html =
    `<div class="sell-form__content__box__group__select" id="${ container_id }">
      <i class="fa fa-chevron-down arrow-bottom"></i>
      <select name="item[category_id]" id="${ select_id }" class="sell-form__content__box__group__select__wrap">
        <option value>---</option>
      </select>
    </div>`
    cate_select.append(html)
  }

  function appendCate(cateOption, cateNum) {
    if (cateNum == 1) {
      var appendId = $("#child-form")
    } else if (cateNum == 2) {
      var appendId = $("#grandchild-form")
    }
    appendId.append(
      $("<option>")
        .val($(cateOption).attr('id'))
        .text($(cateOption).attr('name'))
    )
  }

  $("#parent-form").on("change",function() {
    var parentValue = $(this).val();
    $("#child-container, #grandchild-container").remove();
    $.ajax({
      url: "/items/select",
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: "json"
    })
    .done(function(children) {
      var cateNum = 1
      appendSelect(cateNum);
      children.forEach(function(child) {
        appendCate(child, cateNum)
      })
    })
  })

  $(document).on("change", "#child-form", function() {
    var childValue = $(this).val();
    $("#grandchild-container").remove()
    $.ajax({
      url: "/items/select",
      type: "GET",
      data: {
        child_id: childValue
      },
      dataType: "json"
    })
    .done(function(grandChildren) {
      if (grandChildren.length != 0) {
        var cateNum = 2
        appendSelect(cateNum);
        grandChildren.forEach(function(grandChild) {
          appendCate(grandChild, cateNum)
        })
      } else {
        $(".sell-form__content__box__group").removeClass("no_display__brand");
        $("#grandchild-container").remove();
      }
    })
  })

  $(document).on("change", "#grandchild-form", function() {
    var grandValue = $(this).val();
    $.ajax({
      url: "/items/select_grand",
      type: "GET",
      data: {
        grand_id: grandValue
      },
      dataType: "json"
    })
    .done(function(grandInfo) {
      $("#cate_id").val(grandInfo.id);
      $(".sell-form__content__box__group").removeClass("no_display__size no_display__brand");
    })
  })
})