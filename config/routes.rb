Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show, :destroy, ]
end
