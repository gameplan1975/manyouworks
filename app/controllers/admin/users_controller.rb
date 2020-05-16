class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user_check

  def index
    @users = User.all
  end

  def show
    @search_params = task_search_params
    @tasks = Task.search(@search_params).order(params[:sort]).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to [:admin, @user], notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :admin, :password, :password_confirmation, :email)
  end

  def task_params
    params.require(:task).permit(:name, :status, :label, :task_limit, :content, :created_at, :priority, :user_id)
  end

  def task_search_params
    params.fetch(:search, {}).permit(:name, :status)
  end

  def admin_user_check
    if current_user.admin == false
      redirect_to root_path, notice: "You could not access this page."
    end
  end
end
