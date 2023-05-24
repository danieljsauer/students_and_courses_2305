require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

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
      xit "can add courses to its course book" do 
      @gradebook.addcourse("Mod_1", 30)
      @gradebook.addcourse("Finance", 45)
      expect(@gradebook.courses[0].name).to eq("Mod_1")
      expect(@gradebook.courses[0].capacity).to eq(30)
      expect(@gradebook.courses[1].name).to eq("Finance")
      expect(@gradebook.courses[1].capacity).to eq(45)
      expect(@gradebook.courses.count).to eq(2)
    end 




  end 

end 