# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def hexify(value)
    case value
      when 10 : new_value = 'A'
      when 11 : new_value = 'B'
      when 12 : new_value = 'C'
      when 13 : new_value = 'D' 
      when 14 : new_value = 'E'    
      when 15 : new_value = 'F'
    else
      new_value = value
    end
    new_value
  end 
  
  def commify(n)
    n.to_s =~ /([^\.]*)(\..*)?/
    int, dec = $1.reverse, $2 ? $2 : ""
    while int.gsub!(/(,|\.|^)(\d{3})(\d)/, '\1\2,\3')
    end
    int.reverse # + dec - removed the decimal point because we don't need it here
  end
  
end


