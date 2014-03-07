class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :get_current_user
  before_filter :load_todo_lists
  
  private
    def get_current_user
      @user = current_user
    end
  
    def load_todo_lists
      @lists = @user.lists if user_signed_in?
    end

end
