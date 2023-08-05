require_relative 'person'

class Teacher < Person
  attr_reader :id, :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @id = Random.rand(1..1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "[Teacher] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
