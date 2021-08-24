Rails.application.routes.draw do
  get "/", to: "posts#index"
  resources :posts do
    collection do
      post :confirm
    end
  end
  get 'sessions/new'
  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :sessions, only: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
