class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :desired_date
      t.datetime :desired_time
      t.string :special_request
      t.references :client, foreign_key: true
      t.references :treatment, foreign_key: true

      t.timestamps
    end
  end
end
