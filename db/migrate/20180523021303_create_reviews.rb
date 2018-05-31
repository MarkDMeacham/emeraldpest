class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :text
      t.integer :creator_id
      t.integer :updator_id
      t.timestamps null: false
    end
  end
end
