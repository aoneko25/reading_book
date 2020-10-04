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
      get 'edit'  #本のデータ編集
      get 'plan'  #読む予定の本
      get 'read'  #読んだ本
    end
  end
  
  resources :profiles do
    collection do
      get 'profiles/index' #プロフィールの登録
      post 'profiles/create' #登録完了
    end
  end

  resources :books, only: [:index, :new, :create, :show, :edit, :seach, :plan, :read]
  resources :users, only: [:index, :edit, :update]
  resources :profiles, only: [:index, :new, :create, :show]
  end


