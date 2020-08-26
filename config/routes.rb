Rails.application.routes.draw do
  root to: "items#index"
  root to: 'orders#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :items
  resources :orders, only:[:create]
end
