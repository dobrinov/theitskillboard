Theitskillboard::Application.routes.draw do

  resource :user, only: [:new, :create] do
    get  'confirmation', to: 'users#confirmation'
    post 'confirm',      to: 'users#confirm'
  end

  resources :sessions, only: [:new, :create, :destroy]

  get ":action" => "static#:action"
  root :to => "static#landingpage"
end