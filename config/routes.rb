Rails.application.routes.draw do
  namespace :api do 
    resources :blogs do 
      member do 
        get 'user'
      end
    end
  end
end
