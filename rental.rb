class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_s
    "Book Title: #{@book}, Date: #{@date}, Person ID: #{@person}"
  end

  def to_json(*arg)
    { 
      JSON.create_id => self.class.name,
      date: self.date,
      book: self.book,
      person: self.person,
    }.to_json(*arg)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['person'])
  end
end
