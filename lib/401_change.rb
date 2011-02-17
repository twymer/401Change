require 'sinatra/base'

class FourOhOneChange < Sinatra::Base
  get '/' do
    'Hello 401Change!'
  end
end
