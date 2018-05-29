Rails.application.routes.draw do

  resources :stops
  resources :students do
    member do
      get :approve
      get :decline
    end
  end
  resources :buses do
    member do
      get :active
      get :unactive
    end
  end
  resources :homes, :only => [:index]
  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions'}

  namespace :api, defaults: {format: :json} do
   namespace :v1 do
     resources :buses, :only => [:index, :show, :update]
     resources :sessions, :only => [:create]
     resources :registrations, :only => [:create, :update]
   end
  end

  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
