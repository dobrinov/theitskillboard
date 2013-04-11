Theitskillboard::Application.routes.draw do
  resources :users, :only => [:new, :create]

  resources :sessions, :only => [:new, :create, :destroy]

  resources :profiles, :only => [:show, :edit, :update] do
    resources :interests, :only => [:new, :create, :destroy]
  end

  get ':action' => 'static#:action'
  root :to => 'static#landingpage'
end