Rails.application.routes.draw do
  resources :questions, :except => [:destroy] do
    resources :answers, :except => [:destroy]
  end

  resource :session, :only => [:new, :create, :destroy]
  resources :users, :except => [:destroy]

  get 'signin' => 'sessions#new', as: 'signin'
  get 'signout' => 'sessions#destroy', as: 'signout'
  get 'signup' => 'users#new', as: 'signup'

  root 'questions#index'
end
