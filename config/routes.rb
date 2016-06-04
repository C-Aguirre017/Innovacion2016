Rails.application.routes.draw do

  devise_for :users
  resources :retires
  resources :users

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root 'static_pages#home'

  get '/home'=> 'static_pages#home'
  get '/quienes_somos' => 'static_pages#who'

end
