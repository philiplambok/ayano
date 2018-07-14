Rails.application.routes.draw do
  namespace :api do 
    resources :auth, only: [:create, :show]

    resources :blogs do 
      member do 
        get 'user'
      end
    end

    resources :users do 
      member do 
        get 'blogs'
        get 'role'
      end
    end
  end
end
