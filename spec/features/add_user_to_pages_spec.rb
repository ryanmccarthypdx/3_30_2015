require 'rails_helper'

describe "add a user process" do
  it 'adds a user' do
    visit unauthenticated_root_path
    click_on 'Sign up'
    fill_in "Username", :with => "Mike"
    fill_in "Email", :with => "Mike@James.com"
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"
    click_on "Sign up"
    expect(page).to have_content 'successfully'
  end

  it 'throws up errors when necessary' do
    visit unauthenticated_root_path
    click_on 'Sign up'
    fill_in "Email", :with => "Mike@James.com"
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"
    click_on "Sign up"
    expect(page).to have_content 'error'
  end
end
