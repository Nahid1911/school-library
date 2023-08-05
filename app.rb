require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

class App
  
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each do |book|
    puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |people|
    puts people.to_s
    end
  end

  def create_student (age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @people << student
  end

  def create_teacher (age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals<< rental
  end

  def all_books_for_rent
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def all_person_name_for_rent
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{index}) [Unknown Person] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
  

  def selected_book_for_rent(selection)
    if selection < 0 || selection >= @books.length
      puts "Invalid selection. Please choose a valid index."
      else
       return @books[selection].id
    end
  end

  def selected_person_for_rent(selection)
    if selection < 0 || selection >= @people.length
      puts "Invalid selection. Please choose a valid index."
      else
        return  @people[selection].id
    end
  end


  # def list_all_rentals_id
  #   @rentals.each do |rental|
  #   p rental
  #   end
  # end

  def display_book_rented_by_person(id)
    rented_books_by_id = @rentals.select { |rental| rental.person == id.to_i }
  
    if rented_books_by_id.empty?
      puts "No rentals found for the given id. Please choose a valid id."
    else
      rented_books_by_id.each do |rental|
        book = @books.find { |b| b.id == rental.book }
        puts "Date: #{rental.date}, Title: #{book.title} by #{book.author}"
      end
    end
  end 
end
