class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.text :notes
    end
  end
end
