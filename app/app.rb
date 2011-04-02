
class Forchange < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers

  ##
  # Application configuration options
  #
  # set :raise_errors, true     # Show exceptions (default for development)
  # set :public, "foo/bar"      # Location for static assets (default root/public)
  # set :reload, false          # Reload application files (default in development)
  # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"     # Set path for I18n translations (defaults to app/locale/)
  # enable  :sessions           # Disabled by default
  # disable :flash              # Disables rack-flash (enabled by default if sessions)
  # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #

  layout :layout
  get '/' do
    @needs = Need.order('id DESC').find(:all)
    haml :'needs/find'
  end

  get '/causes/add' do
    haml :'causes/add'
  end

  get '/change_agents/join' do
    @page = ChangeAgentService.handle(params)
    haml @page.view
  end

  get '/change_agents/are' do
    haml :'change_agents/are'
  end
  
  get '/share_a_need' do
    @page = ShareANeedService.handle(params)
    haml @page.view
  end

  get '/view_actions' do
    @actions = Action.order('id DESC').find(:all)
    haml :'actions/view'
  end

  get '/share_an_action/?*' do
    @page = ShareAnActionService.handle(params)
    haml @page.view
  end
  
end


# !!!! services
module ChangeAgentService
  def self.get_view_name(params)
    if ChangeAgent.valid?(params)
      :'change_agents/success'
    else
      :'change_agents/join'
    end
  end
  def self.handle(params)
    Page.new(:view=>get_view_name(params), :errors=>ChangeAgent.get_errors_with_form(params))
  end
end

module ShareANeedService
  def self.handle(params)
    page = ShareNeedPage.new(:view=> :'needs/share', :errors=> Need.get_errors_with_form(params))    
    if(Need.valid?(params)) 
      page.need = Need.create(params)  
    end
    page
  end
end

module ShareAnActionService
  def self.handle(params)
  	need_id = nil
	unless params[:splat][0].nil? or params[:splat][0].empty?
		need_id = Need.find(params[:splat][0])
	end
    page = ShareActionPage.new(:view => :'actions/share', 
							:need_id => need_id, 
							:errors => Action.get_errors_with_form(params))    
    if(Action.valid?(params)) 
      page.action = Action.create({:description => params[:description], :need_id => params[:splat][0]} )
    end
    page
  end
end


# !!!! Page
class Page
  def initialize(page_params)
    @view = page_params[:view]
    @need_id = page_params[:need_id]
    @errors = page_params[:errors] || {}
  end

  def view
    @view
  end

  def has_errors?
    @errors.size > 0
  end

  def has_error?(field_name)
    @errors.has_key?(field_name)
  end
end

class ShareNeedPage < Page
  @need

  def succeeded? 
    (@need != nil) && !has_errors?
  end 
  
  def need=(n)
    @need = n
  end

  def need
    @need
  end
end

class ShareActionPage < Page
  @action

  def succeeded? 
    (@action != nil) && !has_errors?
  end 
  
  def action=(n)
    @action = n
  end

  def action
    @action
  end
  
  def need_id
    @need_id
  end
end


# !!!! models

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
	if(form_values.size <= 1 || (valid?(form_values)))
      return {}
    else
      return {:description => "yo dawg, yon description aint got nothin to it"}
    end
  end 
end
