require 'spec_helper'

describe "site administrator" do
  it "access admin dashboard" do
    Student.create(
    username: 'admin',
    password: 'locked',
    confirm_password: 'locked')

    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: 'admin'
    fill_in 'Password', with: 'locked'
    click_button 'Log In'

    current_path.should eq admin_dashboard_path
    within 'h1' do
      page.should have_content'Post Result'
    end
  end
end
