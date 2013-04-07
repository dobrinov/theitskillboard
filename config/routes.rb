Theitskillboard::Application.routes.draw do
  resources :users, :only => [:new, :create]
  resources :profiles, :only => [:show, :edit, :update]
  resources :sessions, :only => [:new, :create, :destroy]

  get ':action' => 'static#:action'
  root :to => 'static#landingpage'
end