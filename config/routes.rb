Rails.application.routes.draw do

  devise_for :users
  resources :stories do 
    resources :comments
  end
  root 'stories#index'

end
