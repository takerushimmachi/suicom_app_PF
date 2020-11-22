class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :ratet, null: false, default: 0
      t.references :answer, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
