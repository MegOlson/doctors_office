class Patient
  attr_reader(:name, :doctor_id, :birthday)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @doctor_id = attributes.fetch(:doctor_id)
    @birthday = attributes.fetch(:birthday)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      doctor_id = patient.fetch("id").to_i
      birthday = patient.fetch("birthday")
      patients.push(Patient.new({:name => name, :doctor_id => doctor_id, :birthday => birthday}))
    end
    patients
  end
end
