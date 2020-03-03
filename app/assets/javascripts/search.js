$(document).on('turbolinks:load', function() {
  $(function(){
    function appendPost(post){
    var html = `<div class="contents__content">
                  <a class="contents__content__link" href="/posts/${post.id}">
                    <img alt="写真" class="contents__content__link__image" src=${post.image}>
                    <div class="contents__content__link__info">
                      <apan class="contents__content__link__info__title">
                      ${post.title}
                      </apan>
                      <apan class="contents__content__link__info__name">
                        <i class="fas fa-user "></i>
                        ${post.nickname}
                      </apan>
                    </div>
                  </a>
                </div>`
    $(".contents").append(html)
    }

    function appendErrMsgToHTML(msg){
      var html = `<div>${msg}</div>`
      $(".contents").append(html);
    }

    $(".upper__form__input").on("keyup", function(){
      var input = $(".upper__form__input").val();
      $.ajax({
        type: "GET",
        url: '/posts/search',
        data: { keyword: input },
        dataType: 'json',
      })
      .done(function(posts){
        $(".contents").empty();
        if (posts.length!== 0){
          posts.forEach(function(post){
            appendPost(post);
          })
        }
        else{
          appendErrMsgToHTML("一致する投稿がありません")
        }
      })
      .fail(function(){
        alert('error');
      });
    });
  });
});