class CreateRelationGroupings < ActiveRecord::Migration[6.1]
  def change
    create_table :relation_groupings do |t|
      t.integer :relation_id, foreign_key: true
      t.integer :related_id, foreign_key: true

      t.timestamps
    end
  end
end
