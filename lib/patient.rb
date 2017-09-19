class Patient
  attr_reader(:name, :id, :birthday)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @birthday = attributes.fetch(:birthday)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      birthday = patient.fetch("birthday")
      patients.push(Patient.new({:name => name, :id => id, :birthday => birthday}))
    end
    patients
  end

  def ==(another_patient)
    self.name().==(another_patient.name()).&(self.id().==(another_patient.id()))
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{@name}', '#{@birthday}') RETURNING id ;")
    @id = result.first().fetch("id").to_i
  end
end
