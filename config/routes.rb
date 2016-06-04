Rails.application.routes.draw do

  devise_for :users
  resources :retires
  resources :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/quienes_somos',  to: 'static_pages#who'
  get '/search',  to: 'static_pages#search'
  get '/find_file', to: 'users#find_file'

end
