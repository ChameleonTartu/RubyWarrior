class Player
  def play_turn(warrior)
    @direction = :right
    if warrior.feel(@direction).wall?
      @direction = warrior.direction_of_stairs
    end

    if @direction != :forward && warrior.feel.enemy?
      warrior.attack!
    elsif @direction != :forward
      warrior.walk!(@direction)
    elsif warrior.feel.enemy?
      warrior.attack!(@direction)
    elsif warrior.health < 20
      warrior.rest!
    else
      warrior.walk!(@direction)
    end
  end
end
