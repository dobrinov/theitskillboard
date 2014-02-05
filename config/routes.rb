Theitskillboard::Application.routes.draw do
  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]

  namespace :my do
    resource :profile do
      resource :avatar, only: [:edit, :update, :destroy]
    end

    root to: "profiles#show"
  end

  resources :profiles, only: [:show]

  get ":action" => "static#:action"
  root to: "static#landingpage"

  scope '/styleguide' do
    get ":action" => "styleguides#:action"
  end
end