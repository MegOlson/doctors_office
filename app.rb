require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "doctors_office"})

get('/') do
  erb(:index)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

get('/doctor/new') do
  erb(:doctor_form)
end

get('/doctors/:id') do
  @doctor = Doctor.find(params.fetch("id").to_i())
  erb(:doctor)
end

post('/doctors') do
  doctor_name = params.fetch("doctor_name")
  speciality = params.fetch("speciality")
  doctor = Doctor.new({:name => doctor_name, :id => nil, :speciality => speciality})
  doctor.save()
  erb(:success)
end

post('/patients') do
  patient_name = params.fetch("patient_name")
  birthday = params.fetch("birthday")
  doctor_id = params.fetch("doctor_id").to_i
  @doctor = Doctor.find(doctor_id)
  @patient = Patient.new({:name => patient_name, :birthday => birthday, :doctor_id => doctor_id})
  @patient.save()
  erb(:success)
end
