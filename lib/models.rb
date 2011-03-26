require 'sinatra/activerecord'





class Need < ActiveRecord::Base
  
  def self.valid?(form_values)
    if (form_values[:description] == nil)
      return false
    end
    !form_values[:description].empty?
  end
  
  
end