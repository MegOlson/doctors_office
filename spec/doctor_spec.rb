require 'spec_helper'

describe("Doctor") do
  let(:doctor) {Doctor.new({:name => "Dr.Smith", :doctor_id => nil, :speciality => "Pediatrician"})}
  it("creates instance of doctor with Doctor class when given name and speciality") do
    expect(doctor.name).to eq ("Dr.Smith")
  end

  # describe(".all") do
  #   it("creates instance of doctor with Doctor class when given name and speciality") do
  #
  #   end
  # end

end
