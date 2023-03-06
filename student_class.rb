require_relative 'person_class'

class Student < Person
  def initialize(classroom:, name: 'Unknown', age: 0, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  # Method play_hooky that returns "¯\(ツ)/¯".
  def play_hooky
    '¯(ツ)/¯'
  end
end
