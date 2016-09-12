class Player
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    if warrior.health < @health && warrior.feel.empty?
      warrior.walk!
    elsif warrior.health < @health
      warrior.attack!
    elsif warrior.health < 20
      warrior.rest!
    elsif warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end

    @health = warrior.health
  end
end