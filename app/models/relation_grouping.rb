class RelationGrouping < ApplicationRecord
    belongs_to :relation, foreign_key: 'relation_id', class_name: 'Product'
    belongs_to :related, foreign_key: 'related_id', class_name: 'Product'
end
