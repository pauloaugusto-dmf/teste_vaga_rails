class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  has_scope :order_by
  
  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: [error.message] }, status: :not_found
  end

  MAX_PAGINATION_LIMIT = 100
  DEFAULT_PAGINATION_LIMIT = 20

  def index
    @products = Product.all
    @products = Product.limit(limit).offset(params[:offset])
    @products = apply_scopes(@products).all
    
    render json: @products
  end

  def show; end

  def create
    @product = Product.new(product_params)

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def limit
    [
      params.fetch(:limit, DEFAULT_PAGINATION_LIMIT).to_i,
      MAX_PAGINATION_LIMIT
    ].min
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end
end
