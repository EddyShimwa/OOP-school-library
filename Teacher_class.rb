require_relative 'Person_class'

class Teacher < Person
 attr_accessor :specialization
 
    def initialize(name = "Unknown", age, parent_permission = true, specialization)
        @specialization = specialization
    end

    def can_use_services?
       true
    end
end