BeardedRobot::Application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'login', to: 'sessions#create'
  
  root :to => "dashboards#root"
end
