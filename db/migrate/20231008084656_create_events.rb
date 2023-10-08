class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.text :description
      t.integer :max_capacity

      t.timestamps
    end
  end
end
