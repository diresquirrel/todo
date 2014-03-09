class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  respond_to :html, :js, :json

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.js {
          js_out = { :task => @task, :html => render_to_string(@task, layout: false) }
          render json: js_out, :content_type => 'text/json'
        }
        format.json { render json: @task, status: :updated, location: @task }        
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.js { render json: {}, :content_type => 'text/json' }
    end
  end
  
  # TOGGLE COMPLETE /tasks/1/toggle
  def toggle
    session[:return_to] ||= request.referer
    
    set_task
    @task.toggle
    
    respond_to do |format|
      if @task.save
        returnUrl = session.delete(:return_to)
        format.html { redirect_to returnUrl }
        format.js {
          js_out = { :task => @task, :html => render_to_string(@task, layout: false) }
          render json: js_out, :content_type => 'text/json'
        }
        format.json { render json: @task, status: :updated, location: @task }      
      else
        format.html { redirect_to returnUrl, alert: 'Unable to toggle the task' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:title, :notes, :complete, :list_id)
    end
end
