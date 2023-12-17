class Turn
  def initialize(player)
    @current_player = player
    @current_question = Question.new(50)
    @answer = @current_question.answer
  end

  def start
    puts '------NEW TURN-------'
    puts "#{@current_player}: #{@current_question}"
    user_answer = gets.chomp

    if user_answer.to_i == @answer
      puts "#{@current_player} YES! You are correct."
      @current_player.score += 1
      return
    end

    puts "#{@current_player} Serously? No!"
  end
end
