class Job < ActiveRecord::Base
  validates_presence_of :title, :description, :location, :company, :level, :qualifications
end
