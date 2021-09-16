Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  # workaround for issue when there is a registration error--rails automagically
  # redirects to the user index?
  get '/users', to: redirect('/users/sign_up')

  resources :users, only: [:show, :edit, :update]  do
    resources :logged_items, only: [:index, :new, :create, :edit, :update] do
      resources :logs, only: [:index, :new, :create]
    end
  end

  resources :logged_items, only: [] do
    resources :logs, only: [:index, :new, :create]
  end
end
