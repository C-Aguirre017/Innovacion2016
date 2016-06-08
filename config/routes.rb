Rails.application.routes.draw do


  devise_for :users
  resources :retires, only: [:new,:create]
  resources :users do
    member do
      post 'get_ability', to: 'abilities#get_ability'
      post 'follow_user', to: 'users#follow_user'
      get 'habilidades', to: 'abilities#index'
      get 'notificaciones', to: 'users#notification'
      get 'evaluar', to: 'users#grade_user'
      post 'postear_nota', to: 'users#post_grade'
    end
  end

  devise_scope :user do
     get 'ingresar', to: 'devise/sessions#new'
     get 'registrar', to: 'devise/registrations#new'
   end



  root 'static_pages#home'
  get '/inicio', to: 'static_pages#home'
  get '/quienes_somos',  to: 'static_pages#who'
  get '/busqueda',  to: 'static_pages#search'
  get '/contacto', to: 'static_pages#contact'
  post '/aceptar_solicitud', to: 'users#toggle_notification'
  post '/borrar_solicitud', to: 'users#unfollow_user'

  get '/find_file', to: 'users#find_file'
end
