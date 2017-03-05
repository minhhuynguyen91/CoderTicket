require 'rails_helper'

RSpec.feature "SignIns", :user do

  before do
    @user = FactoryGirl.create(:user)
    signin(@user.email, @user.password)
    puts "#{@user.email}, #{@user.password}"
  end

  scenario 'Visit login page and log in' do
    
    visit signin_path
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)

    expect(page).to have_content "Log in successfully"
  end
end
