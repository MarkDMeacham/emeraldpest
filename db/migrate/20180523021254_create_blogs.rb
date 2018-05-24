class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :slug
      t.string :title
      t.text :text
      t.integer :creator_id
      t.integer :updator_id
      t.timestamps null: false
    end

    add_index :blogs, :slug, unique: true
  end
end
