class CreateActivityLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :activity_logs do |t|
      t.integer :activity_log_id
      t.timestamp :date
      t.float :duration
      t.integer :calories_consumed
      t.string :notes, limit: 800
      t.boolean :is_shared

      t.timestamps
    end

    add_index :activity_logs, :activity_log_id, unique: true
  end
end
