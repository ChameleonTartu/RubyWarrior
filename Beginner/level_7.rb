class Player
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.empty? && warrior.health < 9 && warrior.health < @health
      warrior.walk! :backward
    elsif warrior.health < @health && warrior.feel.empty?
      warrior.walk!
    elsif warrior.health < @health
      warrior.attack!
    elsif warrior.health < 16
      warrior.rest!
    elsif warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end

    @health = warrior.health
  end
end
