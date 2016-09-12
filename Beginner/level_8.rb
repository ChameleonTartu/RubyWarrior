class Player
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    @look = warrior.look
    @look.each do |place|
      if place.enemy?
        return warrior.shoot!
      end
    end
    if warrior.feel.empty?
      warrior.walk!
    elsif warrior.feel.captive?
      warrior.rescue!
    end
  end
end
