require 'rubygems'
require 'voxbone'
require 'pp'

voxbone = Voxbone.new(:username   => 'test', 
                      :password   => 'test',
                      :wsdl   => 'http://sandbox.voxbone.com/VoxAPI/services/VoxAPI?WSDL',
                      :endpoint => 'http://sandbox.voxbone.com/VoxAPI/services/VoxAPI',
                      :log_level  => :debug)

pp voxbone.get_countries_list(:type => 'GEOGRAPHIC')
