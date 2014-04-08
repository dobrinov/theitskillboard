Theitskillboard::Application.routes.draw do
  resources :users,   only: [:new, :create]
  resource  :session, only: [:new, :create, :destroy]

  namespace :my do
    resource :profile do
      resource :avatar, only: [:edit, :update, :destroy]
    end

    resources :messages, only: [:index, :show, :destroy]
    resource :settings, only: [:show, :update]

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

  resources :profiles, only: [:show] do
    resource :messages, only: [:new, :create]
  end

  get "sitemap" => "sitemaps#index", as: "sitemap", defaults: { format: "xml" }
  get "about" => "static#about"
  get "bye" => "static#bye"
  get "contact" => "static#contact"

  root to: "profiles#show", as: :custom_domain_root, constraints: CustomDomain.new
  root to: "static#landingpage"

  scope '/styleguide' do
    get ":action" => "styleguides#:action"
  end

end