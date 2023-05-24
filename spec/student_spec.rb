require 'rspec'
require './lib/student'

RSpec.describe Student do
  before(:each) do
    @student = Student.new
  end
  
  describe "initalize" do 
    it "exists" do 
      expect(@student).to be_an_isntance of(Student)
    end
    
    it "has name and age key values" do
      expect(@student.name).to eq("Morgan")
      expect(@student.age).to eq(21)
    end 

    it "student scores is assigned as an empty array" do 
      expect(@student.scores).to eq([])
    end 
  end 

  describe "log score and grade methods" do 
    it "can add scores into the scores array" do 
      @student.log_score(89)
      @student.log_score(78)
      expect(@student.scores).to eq([89, 78])
      expect(@student.scores.count).to eq(2)
    end  
    it "can return the average of the student scores" do
      @student.log_score(89)
      @student.log_score(78)
      expect(@student.grade).to eq(83.5) 
    end 

  end 
end