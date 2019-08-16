Rails.application.routes.draw do
  resources :sessions, only:[:index, :new, :create, :destroy]
  resources :users do
    member do
      get :favorite
    end
  end
  resources :articles do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]

end
