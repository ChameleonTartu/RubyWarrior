class Player
  def ticking_place
    @places.each do |place|
      return place if place.ticking?
    end
    nil
  end

  def handle_bomb
    @direction = @warrior.direction_of(@ticking)
    if @warrior.feel(@direction).enemy?
      if @direction == :forward
        @warrior.walk! :left
      elsif @direction == :right
        @warrior.walk! :forward
      end
    elsif @warrior.feel(@direction).captive?
      @warrior.rescue! @direction
    else
      @warrior.walk! @direction
    end
  end

  def clean_spaces
    @direction = @warrior.direction_of(@places[0])
    if @warrior.feel(@direction).empty? && @warrior.health < 20
      @warrior.rest!
    elsif @warrior.feel(@direction).empty?
      @warrior.walk! @direction
    elsif @warrior.feel(@direction).enemy? && @warrior.health < 5
      @warrior.walk! :backward
    elsif @warrior.feel(@direction).enemy?
      @warrior.attack! @direction
    elsif @warrior.feel(@direction).captive?
      @warrior.rescue! @direction
    end
  end

  def escape
    @direction = @warrior.direction_of_stairs
    @warrior.walk! @direction
  end

  def play_turn(warrior)
    @warrior = warrior
    @places = warrior.listen
    @ticking = ticking_place
    if !@ticking.nil?
      handle_bomb
    elsif @places.size > 0
      clean_spaces
    else
      escape
    end
  end
end
