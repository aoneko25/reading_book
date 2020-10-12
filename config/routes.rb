Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root "books#home"

  resources :books do
    collection do
      get 'record' #本の登録
      post 'create' #登録完了
      get 'seach'  #本の検索
      get 'books/:id', to: 'books#details'  #本の詳細
      get 'books/:id', to: 'books#edit'  #本のデータ編集
      patch 'books/:id', to: 'books#update'  #本のデータ編集
      delete 'books/:id', to: 'books#destroy' #本の削除
    end
  end

  resources :information do
    collection do
      get 'users/:id', to: 'information#show' #マイページ
    end
  end
  
  resources :profiles do
    collection do
      get 'profiles/index' #プロフィールの登録
      post 'profiles/create' #登録完了
    end
  end

  resources :books, only: [:index, :new, :create, :data, :edit, :seach, :destroy, :details]
  resources :users, only: [:index, :edit, :update]
  resources :information, only: [:index, :edit, :update, :destroy]
  resources :profiles, only: [:index, :new, :create, :show]
  end


