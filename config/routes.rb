Rails.application.routes.draw do

  devise_for :users
  resources :retires
  resources :users

  devise_scope :user do
     get 'ingresar', to: 'devise/sessions#new'
     get 'registrar', to: 'devise/registrations#new'
   end

  root 'static_pages#home'
  get '/inicio', to: 'static_pages#home'
  get '/quienes_somos',  to: 'static_pages#who'
  get '/busqueda',  to: 'static_pages#search'
  get '/contacto', to: 'static_pages#contact'

  get '/find_file', to: 'users#find_file'

end
