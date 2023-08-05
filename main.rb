require_relative 'app'

def main

  app = App.new()

  loop do
    puts "Welcome to School Library App!"
    puts
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "Here is the list of all books"
      app.list_all_books


    when 2
      puts "Here is the list of all people"
      app.list_all_people


    when 3
      print "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
      input = gets.chomp.to_i
      case input
        when 1
          puts "Creating Student..."
          print "Student Age: "
          age=gets.chomp.to_i
          print "Student Name: "
          name=gets.chomp
          print "Parent Permission?(y/n): "
          parent_permission = gets.chomp.downcase
          (parent_permission == "y")? parent_permission = true : parent_permission = false
          app.create_student(age, name, parent_permission)
          puts "Student created successfully"
        when 2
          puts "Creating Teacher..."
          print "Teacher Age: "
          age = gets.chomp.to_i
          print "Teacher Name: "
          name = gets.chomp
          print "Specialization: "
          specialization = gets.chomp.to_s
          app.create_teacher(age, specialization, name)
          puts "Teacher created successfully"
        end

    when 4
      puts "Provide book information"
      print "Book Title: "
      title = gets.chomp
      print "Authore Name: "
      author = gets.chomp
      app.create_book(title, author)
      puts "Book created successfully"

    when 5
      puts "Provide rental information"
      puts "Select book from the following list by number:"
      app.all_books_for_rent
      selection = gets.chomp.to_i
      book = app.selected_book_for_rent(selection)
      puts "Select person from the following list by number (not id):"
      app.all_person_name_for_rent
      selection1 = gets.chomp.to_i
      person = app.selected_person_for_rent(selection1)
      print "Date:"
      date = gets.chomp.to_s
      app.create_rental(date, book, person)
      puts "Rental created successfully"

    when 6
      print "ID of the person: "
      id = gets.chomp.to_i
      puts "List all rentals"
      app.display_book_rented_by_person(id)

    when 7
      puts "Exiting the app...."
      break
    else 
      puts "Invalid input, please try again."
    end
    puts
  end
end

main
