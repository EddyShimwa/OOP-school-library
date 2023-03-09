require_relative 'person_class'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    @parent_permission = parent_permission
    super(name: name, age: age, parent_permission: parent_permission)

    @classroom = classroom
    classroom.add_student(self)
  end

  # Method play_hooky that returns "¯\(ツ)/¯".
  def play_hooky
    '¯(ツ)/¯'
  end
end
