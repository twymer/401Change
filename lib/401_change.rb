require 'sinatra/base'
require 'haml'
require 'dm-core'
require 'dm-migrations'


class FourOhOneChange < Sinatra::Base
  get '/' do
    haml :index
  end
  get '/causes/add' do
    haml :'causes/add'
  end

end


#DataMapper.setup(:default, 'sqlite::memory:')
#
#class ChangeAgent
#  include DataMapper::Resource
#  property :id, Serial
#  property :name, String
#  property :home_page, String
#  property :purpose, Text
#  property :reason_to_support, Text
#
#end
#
#DataMapper.finalize
#DataMapper.auto_upgrade!
#
#module ChangeAgentSaver
#  def ChangeAgentSaver.save(params)
#    if (goodInput?(params))
#      ChangeAgent.create(:name=>params[:name],
#                         :home_page=>params[:home_page],
#                         :purpose=>params[:purpose],
#                         :reason_to_support=>params[:reason_to_support])
#      true
#    else
#      goodInput?(params)
#    end
#  end
#
#  def ChangeAgentSaver.goodInput?(input)
#    if input[:name] != "" and input[:home_page] != ""
#      true
#
#    else
#
#      false
#    end
#
#  end
#
#end