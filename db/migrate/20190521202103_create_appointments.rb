class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :date
      t.belongs_to :user, foreign_key: true
      t.belongs_to :doctor, foreign_key: true

      t.timestamps
    end
  end
end
