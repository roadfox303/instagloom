Rails.application.routes.draw do
  resources :contacts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
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
