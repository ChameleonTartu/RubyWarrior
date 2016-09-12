class Player
  def escape
    @direction = @warrior.direction_of_stairs
    @warrior.walk! @direction
  end

  def denote_bomb?
    spaces = @warrior.look

    enemies = 0
    spaces.each do |space|
      enemies += 1 if space.enemy?
    end

    if enemies > 1
      true
    else
      false
    end
  end

  def play_turn(warrior)
    @warrior = warrior
    if @warrior.feel.enemy?
      @warrior.detonate!
    elsif @warrior.feel.empty?
      @warrior.walk!
    elsif @warrior.feel.captive?
      @warrior.rescue!
    else
      escape
    end
  end
end
