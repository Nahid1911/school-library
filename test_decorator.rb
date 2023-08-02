require_relative 'person'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'


person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name


Student.new(5, 'Hia')
Student.new(2, math_class, 'Hima')
Student.new(28, math_class, 'Chaity')
Classroom.new('Math Class')
