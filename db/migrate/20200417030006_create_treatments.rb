class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.string :title
      t.string :price
      t.string :duration
      t.text :description

      t.timestamps
    end
  end
end
