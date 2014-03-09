class Task < ActiveRecord::Base
  belongs_to :list
  
  def complete?
    self.complete == true
  end
  
  def toggle
    self.complete = !self.complete
  end
  
  def self.completed ()
    where(complete: true).all
  end
  
  def self.not_completed ()
    where(complete: false).all
  end
  
end
