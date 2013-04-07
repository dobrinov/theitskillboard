Theitskillboard::Application.routes.draw do
  resources :users
  resources :profiles
  resources :sessions, :only => [:new, :create, :destroy]

  get ':action' => 'static#:action'
  root :to => 'static#landingpage'
end