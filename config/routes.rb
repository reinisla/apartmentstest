Rails.application.routes.draw do

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  get 'tickets/complain'
  get 'tickets/maintenance'
  get 'tickets/other'
  get 'tickets/order'

  root 'home#index'

  resources :properties  do
  	resources :flats do
      resources :ownerhistories
      resources :mainhistories 
      resources :tickets, only: [:new, :create]  
      end
    resources :documents, only: [:index, :new, :create, :destroy]
    resources :whiteboards
  end
  
  resources :all_flats
  
  resources :cpanel do
    resources :posts, :path => 'myproperties'
    resources :postflats, :path => 'myflats'
  end
  
  resources :tickets do
    resources :replies
    member do 
      get :flop
    end
  end

  resources :search

  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  devise_for :users,  :controllers => { :registrations => 'registrations'}
  resources :users
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
