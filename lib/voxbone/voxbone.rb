class Voxbone
  attr_reader :methods
  
  ##
  # Instantiate a Voxbone object
  #
  # @param [required, Hash] params 
  # @option params [required, String] :username for your Voxbone account
  # @option params [required, String] :password for your Voxbone password
  # @option params [optional, String] :base_uri for using an alternative URI, such as the Voxbone sandbox
  # @option params [optional, String] :log_level for changing the Savon log levels
  # @return [Object] the instantiated Voxbone object
  # @raise ArgumentError when the :username or :password is not present
  # @example Instantiate a Voxbone object
  #   require 'rubygems'
  #   require 'voxbone'
  #   voxbone = Voxbone.new(:username   => 'test', 
  #                         :password   => 'test')
  def initialize(params)
    raise ArgumentError, ":username required" if params[:username].nil?
    raise ArgumentError, ":password required" if params[:password].nil?
    
    config_savon(params)
    @user_token = create_user_token(params)
    
    @client = Savon::Client.new do
      wsdl.document  = params[:base_uri] || 'http://www.voxbone.com/VoxAPI/services/VoxAPI?WSDL'
      wsdl.namespace = 'http://www.voxbone.com/VoxAPI'
    end
    
    @methods = @client.wsdl.soap_actions
  end
  
  ##
  # Provides the dispatcher to the available SOAP methods defined in the WSDL
  #
  # @param [required, Symbol] the method name to invoke on the SOAP API
  # @param [optional, Hash] the parameters to pass to the method, should be symbols and may be all lowercase with underscores
  # @return [Hash] containing the results of the SOAP call
  # @raise NoMethodError if the method requested is not defined in the WSDL
  # @example Retrieve a country list
  #   voxbone.get_countries_list(:type => 'GEOGRAPHIC')
  def method_missing(method_name, *args)
    if @methods.include? method_name
      params = (args.first || {}).merge(@user_token)
      response = @client.request :vox, method_name do
        soap.body = capitalize_params(params)
      end
      response.to_hash
    else
      raise NoMethodError, "The method #{method_name.to_s} does not exist."
    end
  end
  
  private 
  
  ##
  # Configures Savon
  #
  # @param [required, Hash] params 
  # @option params [optional, String] :log_level to set for Savon
  def config_savon(params)
    Savon.configure do |config|
      if params[:log_level]
        config.log = true
        config.log_level = params[:log_level]
      else
        config.log = false
      end
    end
  end
  
  ##
  # Builds the user token required by the Voxbone SOAP API
  #
  # @param [required, Hash] params 
  # @option params [required, String] :username for your Voxbone account
  # @option params [required, String] :password for your Voxbone password
  # @return [Hash] the user token
  def create_user_token(params)
    key = Time.now.strftime("%Y-%m-%d %H:%M:%S:") + '%012d' % rand(10_000_000_000)
    { :user_token => { :username => params[:username],
                       :key      => key,
                       :hash     => Digest::SHA1.hexdigest(params[:password] + key) } }
  end
  
  ##
  # Capitalize all of the attributes in a hash
  #
  # @param [required, Hash] params 
  # @return [Hash] with keys capitalized
  def capitalize_params(params)
    capitalized_params= {}
    params.each do |key, value|
      key = key.to_s.split(/[ _]/).map(&:capitalize).join
      value = (value.is_a?(Hash) ? capitalize_params(value) : value)
      capitalized_params[key] = value
    end
    capitalized_params
  end
end
