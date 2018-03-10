Rails.application.routes.draw do
  devise_for :users
  resources :arts do
    resources :comments
  end
  root 'arts#index'
end
