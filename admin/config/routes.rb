Admin::Engine.routes.draw do
  resources :users
  
  resources :admin_users
  
  resource :session, only: [:new, :create, :destroy]
  
  resources :pages
  
  resources :course_attachments, :except => [:new]
  
  resources :answers, :except => [:new]

  resources :questions, :except => [:new] do
    resources :answers
  end

  resources :courses do
    resources :questions
    resources :course_attachments
  end

  root to: 'application#welcome'
end
