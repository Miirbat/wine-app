Rails.application.routes.draw do
    post 'authenticate', to: 'authentication#authenticate'
  namespace :api do
    post 'login', to: 'accounts#login'
    resources :accounts, except: [:new, :edit]
  end
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
