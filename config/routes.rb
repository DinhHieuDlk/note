Rails.application.routes.draw do
  devise_for :users
  get 'wellcome/index'
  

  resources :notenotes

  authenticated :user do
    root 'notenotes#index', as: :user_root
  end
   root 'wellcome#index'
 
end
