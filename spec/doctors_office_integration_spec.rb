require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new doctor', {:type => :feature}) do
  it('allows a user to add a new doctor to the list') do
    visit('/')
    click_link('Add Doctor')
    fill_in('doctor_name', :with =>'Dr. Smith')
    fill_in('speciality', :with =>'Pediatrition')
    click_button('Add New Doctor')
    expect(page).to have_content('Success!')
  end
end

describe('adding a new patient', {:type => :feature}) do
  it('allows a user to add a new patient to the list') do
    visit('/')
    click_link('Add Patient')
    fill_in('patient_name', :with =>'Suzie')
    fill_in('birthday', :with =>'2004-04-20')
    click_button('Add New Patient')
    expect(page).to have_content('Success!')
  end
end
