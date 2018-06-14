Rails.application.routes.draw do
  get 'contact/index'

  get 'rankings/index'

  get 'rankings/show'

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  # get 'posts/new'

  # post 'posts/create' => 'posts#create',  as:"blogs"

  # get 'posts/:id' => 'posts#show', as:'post'

  # devise_for :users
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/top' => 'root#top'

  # post '/posts' => 'posts#create'

  # get '/posts' => 'posts#index'

  # get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'

  #  patch '/posts/:id' => 'posts#update', as: 'update_post'

  resources :blogs
  resources :rankings

  get '/terms' => 'root#terms', as:'terms'
  # get '/contact' => "root#contact"

  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'

end
