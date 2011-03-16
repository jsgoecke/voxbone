require 'rubygems'
require 'awesome_print'
require 'lib/voxbone'

voxbone = Voxbone.new(:username   => 'test', 
                      :password   => 'test',
                      :base_uri   => 'http://sandbox.voxbone.com/VoxAPI/services/VoxAPI?wsdl',
                      :log_level  => :debug)

ap voxbone.get_countries_list(:type => 'GEOGRAPHIC')