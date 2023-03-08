require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  # Getters&setters for @id, @name, and @age
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end

person = Person.new(age: 22, name: 'maximilianus')
person.correct_name
capitalizedperson = CapitalizeDecorator.new(person)
capitalizedperson.correct_name
capitalizedtrimmedperson = TrimmerDecorator.new(capitalizedPerson)
capitalizedtrimmedperson.correct_name
