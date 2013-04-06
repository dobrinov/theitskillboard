Theitskillboard::Application.routes.draw do
  resources :users

  get ':action' => 'static#:action'
  root :to => 'static#landingpage'
end