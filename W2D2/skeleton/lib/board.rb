class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1 
    @name2 = name2 
    @cups = Array.new(14){[]}
    14.times do |i|
      if i != 6 && i != 13
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13)
      raise "Invalid starting cup" 
    elsif cups[start_pos].empty? 
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    selected_cup_stones = cups[start_pos]
    cups[start_pos] = []
    opponent_cup = 13
    opponent_cup = 6 if current_player_name == @name2 
    stones_remaining = selected_cup_stones.length 
    current_position = start_pos
    while stones_remaining > 0 
      current_position = (current_position + 1) % 14
      if current_position != opponent_cup
        cups[current_position] << :stone 
        stones_remaining -= 1
      end
    end
    render
    next_turn(current_position)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].size > 1
      ending_cup_idx
    elsif cups[ending_cup_idx].size == 1
      :switch
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if cups[0..5].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
      return true 
    else
      return false
    end
  end

  def winner
    case cups[6].size <=> cups[13].size
    when 1 
      @name1 
    when -1
      @name2
    when 0 
      :draw
    end
  end
end
