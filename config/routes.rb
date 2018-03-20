Rails.application.routes.draw do
  devise_for :users
  resources :arts do
    collection do 
      get 'search'
    end
    resources :comments
  end
  root 'arts#index'
end
