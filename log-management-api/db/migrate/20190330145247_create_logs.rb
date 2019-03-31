class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.text :log_data
      t.datetime :log_time, precision: 6

      t.timestamps
    end
  end
end
