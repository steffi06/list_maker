class ListsController < ApplicationController
respond_to :html, :json, :xml

    def show
      @list = List.find(params[:id])
      respond_with(@list)
    end

    def index
      @lists = List.all
      respond_with(@lists)
    end

    def new
      @list = List.new
      respond_with(@list)
    end

    def create
      @list = List.new(params[:list])
      # @list.name = (params[:list][:name])
      @list.save      
      
      # tasks_array = (params[:list][:tasks].split("; "))
      # tasks_array.each do |task|
      #   new_task = Task.new
      #   new_task.task_name = task
      #   new_task.list_id = @list.id
      #   new_task.status = 0
      #   new_task.save
      # end

      redirect_to @list
    end

    def edit
      @list = List.find(params[:id])
      respond_with(@list)
    end

    def update
      @list = List.find(params[:id])
      @list.update_attributes(params[:list])
      redirect_to @list
    end

    def destroy
      @list = List.find(params[:id])
      @list.destroy
      redirect_to lists_path
    end

  end
