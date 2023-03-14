require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def colorize_output(color_code, statements)
    puts "\e[#{color_code}m#{statements}\e[0m"
  end

  def colorize_outprint(color_code, statements)
    print "\e[#{color_code}m#{statements}\e[0m"
  end

  def list_all_books
    if @books.empty?
      colorize_output(23, 'Please insert books first!!')
    else
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
    display_list
    continue
  end

  def list_all_people
    if @people.empty?
      colorize_output(31, 'Please insert people first!!')
    else
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    display_list
    continue
  end

  def create_person
    colorize_outprint(35, 'Do you want to create a student (1) or a teacher (2)? [Input the number]: ')

    case gets.chomp
    when '1'
      colorize_output(36, 'Enter Student details')
      colorize_outprint(35, 'Name: ')
      name = gets.chomp

      colorize_outprint(35, 'Age: ')
      age = gets.chomp

      colorize_outprint(35, 'Has parent permission? [Y/N]: ')
      permission = gets.chomp.downcase
      case permission
      when 'y' then parent_permission = true
      when 'n' then parent_permission = false
      end

      student = Student.new(age: age, name: name, parent_permission: parent_permission)
      @people.push(student)
      colorize_output(34, 'Person Student Created successfully')
    when '2'
      colorize_output(36, 'Enter Teacher details')
      colorize_outprint(35, 'Name: ')
      name = gets.chomp

      colorize_outprint(35, 'Age: ')
      age = gets.chomp

      colorize_outprint(35, 'Specialization: ')
      specialization = gets.chomp
      @people.push(Teacher.new(age: age, name: name, specialization: specialization))
      colorize_output(34, 'Person Teacher Created successfully')
    end
    display_list
    continue
  end

  def create_book
    colorize_output(36, 'Enter Book details')
    colorize_outprint(35, 'Title: ')
    title = gets.chomp

    colorize_outprint(35, 'Author: ')
    author = gets.chomp

    @books.push(Book.new(title, author))

    colorize_output(36, 'You have successfully created your book')
    display_list
    continue
  end

  def list_all_books_with_numbers
    if @books.empty?
      colorize_output(34, 'Please insert books first!')
      display_list
      continue
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_person_with_numbers
    if @people.empty?
      colorize_output(34, 'Please insert people first!!')
      display_list
      continue
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_rental()
    colorize_output(36, 'Select a book from the following list by number')
    list_all_books_with_numbers
    book_option = gets.chomp.to_i

    colorize_output(36, 'Select a person from the following list by number (not id)')
    list_all_person_with_numbers
    person_option = gets.chomp.to_i

    colorize_outprint(36, 'Date: ')
    date = gets.chomp
    Rental.new(date, @books[book_option], @people[person_option])

    colorize_output(36, 'Rental created successfully')
    display_list
    continue
  end

  def list_rentals_of_person_id()
      print 'Person ID: '
      id = gets.chomp.to_i

      rentals = @rentals.filter { |rental| rental.person.id == id }
      puts 'List of Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
      end
    display_list
    continue
  end

  def continue
    user_option = gets.chomp

    case user_option
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rentals_of_person_id
    when '7'
      colorize_output(34, 'Thank you for using this application')
      exit
    end
  end
end
