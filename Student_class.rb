require_relative 'Person_class'

class Student < Person
    def initialize(name = "Unknown", age, parent_permission = true, classroom)
        @classroom = classroom
    end
    
    #Method play_hooky that returns "¯\(ツ)/¯".
    def play_hooky
        "¯\(ツ)/¯"
    end
end