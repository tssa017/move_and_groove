class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.integer :activity_id
      t.string :title, limit: 45
      t.integer :type_of_activity
      t.string :img, limit: 455
      t.boolean :is_custom

      t.timestamps
    end

    add_index :activities, :activity_id, unique: true
  end
end
