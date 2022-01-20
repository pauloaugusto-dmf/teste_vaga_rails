require 'rails_helper'

RSpec.describe ProductsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/products').to route_to('products#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/products/1').to route_to('products#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/products').to route_to('products#create', format: :json)
    end

    it 'routes to #update via PUT' do
      expect(put: '/products/1').to route_to('products#update', id: '1', format: :json)
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/products/1').to route_to('products#update', id: '1', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/products/1').to route_to('products#destroy', id: '1', format: :json)
    end

    it 'routes to #create_relation' do
      expect(post: '/products/1/related_products/2').to route_to('products#create_relation', id: '1', related_product_id: '2')
    end

    it 'routes to #destroy_relation' do
      expect(delete: '/products/1/related_products/2').to route_to('products#destroy_relation', id: '1', related_product_id: '2')
    end
  end
end
