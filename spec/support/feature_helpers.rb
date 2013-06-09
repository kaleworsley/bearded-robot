module FeatureHelpers
  def login(user = FactoryGirl.create(:user))
    visit login_path
    fill_in "Email",    :with => user.email
    fill_in "Password", :with => user.password
    click_button 'Log In'
    user
  end
end
