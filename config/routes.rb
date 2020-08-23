Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :items
end
