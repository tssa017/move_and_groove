class RemoveColumnsFromTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :activity_id
    remove_column :activities, :img
    remove_column :activity_logs, :activity_log_id
  end
end
