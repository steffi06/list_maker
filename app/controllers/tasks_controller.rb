class TasksController < ApplicationController
respond_to :html, :json, :xml

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end
  
  def index
    redirect_to lists_path
  end
  
  def new
    @task = Task.new
    @lists = List.all
    respond_with(@task)
  end

  def create
    @task = Task.new(params[:task])
    @task.save      
    redirect_to @task
  end

  def edit
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to lists_path
  end

end
