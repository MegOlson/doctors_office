class Speciality
  attr_reader(:type, :id)

  def initialize(attributes)
    @type = attributes.fetch(:type)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO speciality (type) VALUES ('#{@type}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def doctors
    doctors_list = []
    doctors = DB.exec("SELECT * FROM doctors WHERE spec_id = #{self.id()};")
    doctors.each do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id")
      spec_id = doctor.fetch("spec_id").to_i
      doctors_list.push(Doctor.new({:name => name, :id => id, :spec_id => spec_id}))
    end
  list_patients
  end
end
