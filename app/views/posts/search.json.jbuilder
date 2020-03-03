json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.image post.image.url
  json.nickname post.user.nickname
end