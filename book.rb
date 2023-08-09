class Book
  attr_accessor :title, :author, :id

  def initialize(title, author)
    @id = Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals.push(Rental.new(date, self, person)) unless @rentals.include?(Rental.new(date, self, person))
  end

  def to_s
    "Title: #{@title}, Author: #{@author}, ID: #{@id}"
  end

  def to_json(*arg)
  {
  id: self.id,
  title: self.title,
  author: self.author
  }.to_json(*arg)
  end

  def self.json_create(object)
    new(object['id'], object['title'], object['author'])
  end

end
