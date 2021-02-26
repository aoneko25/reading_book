Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root "books#index"

  resources :books do
    collection do
      get 'books/new' #本の登録
      post 'books/create' #登録完了
      get 'books/edit' #本の編集
      post 'books/update' #本の編集完了
      get 'books/check' #削除前の確認画面
      delete 'books/:id', to: 'books#destroy'
      get 'seach'  #本の検索
    end
  end

  resources :information do
    collection do
      get 'users/:id', to: 'information#index' #マイページ
    end
  end

  resources :users, only: [:index,:new, :create, :edit, :update, :destroy]
  resources :books, only: [:new, :create, :show, :chcek, :delete, :edit, :update]
  resources :information, only: [:show]
  end


