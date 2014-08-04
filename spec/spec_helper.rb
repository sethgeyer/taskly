RSpec.configure do |config|
end

def login_user
  visit signin_path
  fill_in "Email", with: "user@example.com"
  fill_in "Password", with: "password"
  click_on "Login"
end