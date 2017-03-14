Rails.application.routes.draw do
  
  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  resources :follows
  # get 'profiles/show'

  get 'profiles_show/:id' => 'profiles#show', as: 'profiles_show'
  get 'profiles_edit/:id' => 'profiles#edit', as: 'profiles_edit'
  
  resources :profiles
  
  devise_for :users
  resources :posts do
  	resources :comments, :likes
  end
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
