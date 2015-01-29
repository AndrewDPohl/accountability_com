Rails.application.routes.draw do

  get 'watchlists/index'

  get 'bills/index'

  root to: 'sites#index'

  resources :users, except: [:new]

  get "/search", to: "senators#search"
  get "/sign_up", to: "users#new"
  get "/profile", to: "users#profile"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/session", to: "sessions#destroy"
  get '/logout', to: 'sessions#destroy'

  get 'sites/index'

  get 'about', to: 'sites#about'

  get 'sites/about'

  get 'sites/contact'

  get 'sessions/new'

  get 'senators', to: 'senators#index'

  get 'senators/index'

  get 'senators/:id', to: 'senators#show', as: 'senator'

  get 'senators/new'

  get 'senators/edit'

  get 'bills', to: 'bills#index'


  get 'bills/passed_bills', to: 'bills#passed_bills'

  get 'watchlist', to: 'watchlists#index'

  post '/watchlists', to: 'watchlists#add'



end

#           Prefix Verb   URI Pattern                 Controller#Action
# watchlists_index GET    /watchlists/index(.:format) watchlists#index
#      bills_index GET    /bills/index(.:format)      bills#index
#             root GET    /                           sites#index
#            users GET    /users(.:format)            users#index
#                  POST   /users(.:format)            users#create
#        edit_user GET    /users/:id/edit(.:format)   users#edit
#             user GET    /users/:id(.:format)        users#show
#                  PATCH  /users/:id(.:format)        users#update
#                  PUT    /users/:id(.:format)        users#update
#                  DELETE /users/:id(.:format)        users#destroy
#          sign_up GET    /sign_up(.:format)          users#new
#          profile GET    /profile(.:format)          users#profile
#            login GET    /login(.:format)            sessions#new
#                  POST   /login(.:format)            sessions#create
#          session DELETE /session(.:format)          sessions#destroy
#           logout GET    /logout(.:format)           sessions#destroy
#      sites_index GET    /sites/index(.:format)      sites#index
#            about GET    /about(.:format)            sites#about
#      sites_about GET    /sites/about(.:format)      sites#about
#    sites_contact GET    /sites/contact(.:format)    sites#contact
#     sessions_new GET    /sessions/new(.:format)     sessions#new
#         senators GET    /senators(.:format)         senators#index
#   senators_index GET    /senators/index(.:format)   senators#index
#          senator GET    /senators/:id(.:format)     senators#show
#     senators_new GET    /senators/new(.:format)     senators#new
#    senators_edit GET    /senators/edit(.:format)    senators#edit
#            bills GET    /bills(.:format)            bills#index
#       watchlists POST   /watchlists(.:format)       watchlists#add

