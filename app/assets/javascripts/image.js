$(document).on("turbolinks:load", function () {
  $(function () {
    fileField = $("#file");
    // 選択された画像を取得し表示
    fileField.on("change", fileField, function (e) {
      var file = e.target.files[0];
      var reader = new FileReader(),
        $preview = $("#img-field");
      reader.onload = (function (file) {
        return function (e) {
          $preview.empty();
          $preview.append(
            $("<img>").attr({
              src: e.target.result,
              width: "100%",
              class: "preview",
              title: file.name,
            })
          );
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });


  // トップページの整形
  var $grid = $(".contents"),
    emptyCells = [],
    i;

  for (i = 0; i < $grid.find(".contents__content").length; i++) {
    emptyCells.push($("<div>", { class: "contents__content is-empty" }));
  }

  $grid.append(emptyCells);
});


