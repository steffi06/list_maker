class ListsController < ApplicationController
respond_to :html, :json

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

      respond_with @list
    end

    def edit
      @list = List.find(params[:id])
      respond_with(@list)
    end

    def update
      @list = List.find(params[:id])
      @list.update_attributes(params[:list])
        
      respond_with do |format|
        format.html do
          if @list.save
            redirect_to task_url(@list)
          else
            render 'edit'
          end
        end

        format.json do
          if @list.save
            render :json => @list
          else
            render :json => @list.errors
          end
        end
      end
    end
    

    def destroy
      @list = List.find(params[:id])
      @list.destroy
      respond_with @list, :location => lists_path
    end

  end
