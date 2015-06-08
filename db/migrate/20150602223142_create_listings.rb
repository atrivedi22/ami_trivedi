class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :summary
      t.string :address
      t.integer :price
      t.boolean :rented
      t.integer :city_id
      t.integer :user_id

      t.timestamps

    end
  end
end
