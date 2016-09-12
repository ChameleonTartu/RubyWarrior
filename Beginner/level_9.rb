
class Player
  @suroundings = nil
  def play_turn(warrior)
    if @suroundings == nil
        @suroundings = warrior.look
    end
    @captive = warrior.feel.captive?
    @wall = warrior.feel.wall?
    if @captive
      warrior.rescue!
    elsif @wall && warrior.health < 20
      warrior.rest!
    elsif @wall
      warrior.pivot!
    elsif warrior.health <= 20 && warrior.health > 8
      if warrior.feel.empty?
        warrior.walk!
      elsif warrior.feel.enemy?
        warrior.attack!
      end
    else
      @suroundings.each do |place|
        if place.enemy?
          warrior.shoot!
          @suroundings = nil
          break
          
        elsif place.captive?
          if warrior.feel.captive?
            warrior.rescue!
          else
            warrior.walk!
          end
          @suroundings = nil
          break
        end
      end
      
      if @suroundings != nil
        warrior.walk!  
      end
    end
    
  end
end
