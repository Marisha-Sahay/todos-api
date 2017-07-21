class TasksController < ApplicationController

  def index
    if params[:completed] == 'true'
      @tasks = Task.where(["user_id = ? and completed = ?", params[:user_id], true])
    elsif params[:completed] == 'false'
      @tasks = Task.where(["user_id = ? and completed = ?", params[:user_id], false])
    else
      @tasks = Task.where("user_id = ?", params[:user_id])
    end
    render json:@tasks
  end

  def show
    @task = Task.find_by(id: params[:id])
    render json: @task
  end

  def create
    @task = Task.new(title: params[:title],description: params[:description], priority: params[:priority], completed: params[:completed], note: params[:note], user_id: params[:user_id])
    if @task.save
      render :show
    else
      render json: {errors: @task.errors.full_messages}
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(title: params[:title],description: params[:description], priority: params[:priority], completed: params[:completed], note: params[:note],user_id: params[:user_id])
      render :show
    else
      render json: {errors: @task.errors.full_messages}
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    render :show
  end

end