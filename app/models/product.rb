class Product < ApplicationRecord
  with_options presence: true do
    validates :name, uniqueness: true
    validates :description
    validates :price
    validates :quantity
  end

  scope :order_by, lambda{|ordering| order(ordering)}
  
end
