Rails.application.routes.draw do
  resources :pdfs
  get 'download_pdf' => 'pdfs#download', as: 'download'
  
  resources :pages
  mount Ckeditor::Engine => '/ckeditor'

  resources :answers
  #resources :courses

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Admin::Engine, at: 'admin'

  get 'course/:id(/:question_number)' => 'courses#show', as: 'course', defaults: { question_number: 1 }

  match 'login'        => 'account#login',           as: 'account_login', via: [:get, :post]
  get 'logout'         => 'account#logout',          as: 'account_logout'
  get 'reset-password' => 'account#reset_password',  as: 'account_reset_password'
  get 'register'       => 'account#new',             as: 'new_account'
  get 'account'        => 'account#index',           as: 'account_index'
  get 'account/course' => 'account#course'


  root to: 'home#index'

  match ':controller/(:action/(:id))', via: [:get, :post]
end
