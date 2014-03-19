Theitskillboard::Application.routes.draw do
  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]

  namespace :my do
    resource :profile do
      resource :avatar, only: [:edit, :update, :destroy]
    end

    resources :skill_categories, only: [:new, :create, :edit, :update, :destroy]
    resources :skills, only: [:new, :create, :edit, :update, :destroy]

    resources :studies, only: [:new, :create, :edit, :update, :destroy]
    resources :employments, only: [:new, :create, :edit, :update, :destroy]

    resources :interests, only: [:new, :create, :edit, :update, :destroy]
    resources :contacts, only: [:new, :create, :edit, :update, :destroy]

    root to: "profiles#show"
  end

  namespace :admin do
    resources :users, only: :index
  end

  resources :profiles, only: [:show]

  get "sitemap" => "sitemaps#index", as: "sitemap", defaults: { format: "xml" }
  get "about" => "static#about"
  get "contact" => "static#contact"
  root to: "static#landingpage"

  scope '/styleguide' do
    get ":action" => "styleguides#:action"
  end

end