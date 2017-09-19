class Doctor
  attr_reader(:name, :speciality, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @speciality = attributes.fetch(:speciality)
    @doctor_id = attributes.fetch(:doctor_id)
  end
end
