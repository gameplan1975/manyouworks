class TasksController < ApplicationController
  before_action :check_login?
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @search_params = task_search_params
    @tasks = Task.all
    if params[:label_id].present?
      @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) 
    else
      @tasks = Task.search(@search_params)
    end
      @tasks = @tasks.order(params[:sort]).page(params[:page]).per(5)
    end

  def show, end

  def new
    @task = Task.new
  end

  def edit, end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end
    
  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status, :task_limit, :content, :created_at, :priority, :user_id,
    { label_ids: [] })
  end

  def task_search_params
    params.fetch(:search, {}).permit(:name, :status, :label_id)
  end

  def check_login?
    unless current_user.presence
      redirect_to new_session_path, notice: 'You should log in.'
    end
  end
end
