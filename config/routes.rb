Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top' #TOPページ
  namespace :store do
    resources :stores, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      get '/stores/login', to: 'stores#sessions#new'
      post '/stores/login', to: 'stores#sessions#create'
      delete '/stores/logout', to: 'stores#sessions#destroy'
      resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy]
      resources :genres, only: [:new, :create, :index, :show, :edit, :update, :destroy]
      resources :drinks, only: [:new, :create, :index, :show, :edit, :update, :destroy]
      end
    resources :drinks, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    
    resources :employees, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :staffs, only: [:new, :create, :index, :show, :edit, :update, :destroy]

end
end
