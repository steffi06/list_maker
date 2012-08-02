class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :list_id    #Rails does not realize this list_id automatically at this stage... just a column header
      
      t.timestamps
    end
  end
end
