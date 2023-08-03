require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end
  
  def classroom = (classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
