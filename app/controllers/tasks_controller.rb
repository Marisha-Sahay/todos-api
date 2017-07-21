class TasksController < ApplicationController

  def index
    @tasks = Task.all
    if completed
      @tasks = Task.where(completed: true)
    else
      @tasks = Task.where(completed: false)
    end
    render json:@tasks
  end

  def show
    @task = Task.find_by(id: params[:id])
    render json: @task
  end

  def create
    @task = Task.new(title: params[:title],description: params[:description], completed: params[:completed], note: params[:note])
    if @task.save
      render :show
    else
      render json: {errors: @task.errors.full_messages}
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(title: params[:title],description: params[:description], completed: params[:completed], note: params[:note])
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