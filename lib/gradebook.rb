class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor 
    @courses = []
  end 

  def add_course(name, capacity)
    new_course = Course.new(name, capacity)
    @courses << new_course
    new_course #lost 15 minutes because I forgot this 
  end 

  def list_all_students
    all_students = {}
    @courses.each do |course|
      all_students[course] = course.students
    end 
    all_students
  end 

  def students_below(threshold)
    below_threshold = []
    @courses.each do |course|
      course.students.each do |student|
        if student.grade < threshold
          below_threshold << student
        end 
      end
    end
    below_threshold 
  end 
end
