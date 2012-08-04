class TasksController < ApplicationController
respond_to :html, :json

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end
  
  def index
    @tasks = Task.all
    # where( list_id: params[:list_id] )
    respond_with(@tasks)
  end
  
  def new
    @task = Task.new
    @lists = List.all
    respond_with(@task)
  end

  def create
    @task = Task.new(params[:task])      
    
    # respond_with @task
    
    respond_with do |format|
      format.html do
        if @task.save
          redirect_to task_url(@task)
        else
          render 'new'
        end
      end
      
      format.json do
        if @task.save
          render :json => @task
        else
          render :json => @task.errors
        end
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    # respond_with @task
    
    respond_with do |format|
      format.html do
        if @task.save
          redirect_to task_url(@task)
        else
          render 'edit'
        end
      end
      
      format.json do
        if @task.save
          render :json => @task
        else
          render :json => @task.errors
        end
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with @task, :location => lists_path
  end

end
