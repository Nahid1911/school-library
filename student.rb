require_relative 'person'

class Student < Person
  attr_reader :id, :parent_permission

  def initialize(age, name, parent_permission = true)
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
end
