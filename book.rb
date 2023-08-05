class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals.push(Rental.new(date, self, person)) unless @rentals.include?(Rental.new(date, self, person))
  end
end
