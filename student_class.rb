require_relative 'person_class'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name:, parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
