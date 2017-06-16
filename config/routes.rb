Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id' => 'pictures#show'

  root 'pictures#index'
  get 'pictures' => 'pictures#index'

  get 'pictures/:id/edit' => "pictures#edit", as: 'edit_picture'
  patch 'pictures/:id' => "pictures#update", as: 'picture'

  delete 'pictures/:id' => 'pictures#destroy'

  post 'users' => 'users#create'
  get 'users' => 'users#new'
end
