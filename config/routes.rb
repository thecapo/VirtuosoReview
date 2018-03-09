Rails.application.routes.draw do
  resources :arts do
    resources :comments
  end
  root 'arts#index'
end
