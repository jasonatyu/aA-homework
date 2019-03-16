require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    if !@game_over
      show_sequence
      require_sequence
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      p "#{color}"
      sleep(1)
      system("clear")
      sleep(1)
    end
  end

  def require_sequence
    current_entry = 0 
    p 'Enter the sequence:'
    until current_entry == seq.length
    p 'Enter the next color in the sequence:'
      entered_sequence = gets.chomp
      if entered_sequence == seq[current_entry]
        current_entry += 1
      else 
        @game_over = true 
        game_over_message
        break
      end 
    end
    system("clear")
    take_turn
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p 'Round is over.'
  end

  def game_over_message
    p 'Game over!'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end
end