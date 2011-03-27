require 'sinatra/activerecord'

class Need < ActiveRecord::Base
  def self.get_errors_with_form(form_values)
  
	if(form_values.size == 0)
	  return {}
	end
  
    description_errors = {}
    location_errors = {}
    if(!isValidDescription(form_values[:description]))
	description_errors = {:description => "some hikau"}	
    end
    if(!has_valid_coordinates(form_values))
	location_errors = {:location => "some hikau"}	
    end
   description_errors.merge(location_errors)
  end

  def self.valid?(form_values)
    return isValidDescription(form_values[:description]) && has_valid_coordinates(form_values)
  end

  def self.isValidDescription(description) 
    is_nil = is_empty_or_nil(description)
    if is_nil
      return false
    end

    if (description.include? "<")
      return false
    end

    if (description.length > 800)
      return false
    end

    true
  end

  def self.is_empty_or_nil(description)
    if (description == nil)
      return true
    end

    description.empty?   
  end

  def self.has_valid_coordinates(coordinate)
    both_are_empty(coordinate) || both_coordinates_are_floats_within_bounds(coordinate)
  end

  def self.both_coordinates_are_floats_within_bounds(coordinates)
      both_are_floats(coordinates) && both_are_within_bounds(coordinates) 
  end

  def self.both_are_within_bounds(coordinates)
    Float(coordinates[:latitude]).between?(-90, 90) && Float(coordinates[:longitude]).between?(-180, 180)
  end

  def self.both_are_floats(coordinates)
    lat_valid = !!Float(coordinates[:latitude]) rescue false 
    lon_valid = !!Float(coordinates[:longitude]) rescue false
		lat_valid && lon_valid
  end

  def self.both_are_empty(coordinates)
    is_empty_or_nil(coordinates[:latitude]) && is_empty_or_nil(coordinates[:longitude]) 
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
	if(form_values.size == 0 || (valid?(form_values)))
      return {}
    else
      return {:description => "yo dawg, yon description aint got nothin to it"}
    end
  end 
end
