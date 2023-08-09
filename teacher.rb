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
    "[Teacher] Name: #{@name}, ID: #{@id}, Age: #{@age}, Specialization: #{specialization}"
  end

  def to_json(*arg)
    {
      JSON.create_id => self.class.name,
      id: self.id,
      name: self.name,
      age: self.age,
      specialization: self.specialization
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(object['id'], object['age'], object['name'], object['specialization'])
  end
end
