Rails.application.routes.draw do
  get 'books/new' => 'books#new', as: 'new_book'
  get '/top' => 'homes#top'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit',as: 'edit_book'
  patch 'books/:id/edit' => 'books#update',as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'books' => 'books#back', as: 'back_book'
  get 'books/new' => 'books#start', as: 'start_book'
  resources :books
  # For details on the DSL available  within this file, see https://guides.rubyonrails.org/routing.html
end
