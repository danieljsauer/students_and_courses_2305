class Course

  attr_reader :name, :capacity, :students

  def initialize(name, capacity)
    @name = name 
    @capacity = capacity
    @students = []
  end 

  def enroll(student)
    if @students.count < capacity
    @students << student
    else 
      "Class is full!"
    end 
  end 

  def full?
    if @students.count >= capacity
      true 
    else 
      false 
    end 
  end 


end
