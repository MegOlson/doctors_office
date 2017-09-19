class Patient
  attr_reader(:name, :birthday, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i
      patients.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
    patients
  end

  def ==(another_patient)
    self.name().==(another_patient.name()).&(self.id().==(another_patient.id()))
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', #{@doctor_id});")
  end
end
