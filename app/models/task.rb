class Task < ActiveRecord::Base
  belongs_to :list
  
  def self.completed ()
    where(completed: true).all
  end
  
  def self.not_completed ()
    where(completed: false).all
  end
end
