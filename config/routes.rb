Rails.application.routes.draw do
  resources :restaurants do
    # list several restaurants -> collection
    collection do
      get :top  # /restaurants/top
    end
    # routes for one resource -> member
    member do
      get :chef # /restaurants/:id/chef
      # get :menu # /restaurants/:id/menu
    end
    resources :reviews, only: [:new, :create]
  end

  # resources :restaurants do
  #   resources :reviews, only: [:new, :create]
  # end

  resources :reviews, only: [:destroy]

  # /restaurants/new
  # GET /restaurants/:restaurant_id/reviews/new -> #new
  # POST /restaurants/:restaurant_id/reviews/ -> #create
  # DELETE reviews/:id
  #
  # SHALLOW NESTING
end
