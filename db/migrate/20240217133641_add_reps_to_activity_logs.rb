class AddRepsToActivityLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :activity_logs, :repetitions, :integer
  end
end
