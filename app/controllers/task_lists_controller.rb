class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new
    @new_task = TaskList.new
  end

  def create
    @new_task = TaskList.new
    @new_task.name = params[:task_list][:name]

    if @new_task.save
      flash[:notice] = "Task List was created"
      redirect_to "/"
    else
      @new_task
      render :new
    end

  end

end