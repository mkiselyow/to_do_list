require 'rails_helper'

RSpec.feature "Registrations : ", :type => :feature do

  it "Unauthorized User can Sign Up(by devise gem) with message" do
    visit '/'
    expect(page).to have_no_content 'Signed in as'
    click_link 'Sign up'
    within(:css, "form#sign_up_user") do
      fill_in 'user_email', :with => 'I_am_new_user@gmail.com'
      fill_in 'user_password', :with => '12345678' 
      click_button 'Sign up'
    end
    within(:css, "p.notifications") do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
    expect(page).to have_content 'Signed in as'
  end

  it "Signed in User can Cancel Account(by devise gem) with message" do
    visit '/'
    click_link 'Sign in'
    within(:css, "form#sign_in_user") do
      fill_in 'user_email', :with => User.all.first.email
      fill_in 'user_password', :with => '12345678' 
      # password have been configured in factories.rb
      click_button 'Sign in'
      sleep(1)
    end
    expect(page).to have_content 'Signed in as'
    # find("#cancel_account", visible: false).click
    within(:css, "li#dropdown") do
      click_link 'Options', match: :second
      click_link 'Cancel my account'
    end
    page.accept_confirm do
      click_link 'OK'
    end
    sleep(1)
    expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
  end
end