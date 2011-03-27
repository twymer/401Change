require 'rubygems'
$: << File.expand_path(File.dirname(__FILE__) + '/lib')
require '401_change'


require 'active_record'
ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => 'db/test.sqlite3.db'

run FourOhOneChange
