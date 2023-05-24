require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'
require 'pry'

RSpec.describe Course do 
  before(:each) do
    @gradebook = Gradebook.new("Mr. Wilson")
  end

  describe "initialize" do 
    it "exists" do 
      expect(@gradebook).to be_an_instance_of(Gradebook)
    end 
    
    it "has an instructor" do 
      expect(@gradebook.instructor).to eq("Mr. Wilson")
    end 

    it "has courses" do 
      expect(@gradebook.courses).to be_an(Array)
    end 
  end 
  
  describe "gradebook methods" do 
    it "can add courses to its course book" do 
      @gradebook.add_course("Mod_1", 30)
      @gradebook.add_course("Finance", 45)
      expect(@gradebook.courses[0].name).to eq("Mod_1")
      expect(@gradebook.courses[0].capacity).to eq(30)
      expect(@gradebook.courses[1].name).to eq("Finance")
      expect(@gradebook.courses[1].capacity).to eq(45)
      expect(@gradebook.courses.count).to eq(2)
    end 

    it "can return students enrolled in all courses" do 
      course1 = @gradebook.add_course("Mod_1", 30)
      course2 = @gradebook.add_course("Finance", 45)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29}) 
      student3 = Student.new({name: "Jaime", age: 30})
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      expect(@gradebook.list_all_students).to be_a(Hash)
      expect(@gradebook.list_all_students.count).to eq(2)
      expect(@gradebook.list_all_students.keys.first).to be_an_instance_of(Course)
      expect(@gradebook.list_all_students.values.first[0]).to be_an_instance_of(Student)
    end 

    it "can return students under a certain threshold" do 
      course1 = @gradebook.add_course("Mod_1", 30)
      course2 = @gradebook.add_course("Finance", 45)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29}) 
      student3 = Student.new({name: "Jaime", age: 30})
      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)

      student1.log_score(90)
      student2.log_score(80)
      student3.log_score(70)

      expect(@gradebook.students_below(75)). to be_an(Array)
      expect(@gradebook.students_below(75).count).to eq(1)
      expect(@gradebook.students_below(75)[0]).to eq(student3)
      expect(@gradebook.students_below(85).count).to eq(2)

    end 

  end 

end 