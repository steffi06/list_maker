class Task < ActiveRecord::Base
  attr_accessible :task_name, :list_id, :status
  
  belongs_to :list
end
