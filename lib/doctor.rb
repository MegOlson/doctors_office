class Doctor
  attr_reader(:name, :speciality, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @speciality = attributes.fetch(:speciality)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors =[]
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      doctor_id = doctor.fetch("id").to_i
      speciality = doctor.fetch("speciality")
      doctors.push(Doctor.new({:name => name, :doctor_id => doctor_id, :speciality => speciality}))
    end
    doctors
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
    @doctor_id = result.first().fetch("id").to_i
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.doctor_id().==(another_doctor.doctor_id()))
  end
end
