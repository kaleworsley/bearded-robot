require "spec_helper"

feature "User Session" do
  before(:each) { @user = FactoryGirl.create(:user, :email => "test@example.com", :password => "secret") }
  scenario "User logs in with valid credentials" do
    visit "/login"
    
    fill_in "Email", :with => "test@example.com"
    fill_in "Password", :with => "secret"

    click_button "Log In"
    
    current_path.should eq '/'
    expect(page).to have_text("Logged in!")
  end
  
  scenario "User logs in with invalid credentials" do
    visit "/login"
    
    fill_in "Email", :with => "fake@example.com"
    fill_in "Password", :with => "fake"

    click_button "Log In"
    
    current_path.should eq '/login'
    expect(page).to have_text("Email or password is invalid")
  end
  
  scenario "User logs out" do
    login

    click_link 'Log Out'
    expect(page).to have_text("Logged out!")
  end
end
