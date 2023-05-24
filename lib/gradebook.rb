class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor 
    @courses = []
  end 

  def add_course(name, capacity)
    new_course = Course.new(name, capacity)
    @courses << new_course
  end 
end
