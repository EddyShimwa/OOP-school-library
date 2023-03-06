class Person
    # Getters&setters for @id, @name, and @age
     attr_reader :id
     attr_accessor :name, :age

     def initialize(name = "Unknown", age, parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
     end


     def can_use_services?
         is_of_age? || parent_permission
     end

     private

     def is_of_age?
         @age >= 18
     end
  end