Theitskillboard::Application.routes.draw do
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :profiles, only: [:show]

  namespace :profile do
    get "preview"                           => "profile#show"
    get "edit"                              => "profile#edit"
    get "profile_picture_and_name/edit"     => "profile#profile_picture_and_name",     as: "edit_profile_picture_and_name"
    get "location_nationality_and_age/edit" => "profile#location_nationality_and_age", as: "edit_location_nationality_and_age"
    put ""                                  => "profile#update",                       as: ""

    resources :contacts,    only: [:index, :create, :destroy]
    resources :interests,   only: [:index, :create, :destroy]

    resources :employments, only: [:index, :create] do
      resources :projects, only: [:create]
      resources :impacts,  only: [:create]
    end

    resources :projects, only: [:create] do
      resources :impacts,  only: [:create]
    end

    resources :impacts, only: [:create] do
      resources :skills,  only: [:create]
    end

    resources :studies,     only: [:index, :create] do
      resources :courses, only: [:create]
    end

    root to: "profile#show"
  end

  get ":action" => "static#:action"
  root :to => "static#landingpage"
end