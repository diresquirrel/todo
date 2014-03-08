class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tasks = @user.tasks.where(complete: false)
    @completedTasks = @user.tasks.where(complete: true)
  end  
  
end
