class TasksController < ApplicationController

  def new
    @task_list = TaskList.find(params[:id])
    @task = Task.new
    @task.task_list_id = @task_list.id
  end

  def create
    @task = Task.new
    @task.task_list_id = params[:task][:task_list_id]
    @task.description = params[:task][:description]
    @task.due_date = Date.new(params[:due_date][:year].to_i, params[:due_date][:month].to_i, params[:due_date][:day].to_i)
    if @task.save
      flash[:notice] = "Task was created successfully"
      redirect_to "/"
    else
      @task_list = TaskList.find(params[:task][:task_list_id])
      flash[:notice] = "Your task could not be created"
      render :new
    end

  end

end

# Each task should have the due date represented in relative time



# As a user
# When I am adding a task
# And I don't fill in the description field
# And I press "Create Task"
# Then I should see a message that reads "Your task could not be created" (in maroon)
# And the label for the description field should be maroon.
