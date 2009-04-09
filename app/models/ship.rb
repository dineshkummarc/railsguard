class Ship < ActiveRecord::Base     
  
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
  
  private

    def check_drives
      check_max("jumpdrive")
      required_power = self.thrust > self.jumpdrive ? self.thrust : self.jumpdrive
      self.power = required_power unless power > required_power
    end
    
    def check_max(drive)
      self[drive.to_sym] = self.send("max_#{drive}") > self.send(drive) ? self.send(drive) : self.send("max_#{drive}")
    end
  
end
