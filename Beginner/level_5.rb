class Player
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    if warrior.health < @health && warrior.feel.empty?
      warrior.walk!
    elsif warrior.health < @health && warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health < @health
      warrior.rescue!
    elsif warrior.health < 20
      warrior.rest!
    elsif warrior.feel.empty?
      warrior.walk!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end

    @health = warrior.health
  end
end