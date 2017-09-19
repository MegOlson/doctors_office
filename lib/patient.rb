class Patient
  attr_reader(:name, :doctor_id, :birthday)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @doctor_id = attributes.fetch(:doctor_id)
    @birthday = attributes.fetch(:birthday)
  end
end
