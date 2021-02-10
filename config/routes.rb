Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root "books#index"

  resources :books do
    collection do
      get 'books/new' #本の登録
      post 'books/create' #登録完了
      get 'seach'  #本の検索
    end
  end

  resources :information do
    collection do
      get 'users/:id', to: 'information#show' #マイページ
    end
  end
  
  resources :profiles do
    collection do
      get 'profiles/new' #プロフィールの登録
      post 'profiles/create' #登録完了
      get 'profiles/show' #プロフィールの確認
    end
  end

  resources :users, only: [:index, :edit, :update]
  resources :information, only: [:show]
  resources :profiles, only: [:new, :create, :show, :edit, :update]
  end


