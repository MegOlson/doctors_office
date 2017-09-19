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
describe('viewing all of the doctors', {:type => :feature}) do
  it('allows a user to see all the doctors in a list') do
    doctor = Doctor.new({:name => "Dr. Strange", :id => nil, :speciality => "strangeness"})
    doctor.save()
    visit('/')
    click_link('List of Doctors')
    expect(page).to have_content(doctor.name)
  end
end
describe('seeing patients for a single doctor', {:type => :feature}) do
  it('allows a user to click a doctor to see their patients') do
    test_doctor = Doctor.new({:name => "Dr. Strange", :id => nil, :speciality => "strangeness"})
    test_doctor.save()
    test_patient = Patient.new({:name => "Suzie", :birthday => '2004-04-20', :doctor_id => test_doctor.id()})
    test_patient.save()
    visit('/doctors')
    click_link(test_doctor.name())
    expect(page).to have_content(test_patient.name())
  end
end
describe('adding patients to a doctor', {:type => :feature}) do
  it('allows a user to add a patient to a doctor') do
    test_doctor = Doctor.new({:name => 'Dr. Strange', :id => nil, :speciality => "strangeness"})
    test_doctor.save()
    visit("/doctors/#{test_doctor.id()}")
    fill_in("patient_name", :with => "Suzie")
    fill_in("birthday", :with => "2004-04-20")
    click_button("Add New Patient")
    expect(page).to have_content("Success!")
  end
end
