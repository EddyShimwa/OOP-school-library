require 'set'

class Person
    attr_accessor :name, :email

    def initialize(name, email)
      @name = name
      @email = email
    end

    def greet
      puts "Hello, I'm #{name}, my email is #{email}"
    end

end
person = Person.new("bob", "bob@example.com")



File.open("people.txt", "a") do |file|
    file.puts "#{person.name}, #{person.email}"
end

people = []

File.open("people.txt", "r") do |file|
  file.each_line do |line|
    name, email = line.chomp.split(",")
    person = Person.new(name, email)
    people << person
  end
end

def remove_duplicates(arr)

    # Convert array to set to remove duplicates, then convert back to array
    return arr.to_set.to_a
end

new_arr = remove_duplicates(people)

puts new_arr.inspect