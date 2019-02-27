class Player
  def play_turn(warrior)
    @places = warrior.listen
    if @places.size > 0
      if @places.size < 3 && 
         warrior.feel(@direction).empty? &&
         warrior.health < 20
         warrior.rest!
         @direction = warrior.direction_of(@places[0])
      elsif warrior.health < 7
        warrior.walk! :backward
      else
        @direction = warrior.direction_of(@places[0])
        if warrior.feel(@direction).enemy?
          warrior.attack!(@direction)
        elsif warrior.feel(@direction).captive?
          warrior.rescue!(@direction)
        else
          warrior.walk!(@direction)
        end
      end
    else
      @direction = warrior.direction_of_stairs
      warrior.walk!(@direction)
    end
  end
end
