Theitskillboard::Application.routes.draw do

  resource :user, only: [:new, :create] do
    get  'confirmation', to: 'users#confirmation'
    post 'confirm',      to: 'users#confirm'
  end

  resource :password, only: [:edit, :update] do
    get   'forgotten',         to: 'passwords#forgotten'
    post  'send_email_change', to: 'passwords#send_email_change'
  end

  resources :sessions, only: [:new, :create, :destroy]

  namespace :my do
    resource :profile, only: [:show]
  end

  resources :profiles, only: [:show]

  get ":action" => "static#:action"
  root :to => "static#landingpage"
end