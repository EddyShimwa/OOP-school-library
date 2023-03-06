require_relative 'person_class'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age:, name: 'Unknown', parent_permission: true, specialization: 'Unknown')
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
