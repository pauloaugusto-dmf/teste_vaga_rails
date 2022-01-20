Rails.application.routes.draw do
  resources :products, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "products/:id/related_products/:related_product_id"  => 'products#create_relation'
  delete "products/:id/related_products/:related_product_id"  => 'products#destroy_relation'
  get "products/:id/related_products/"  => 'products#list_relation'
end
