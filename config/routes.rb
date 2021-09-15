Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  # workaround for issue when there is a registration error--rails automagically
  # redirects to the user index?
  get '/users', to: redirect('/users/sign_up')

  resources :users, only: [:show, :edit, :update]  do
    resources :loggable_items, only: [:index, :new, :create] do
      resources :logs, only: [:index, :create]
    end
  end
end
