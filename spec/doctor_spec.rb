require 'spec_helper'

describe("Doctor") do
  let(:doctor) {Doctor.new({:name => "Dr.Smith", :id => nil, :speciality => "Pediatrician"})}
  it("creates instance of doctor with Doctor class when given name and speciality") do
    expect(doctor.name).to eq ("Dr.Smith")
  end

  describe(".all") do
    it("is empty at first") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves each doctor and details to database") do
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe(".find") do
    it("returns doctor when given its ID") do
      test_doctor1 = Doctor.new({:name => "Dr. Smith", :id => nil, :speciality => "Pediatrition"})
      test_doctor1.save()
      test_doctor2 = Doctor.new({:name => "Dr. Orion", :id => nil, :speciality => "Oncologist"})
      test_doctor2.save()
      expect(Doctor.find(test_doctor1.id)).to(eq(test_doctor1))
    end
  end

  # describe("patients") do
  #   it("returns list of patients with assigned doctor id") do
  #     expect()
  #   end
  # end

end
