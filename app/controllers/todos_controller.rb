class TodosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tasks = @user.tasks.where(complete: false)
  end  
  
end
