class AddLevelToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :level, :string
  end
end
