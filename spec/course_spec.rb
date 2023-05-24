require 'rspec'
require './lib/course'
require './lib/student'

RSpec.describe Course do 
  before(:each) do
    @course = Course.new("Calculus", 2)
  end
    describe "initialize" do 
      it "exists" do 
        expect(@course).to be_an_instance_of(Course)
      end 

      it "initializes with passed through name and capacity" do 
        expect(@course.name).to eq("Calculus")
        expect(@course.capacity).to eq(2)
      end 

      it "has a default empty array to hold enrolled students" do 
        expect(@course.students).to eq([])
      end 
    end 

    describe "enrollment methods" do 
      it "can enroll students into course" do 
        student1 = Student.new({name: "Morgan", age: 21})
        student2 = Student.new({name: "Jordan", age: 29}) 
        @course.enroll(student1)    
        @course.enroll(student2)    
        expect(@course.students).to eq([student1, student2])
        expect(@course.students.count).to eq (2)
      end 

      it "can check if course is full or not" do 
        expect(@course.full?).to be false
        student1 = Student.new({name: "Morgan", age: 21})
        student2 = Student.new({name: "Jordan", age: 29}) 
        @course.enroll(student1)    
        expect(@course.full?).to be false
        @course.enroll(student2)  
        expect(@course.full?).to be true 
      end
      
      it "cannot add more students after capacity limit" do 
        student1 = Student.new({name: "Morgan", age: 21})
        student2 = Student.new({name: "Jordan", age: 29}) 
        student3 = Student.new({name: "Jaime", age: 30})
        @course.enroll(student1)    
        @course.enroll(student2)    
        expect(@course.enroll(student3)).to eq("Class is full!")
      end 
    end 

end