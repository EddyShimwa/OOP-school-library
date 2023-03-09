require_relative 'student_class'

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << (student)
    student.classroom = self
  end
end

classroom = Classroom.new('Class A')
student = Student.new(classroom: classroom, name: 'John', age: 15, parent_permission: true)
classroom.add_student(student)
puts student.classroom.label #=> "Class A"
