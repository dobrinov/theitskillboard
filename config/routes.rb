Theitskillboard::Application.routes.draw do
  resources :users, :only => [:new, :create]

  resources :sessions, :only => [:new, :create, :destroy]

  resources :profiles, :only => [:show, :edit, :update] do
    resources :interests,    :only => [:index, :create, :destroy]
    resources :contacts,     :only => [:index, :create, :destroy]
    resources :educations,   :only => [:index]
    resources :studies, :only => [:create, :update, :destroy] do
      resources :courses, :only => [:create, :update, :destroy] do
        resources :skills, :only => [:index, :create, :destroy]
      end
    end
  end

  get ':action' => 'static#:action'
  root :to => 'static#landingpage'
end