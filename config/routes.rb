Theitskillboard::Application.routes.draw do
  get ':action' => 'static#:action'
  root :to => 'static#landingpage'
end