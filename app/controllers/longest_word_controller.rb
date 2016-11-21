class LongestWordController < ApplicationController

  def game
    @grid = generate_grid(9)
     @start_time = Time.now
  end

  def score
    @end_time = Time.now
    @start_time = Time.parse(params[:start_time])
    @total_time = @end_time - @start_time
    @word = params[:word]
    @compute_score = compute_score(@word, @total_time)
    @score_and_message = score_and_message(@word, @grid, @total_time)
  end


  def generate_grid(grid_size)
  Array.new(grid_size) { ('A'..'Z').to_a[rand(26)] }
  end



def compute_score(attempt, time_taken)
  ((time_taken > 60.0) ? 0 : attempt.size * (1.0 - time_taken / 60.0)).round
end

def score_and_message(attempt, grid, time)
 if @compute_score > 0
  return "Well done"
else
  return "you suck"
end
end


end
