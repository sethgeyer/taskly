require 'rails_helper'
require 'capybara/rails'

feature "tasks" do
  scenario "user can create tasks for a particular task list" do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    id = TaskList.first.id
    login_user
    visit "/task_lists/#{id}/tasks/new"
    fill_in "Description", with: "This is my subtask"
    select "2014", from: "due_date_year"
    select "August", from: "due_date_month"
    select "5", from: "due_date_day"

    click_on "Create Task"
    expect(page).to have_content("This is my subtask")
    # expect(page).to have_content("2014-08-05")
    expect(page).to have_content("Task was created successfully")
  end


  scenario "user sees an error notice if they fail to provide a description for a task" do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    id = TaskList.first.id
    login_user
    visit "/task_lists/#{id}/tasks/new"
    fill_in "Description", with: ""
    select "2014", from: "due_date_year"
    select "August", from: "due_date_month"
    select "5", from: "due_date_day"
    click_on "Create Task"
    expect(page).to have_css("#new_tasks")
    expect(page).to have_content("Your task could not be created")
  end





end