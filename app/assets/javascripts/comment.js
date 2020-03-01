$(document).on('turbolinks:load', function() {
  $(function(){
    function buildHTML(comment){
      var html = `<div class = "maincontents__comments__title__box">
                    <div class = "maincontents__comments__title__box__name">
                      <a href = /users/${comment.user_id} class = "maincontents__comments__title__box__name__link">${comment.user_name}</a>
                      <span> :</span>
                    </div>
                    <div class = "maincontents__comments__title__box__text">
                      ${comment.text}
                    </div>
                  </div>`
      return html;
    }
    $('#new_comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false,
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.maincontents__comments').append(html);
        $('.form__textbox').val('');
        $('.form__btn').prop('disabled', false);
      })
      .fail(function(){
        alert('error');
      })
    })
  })
});