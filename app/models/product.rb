class Product < ApplicationRecord
  with_options presence: true do
    validates :name, uniqueness: true
    validates :description
    validates :price
    validates :quantity
  end

  scope :order_by, lambda{|ordering| order(ordering)}

  scope :by_name, lambda{|name| where("name LIKE ?", "%" + name + "%")}
  scope :name_not_contain, lambda{|name| where.not("name LIKE ?", "%" + name + "%")}
  scope :by_description, lambda{|description| where("description LIKE ?", "%" + description + "%")}
  scope :description_not_contain, lambda{|description| where.not("description LIKE ?", "%" + description + "%")}

  scope :by_price_less, lambda{ |price| where("price < ?", price )}
  scope :by_price_less_or_equal, lambda{ |price| where("price <= ?", price )}
  scope :by_price_greater, lambda{ |price| where("price > ?", price )}
  scope :by_price_greater_or_equal, lambda{ |price| where("price >= ?", price )}
  scope :by_price_equal, lambda{ |price| where("price = ?", price )}
  scope :by_price_not_equal, lambda{ |price| where("price != ?", price )}

  scope :by_quantity_less, lambda{ |quantity| where("quantity < ?", quantity )}
  scope :by_quantity_less_or_equal, lambda{ |quantity| where("quantity <= ?", quantity )}
  scope :by_quantity_greater, lambda{ |quantity| where("quantity > ?", quantity )}
  scope :by_quantity_greater_or_equal, lambda{ |quantity| where("quantity >= ?", quantity )}
  scope :by_quantity_equal, lambda{ |quantity| where("quantity = ?", quantity )}
  scope :by_quantity_not_equal, lambda{ |quantity| where("quantity != ?", quantity )}

  scope :by_created_at_less, lambda{ |created_at| where("created_at < ?", created_at )}
  scope :by_created_at_less_or_equal, lambda{ |created_at| where("created_at <= ?", created_at )}
  scope :by_created_at_greater, lambda{ |created_at| where("created_at > ?", created_at )}
  scope :by_created_at_greater_or_equal, lambda{ |created_at| where("created_at >= ?", created_at )}

  scope :by_updated_at_less, lambda{ |updated_at| where("updated_at < ?", updated_at )}
  scope :by_updated_at_less_or_equal, lambda{ |updated_at| where("updated_at <= ?", updated_at )}
  scope :by_updated_at_greater, lambda{ |updated_at| where("updated_at > ?", updated_at )}
  scope :by_updated_at_greater_or_equal, lambda{ |updated_at| where("updated_at >= ?", updated_at )}
  
  
end
