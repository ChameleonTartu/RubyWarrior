class Player
  def initialize
    @health = 20
    @backward = true
  end

  def rescue_captive
    if @warrior.feel(:backward).empty?
      @warrior.walk! :backward
    elsif @warrior.feel(:backward).captive?
      @warrior.rescue! :backward
    else
      @backward = false
    end
  end
  
  def get_to_stairs
    if @warrior.health < @health && @warrior.health < 5 && @warrior.feel.empty?
      @warrior.walk!(:backward)
    elsif @warrior.health < @health && @warrior.feel.empty?
      @warrior.walk!
    elsif @warrior.health < @health && @warrior.feel.enemy?
      @warrior.attack!
    elsif @warrior.health < 20
      @warrior.rest!
    elsif @warrior.feel.empty?
      @warrior.walk!
    else
      @warrior.attack!
    end

    @health = @warrior.health
  end

  def play_turn(warrior)
    @warrior = warrior
    if @backward == true
      rescue_captive
    end
    
    if @backward == false 
      get_to_stairs
    end
  end
end
