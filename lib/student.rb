class Student

  attr_reader :name, :age, :scores


  def initialize(information)
    @name = information[:name]
    @age = information[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end 

  def grade
    average = 0.0
    @scores.each do |score|
      average +=score 
    end 
    average = average/@scores.count 
    average
  end 
end
