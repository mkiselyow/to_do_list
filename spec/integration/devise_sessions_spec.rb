require 'rails_helper'

describe "Sessions : ", :type => :feature do

  it "Existing(from seeds.rb) User can Sign In(by devise gem) with message" do
    visit '/'
    click_link 'Sign in'
    within(:css, "form#sign_in_user") do
      fill_in 'user_email', :with => User.all.first.email
      fill_in 'user_password', :with => '12345678' 
      # password have been configured in factories.rb
      click_button 'Sign in'
    end
    expect(page).to have_content 'Signed in successfully.'
  end

  it "Signed in User can Sign out(by devise gem) with message" do
    visit '/'
    click_link 'Sign in'
    within(:css, "form#sign_in_user") do
      fill_in 'user_email', :with => User.all.first.email
      fill_in 'user_password', :with => '12345678' 
      # password have been configured in factories.rb
      click_button 'Sign in'
      sleep(3)
    end
    click_link 'Sign out'
    sleep(3)
    expect(page).to have_content 'Signed out successfully.'
  end
end