require 'json'
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
    load_data_from_files
  end

  def list_all_books
    puts 'Here is the list of all books'
    @books.each do |book|
      puts "Title: \"#{book['title']}\", Author: #{book['author']}"
    end
  end

  def list_all_people
    puts 'Here is the list of all people'
    @people.each_with_index do |person, index|
      if person['json_class'] == 'Teacher'
        attribute_to_display = "Specialization: #{person['specialization']}"
      else
        attribute_to_display = "Parent Permission: #{person['parent_permission']}"
      end
      puts "#{index}) [#{person['json_class']}], ID: #{person['id']}, ID: #{person['age']}, ID: #{person['name']}, #{attribute_to_display}" 
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @people << student
    save_data_to_people
  end

  def create_teacher(age, specialization, name)
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    save_data_to_people
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    save_data_to_books
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
    save_data_to_rentals
  end

  def all_books_for_rent
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}, id: #{book['id']}"
    end
  end

  def all_person_name_for_rent
    @people.each_with_index do |person, index|
      if person['json_class'] == 'teacher'
        attribute_to_display = "Specialization: #{person['specialization']}"
      else
        attribute_to_display = "Parent Permission: #{person['parent_permission']}"
      end
      puts "#{index}) [#{person['json_class']}], ID: #{person['id']}, ID: #{person['age']}, ID: #{person['name']}, #{attribute_to_display}}" 
    end
  end

  def selected_book_for_rent(selection)
    return @books[selection] unless selection.negative? || selection >= @books.length

    puts 'Invalid selection. Please choose a valid index.'
  end

  def selected_person_for_rent(selection)
    return @people[selection] unless selection.negative? || selection >= @people.length

    puts 'Invalid selection. Please choose a valid index.'
  end

  def display_book_rented_by_person(id)
    rented_books_by_id = @rentals.select { |rental| rental['person']['id'] == id.to_i }

    if rented_books_by_id.empty?
      puts 'No rentals found for the given id. Please choose a valid id.'
    else
      rented_books_by_id.each do |rental|
        puts "Date: #{rental['date']}, Title: #{rental['book']['title']} by #{rental['book']['author']}"
      end
    end
  end

  def create_person_with_input
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp.to_i
    case input
    when 1
      create_student_with_input
    when 2
      create_teacher_with_input
    end
  end

  def create_student_with_input
    puts 'Creating Student...'
    print 'Student Age: '
    age = gets.chomp.to_i
    print 'Student Name: '
    name = gets.chomp
    print 'Parent Permission?(y/n): '
    parent_permission = gets.chomp.downcase
    parent_permission = parent_permission == 'y'
    create_student(age, name, parent_permission)
    puts 'Student created successfully'
  end

  def create_teacher_with_input
    puts 'Creating Teacher...'
    print 'Teacher Age: '
    age = gets.chomp.to_i
    print 'Teacher Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp.to_s
    create_teacher(age, specialization, name)
    puts 'Teacher created successfully'
  end

  def create_book_with_input
    puts 'Provide book information'
    print 'Book Title: '
    title = gets.chomp
    print 'Authore Name: '
    author = gets.chomp
    create_book(title, author)
    puts 'Book created successfully'
  end

  def create_rental_with_input
    puts 'Provide rental information'
    puts 'Select book from the following list by number:'
    all_books_for_rent
    selection = gets.chomp.to_i
    book = selected_book_for_rent(selection)
    puts 'Select person from the following list by number (not id):'
    all_person_name_for_rent
    selection1 = gets.chomp.to_i
    person = selected_person_for_rent(selection1)
    print 'Date:'
    date = gets.chomp.to_s
    create_rental(date, book, person)
    puts 'Rental created successfully'
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def search_rented_book_with_id
    print 'ID of the person: '
    id = gets.chomp.to_i
    puts 'List all rentals'
    display_book_rented_by_person(id)
  end
  

  def save_data_to_people
    File.open('people.json', "w")  { |file| file.write(JSON.dump(@people))}
  end

  def save_data_to_books
    File.open('books.json', "w")  { |file| file.write(JSON.dump(@books))}
  end

  def save_data_to_rentals
    File.open('rentals.json', "w")  { |file| file.write(JSON.dump(@rentals))}
  end

  def load_data_from_files
    @people = JSON.parse(File.read('people.json')) rescue []
    @books = JSON.parse(File.read('books.json')) rescue []
    @rentals = JSON.parse(File.read('rentals.json')) rescue []
  end
  
def exit_app
  puts 'Exiting the app....'
  exit(0)
end
end
