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
  
  def jumpdrive_tonnage
    jumpdrive ? (jumpdrive + 1) * 0.01 * tonnage : 0
  end
  
  def jumpdrive_price
    jumpdrive ? 4 * jumpdrive_tonnage : 0
  end
  
  def jumpdrive_fuel
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
  
  def thrust_price
    case 
      when thrust == 1 : modifier = 1.5
      when thrust == 2 : modifier = 0.7
      when thrust >= 3 : modifier = 0.5
    end
    thrust ? modifier * thrust_tonnage : 0
  end
  
  def power_tonnage
    case 
      when tech_level >= 8 && tech_level <= 10  : modifier = 4
      when tech_level >= 11 && tech_level <= 12 : modifier = 3
      when tech_level >= 13 && tech_level <= 14 : modifier = 2
      when tech_level == 15                     : modifier = 1
    end
    power ? power * modifier * 0.01 * tonnage : 0
  end
  
  def power_price
    power ? power_tonnage * 3 : 0
  end
  
  def power_fuel
    ep
  end
  
  def total_fuel
    power_fuel + jumpdrive_fuel
  end
  
  def bridge
    bridge = tonnage * 0.02
    min = tonnage >= 200 ? 20 : 10
    (bridge > 20) ? bridge : min
  end
  
  def bridge_price
    tonnage * 0.005
  end
  
  def ep
    power ? (0.01 * tonnage * power) : 0
  end
  
  def hull_price
    tonnage * self.configuration.modifier * 0.1
  end
  
  def total_tonnage
    jumpdrive_tonnage +
    thrust_tonnage +
    power_tonnage +
    bridge +
    total_fuel
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
