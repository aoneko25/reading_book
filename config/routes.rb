Rails.application.routes.draw do
  devise_for :users
  root "books#home"

  resources :records do
    collection do
      get 'index' #本の登録
      post 'create' #登録完了
    end
  end

  resources :books, only: [:index, :new, :create, :show]
  
  end


