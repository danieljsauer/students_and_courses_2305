class Student

  attr_reader :name, :age, :scores


  def initialize(information)
    @name = information[:name]
    @age = information[:age]
    @scores = []
  end
  
  
end
