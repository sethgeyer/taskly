class TasksController < ApplicationController

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new
    @task.task_list_id = @task_list.id
  end

  def create
    @task = Task.new
    @task.task_list_id = params[:task_list_id]
    @task.description = params[:task][:description]
    @task.due_date = Date.new(params[:due_date][:year].to_i, params[:due_date][:month].to_i, params[:due_date][:day].to_i)
    if @task.save
      flash[:notice] = "Task was created successfully"
      redirect_to "/"
    else
      @task_list = TaskList.find(params[:task_list_id])
      render :new
    end

  end

end


# As a user
# Given that I'm logged in
# When I click the "Delete" link next to a task
# Then I see a flash message that reads "Task was deleted successfully!"
# And I should no longer see that task