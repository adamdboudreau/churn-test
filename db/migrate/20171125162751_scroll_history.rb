class ScrollHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :scroll_histories do |t|
      t.integer :scroll_speed
      t.boolean :towards_address_bar
      t.boolean :churn
      t.string :sid

      t.timestamps
    end
  end
end
