Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  get 'dashboard' => 'dashboard#index', as: :dashboard

  get 'einkauf' => 'trades#index', as: :trades
  get 'vertrieb' => 'sales#index', as: :sales
  get 'produktion' => 'production#index', as: :production
  get 'lager' => 'storage#index', as: :storage
  get 'bericht' => 'reports#index', as: :reports
  get 'bank' => 'banking#index', as: :banking

  # management routes
  get 'management' => 'management#index', as: :management

  post 'getreide' => 'storage#crops', as: :crops
  post 'vieh' => 'storage#lifestock', as: :lifestock
  post 'technik' => 'storage#machinery', as: :machinery

  post 'getreide-verkaufen' => 'sales#sell_crops', as: :sell_crops
  post 'vieh-verkaufen' => 'sales#sell_lifestock', as: :sell_lifestock

  post 'getreide-anpflanzen' => 'production#sow_crops', as: :sow_crops
  post 'vieh-zuechten' => 'production#breed_lifestock', as: :breed_lifestock

  post 'getreide-kaufen' => 'trades#buy_crops', as: :buy_crops
  post 'vieh-kaufen' => "trades#buy_lifestock", as: :buy_lifestock
  resources :personnels, only: [:index, :create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
