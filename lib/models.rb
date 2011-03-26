require 'sinatra/activerecord'





class Need < ActiveRecord::Base
  
  def self.valid?(form_values)
    if (form_values[:description] == nil)
      return false
    end
    !form_values[:description].empty?
  end
  
  def self.get_errors_with_form(form_values)
    if(valid?(form_values))
      return {}
    else
      return {:description => "yo dawg, yon description aint got nothin to it"}
    end
  end
end

class Action < ActiveRecord::Base
  
  def self.valid?(form_values)
    if (form_values[:description] == nil)
      return false
    end
    !form_values[:description].empty?
  end
  
  def self.get_errors_with_form(form_values)
    if(valid?(form_values))
      return {}
    else
      return {:description => "yo dawg, yon description aint got nothin to it"}
    end
  end 
end
