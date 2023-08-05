require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown')
    super()
    @age = age
    @name = name
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals.push(Rental.new(date, self, book)) unless @rental.include?(Rental.new(date, self, book))
  end

  private def of_age?
    @age >= 18
  end

  def to_s
    "[Person] Name: #{name}, ID: #{id}, Age: #{age}"
  end
end
