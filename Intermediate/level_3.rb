class Player
  def initialize
    @direction = [:forward, :left, :backward]
    @move = nil
  end

  def play_turn(warrior)
    if @direction.size > 0
      if warrior.feel(@direction[0]).enemy?
        warrior.bind!(@direction[0])
      elsif warrior.feel(@direction[0]).captive?
        warrior.rescue!(@direction[0])
      end
      @direction.shift
    elsif !@move.nil?
      if warrior.feel(@move).captive?
        warrior.rescue!(@move)
      elsif warrior.feel(@move).enemy?
        warrior.attack!(@move)
      elsif warrior.feel(@move).empty?
        warrior.walk!(@move)
      end
      @move = warrior.direction_of_stairs
    elsif warrior.health < 17
      warrior.rest!
    elsif warrior.health >= 17
      @move = warrior.direction_of_stairs
      warrior.rest!
    end
  end
end
