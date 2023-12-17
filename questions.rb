class Question
  attr_accessor :question, :answer

  def initialize(num_max_difficulty)
    @num1 = rand(num_max_difficulty)
    @num2 = rand(num_max_difficulty)
    @question = "What is #{@num1} plus #{@num2} equals to?"
    @answer = @num1 + @num2
  end

  def to_s
    @question
  end
end
