require 'spec_helper'

describe("Patient") do
  let(:patient) {Patient.new({:name => "Suzie", :doctor_id => nil, :birthday => "2004-04-20"})}
  it("creates instance of patient with Patient class when given name and birthday") do
    expect(patient.name).to eq ("Suzie")
  end

  # describe(".all") do
  #   it("is empty at first") do
  #     expect(Doctor.all()).to(eq([]))
  #   end
  # end
  #
  # describe("#save") do
  #   it("saves each doctor and details to database") do
  #     doctor.save()
  #     expect(Doctor.all()).to(eq([doctor]))
  #   end
  # end
end
