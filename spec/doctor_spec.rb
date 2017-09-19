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
end
