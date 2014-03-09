class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tasks = @user.tasks.where(complete: false).order(:updated_at)
    @completedTasks = @user.tasks.where(complete: true).order(updated_at: :desc)
  end  
  
end
