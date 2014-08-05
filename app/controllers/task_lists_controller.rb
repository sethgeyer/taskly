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
      render :new
    end

  end

  def edit
    @task = TaskList.find(params[:id].to_i )
  end

  def update
    @task = TaskList.find(params[:id].to_i)
    @task.name = params[:task_list][:name]
    @task.save
    redirect_to "/"
  end



  # As a user
  # When I log in I should see a "new task" link next to each task list name
  # When I click that link, I should see a description field and a date field (w/ year / month / day dropdowns)
  # When I fill in a description and click "Create Task" I should see the task appear beneath the task list
  # And I should see a flash message that reads "Task was created successfully!"
  # Each task should have the due date represented in relative time

  





end