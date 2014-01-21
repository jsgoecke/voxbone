require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Voxbone" do
  before(:each) do
    # You will need to set the username/password to valid ones in order to run a test
    @voxbone = Voxbone.new({ :username  => 'test', 
                             :password  => 'test',
                             :log_level => :debug,
                             :base_uri  => 'http://sandbox.voxbone.com/VoxAPI/services/VoxAPI?wsdl' })
  end
  
  it "should instantiate a Voxbone class" do
    @voxbone.instance_of?(Voxbone).should == true
  end
  
  it "should raise a no method error if an unknown method is called" do
    begin
      @voxbone.foobar
    rescue => error
      error.class.should == NoMethodError
      error.to_s.should  == "The method foobar does not exist."
    end
  end
  
  it "should get the trunk list" do
    pending 'Voxbone sandbox no longer allows testing this'
    trunks = @voxbone.get_trunk_list
    trunks[:get_trunk_list_response].nil?.should == false
  end
  
  it "should return a list of countries based on geography" do
    pending 'Voxbone sandbox no longer allows testing this'
    countries = @voxbone.get_countries_list(:type => 'GEOGRAPHIC')
    countries[:get_countries_list_response][:array_of_countries][:country].nil?.should == false
  end
  
  it "should create a capacity group" do
    pending 'Voxbone sandbox no longer allows testing this'
    result = @voxbone.create_capacity_group(:name_capacity_group => 'Foobar', :capacity => '100')
    result[:create_capacity_group_response][:capacity_group][:name].should == 'Foobar'
  end
end
