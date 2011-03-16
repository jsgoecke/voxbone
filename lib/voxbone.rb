$: << File.expand_path(File.dirname(__FILE__))
%w(savon digest/sha1 voxbone/voxbone).each { |lib| require lib }