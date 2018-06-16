require 'rails_helper'

describe "Sessions : ", :type => :feature, js: true do

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
      sleep(1)
    end
    expect(page).to have_content 'Signed in successfully.'
    click_link 'Sign out'
    sleep(1)
    # page.has_css?('.alert.alert-danger')
    expect(page).to have_content 'Signed out successfully.'
  end
end