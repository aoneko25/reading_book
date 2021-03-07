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
      delete 'books/:id', to: 'books#destroy'
      get 'seach'  #本の検索
    end
  end

  resources :information do
    collection do
      get 'users/:id', to: 'information#index' #マイページ
    end
  end
  
  resources :profiles do
    collection do
      get 'profiles/new' #プロフィールの登録
      post 'profiles/create' #登録完了
      get 'profiles/show' #プロフィールの確認
      get 'profiles/edit' #プロフィールの確認
    end
  end

  resources :users, only: [:index,:new, :create, :edit, :update, :destroy]
  resources :books, only: [:new, :create, :show, :delete, :edit, :update]
  resources :information, only: [:show]
  resources :profiles, only: [:new, :create, :show, :edit, :update]
  end


