class RemoveIndexFromActivityLogs < ActiveRecord::Migration[7.1]
  def change
    remove_index :activity_logs, name: "index_activity_logs_on_activity_id"
  end
end
