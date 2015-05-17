class AddQualificationsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :qualifications, :string
  end
end
