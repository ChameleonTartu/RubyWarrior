class Player
  def play_turn(warrior)
    @places = warrior.listen
    if @places.size > 0
      @direction = warrior.direction_of(@places[0])
      if warrior.feel(@direction).stairs?
        warrior.walk!(:left)
      elsif warrior.feel(@direction).empty? && warrior.health < 20
        warrior.rest!
      elsif warrior.feel(@direction).empty?
        warrior.walk!(@direction)
      elsif warrior.feel(@direction).enemy? && warrior.health < 7
        warrior.walk! :backward
      elsif warrior.feel(@direction).enemy?
        warrior.attack!(@direction)
      elsif warrior.feel(@direction).captive?
        warrior.rescue!(@direction)
      end
    else
      @direction = warrior.direction_of_stairs
      warrior.walk!(@direction)
    end
  end
end
