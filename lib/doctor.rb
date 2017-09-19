class Doctor
  attr_reader(:name, :id, :spec_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @spec_id = attributes.fetch(:spec_id)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors =[]
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      spec_id = doctor.fetch("spec_id").to_i
      doctors.push(Doctor.new({:name => name, :id => id, :spec_id => spec_id}))
    end
    doctors
  end

  def self.find(id)
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.id().==(id)
        found_doctor = doctor
      end
    end
    found_doctor
  end

  def save
    result = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id().==(another_doctor.id()))
  end

  def patients
    list_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()};")
    patients.each do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i
      list_patients.push(Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id}))
    end
  list_patients
  end
end
