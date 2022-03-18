Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create] do
    resources :subs, only: [:edit, :update]
  end

  resources :subs, only: [:create, :index, :new, :show] do
    resources :posts
  end

end
