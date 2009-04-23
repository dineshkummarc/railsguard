class Ship < ActiveRecord::Base     
  
  belongs_to :configuration
  
  validates_presence_of :name, :tonnage, :tech_level, :jumpdrive, :thrust, :power
  before_save :check_drives
  
  def smallcraft
    tonnage < 100 ? true : false
  end
  
  def max_jumpdrive
    max_jump = tech_level - 9
    max = max_jump > 0 ? max_jump : 0
    max = tech_level == 9 ? 1 : max
    max
  end
  
  def jump_tonnage
    jumpdrive ? (jumpdrive + 1) * 0.01 * tonnage : 0
  end
  
  def jump_fuel
    jumpdrive ? jumpdrive * 0.1 * tonnage : 0
  end
  
  def max_thrust
    case 
      when tech_level == 7 : max = 2
      when tech_level == 8 : max = 5
      when tech_level > 8  : max = 6
    else
      max = 0
    end
    max
  end
  
  def thrust_tonnage
    case 
      when thrust == 1 : percentage = 2
      when thrust == 2 : percentage = 5
      when thrust == 3 : percentage = 8
      when thrust == 4 : percentage = 11
      when thrust == 5 : percentage = 14
      when thrust == 6 : percentage = 17
    else
      percentage = 0
    end
    thrust ? percentage * 0.01 * tonnage : 0
  end
  
  private

    def check_drives
      check_max("jumpdrive")
      check_max("thrust")
      required_power = self.thrust > self.jumpdrive ? self.thrust : self.jumpdrive
      self.power = required_power unless power > required_power
    end
    
    def check_max(drive)
      self[drive.to_sym] = self.send("max_#{drive}") > self.send(drive) ? self.send(drive) : self.send("max_#{drive}")
    end
  
end
