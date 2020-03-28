Rails.application.routes.draw do

	devise_for :users
	root 'post_images#index'

	resources :post_images, only: [:new, :create, :index, :show, :destroy] do
	resource :favorites, only: [:create, :destroy]
	resource :post_comments, only: [:create, :destroy]

	end
	resources :users, only: [:show, :edit, :update]
	# onlyを使って不必要なルーティングを制限
end