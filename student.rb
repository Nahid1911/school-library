require_relative 'person'

class Student < Person
  attr_accessor :id, :parent_permission

  def initialize(age, name, parent_permission)
    super(age, name)
    @id = Random.rand(1..1000)
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_s
    "[Student] Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end

  def to_json(*arg)
    { 
      JSON.create_id => self.class.name,
      id: self.id,
      age: self.age,
      name: self.name,
      parent_permission: self.parent_permission
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(object['age'], object['id'], object['name'], object['parent_permission'])
  end
end
