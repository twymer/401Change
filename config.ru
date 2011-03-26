require 'rubygems'
$: << File.expand_path(File.dirname(__FILE__) + '/lib')
require '401_change'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
	  :dbfile => 'db/test.sqlite3.db'
		)


run FourOhOneChange
