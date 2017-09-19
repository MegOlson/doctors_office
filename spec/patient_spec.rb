require 'spec_helper'

describe("Patient") do
  let(:patient) {Patient.new({:name => "Suzie", :birthday => "2004-04-20", :doctor_id => nil})}
  it("creates instance of patient with Patient class when given name and birthday") do
    expect(patient.name).to eq ("Suzie")
  end

  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves each patient and details to database") do
      patient.save()
      expect(Patient.all()).to(eq([patient]))
    end
  end

  describe("#==") do
    it("is the same patient if they have the same name and doctor id") do
      patient1 = Patient.new({:name => "Suzie", :birthday => "2004-04-20", :doctor_id => nil})
      patient2 = Patient.new({:name => "Suzie", :birthday => "2004-04-20", :doctor_id => nil})
      expect(patient1).to(eq(patient2))
    end
  end
end
