Theitskillboard::Application.routes.draw do
  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]

  namespace :my do
    resource :profile do
      resource :avatar, only: [:edit, :update, :destroy]
    end

    resources :skill_categories, only: [:new, :create, :edit, :update, :destroy]
    resources :skills, only: [:new, :create, :edit, :update, :destroy]

    root to: "profiles#show"
  end

  resources :profiles, only: [:show]

  get ":action" => "static#:action"
  root to: "static#landingpage"

  scope '/styleguide' do
    get ":action" => "styleguides#:action"
  end
end