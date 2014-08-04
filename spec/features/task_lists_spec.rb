require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")
    login_user
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario "User can link to the about page" do
    visit "/"
    expect(page).to have_link("About")
    click_on "About"
    expect(page).to have_css("#about")
  end

  scenario "User can add a new task list" do
    create_user email: "user@example.com"
    login_user
    expect(page).to have_link("Create Task List")
    click_on "Create Task List"
    expect(page).to have_css("#new_task_lists")
    fill_in "Title", with: "My Other Task"
    click_on "Create Task List"
    expect(page).to have_content("Task List was created")
    expect(page).to have_content("My Other Task")
  end

  scenario "User can not add a task without a name" do
    create_user email: "user@example.com"
    login_user
    click_on "Create Task List"
    fill_in "Title", with: ""
    click_on "Create Task List"
    expect(page).to have_css("#new_task_lists")
    expect(page).to have_content("Your task list could not be created")
  end


#   As a user
#   Given I'm logged in
# When I am adding a task list
# And I don't fill in the title field
#   And I press "Create Task List"
#   Then I should see a message that reads "Your task list could not be created" (in maroon)



end