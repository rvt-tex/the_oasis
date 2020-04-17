class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.string :title
      t.float :price
      t.float :duration
      t.text :description

      t.timestamps
    end
  end
end
