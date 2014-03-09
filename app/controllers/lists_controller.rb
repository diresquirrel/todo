class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @newTask = @list.tasks.build
    @tasks = @list.tasks.where(complete: false).order(:updated_at)
    @completedTasks = @list.tasks.where(complete: true).order(:updated_at)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    @list.user = current_user
    
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:title)
    end
end
