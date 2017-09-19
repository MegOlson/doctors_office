class Doctor
  attr_reader(:name, :speciality, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @speciality = attributes.fetch(:speciality)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors =[]
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      speciality = doctor.fetch("speciality")
      doctors.push(Doctor.new({:name => name, :id => id, :speciality => speciality}))
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
    result = DB.exec("INSERT INTO doctors (name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(another_doctor)
    self.name().==(another_doctor.name()).&(self.id().==(another_doctor.id()))
  end
end
