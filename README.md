Voxbone
=======

Ruby gem for consuming the [Voxbone SOAP API](http://voxbone.com/APIGettingStarted.jsf).

Installation
------------

	gem install voxbone

Example
-------

[API Docs](http://jsgoecke.github.com/voxbone)

	require 'rubygems'
	require 'voxbone'
	voxbone = Voxbone.new(:username   => 'test', 
	                      :password   => 'test')
	voxbone.get_countries_list(:type => 'GEOGRAPHIC')

Returns (using awesome_print gem):

	{
	    :get_countries_list_response => {
	        :array_of_countries => {
	            :country => [
	                [ 0] {
	                    :country_name => "ARGENTINA",
	                    :country_code => "54",
	                      :country_id => "10",
	                      :has_states => false,
	                         :code_a2 => "AR"
	                },
	                [ 1] {
	                    :country_name => "AUSTRALIA",
	                    :country_code => "61",
	                      :country_id => "13",
	                      :has_states => false,
	                         :code_a2 => "AU"
	                }	
               	]
	        },
	    :xmlns => "http://www.voxbone.com/VoxAPI"
	    }
	}

Available Methods
-----------------

Full details of available methods [here](http://sourceforge.net/apps/mediawiki/voxbone-client/index.php?title=VoxAPI.Methods).

	[ 0] :place_order_for_lock
	[ 1] :remove_did_from_capacity_group
	[ 2] :create_address_for_regulation
	[ 3] :configure_dnis
	[ 4] :configure_cpc
	[ 5] :remove_di_ds_from_trunk
	[ 6] :link_dids_to_address
	[ 7] :get_purchase_info_data
	[ 8] :get_trunk_list
	[ 9] :map_did_to_capacity_group
	[10] :get_order_status
	[11] :cancel_did
	[12] :get_regulation_address_list
	[13] :get_did_group_purchase_lock
	[14] :place_di_ds_on_trunk
	[15] :configure_codecs
	[16] :create_capacity_group
	[17] :get_capacity_group_list
	[18] :place_di_ds_order
	[19] :get_di_ds_info
	[20] :map_did
	[21] :delete_capacity_group
	[22] :get_features_list
	[23] :configure_dtmf_mode
	[24] :get_did_group_list
	[25] :is_purchase_info_valid
	[26] :purchase_tollfree_credit
	[27] :get_did_group_pricing
	[28] :get_pop_list
	[29] :request_address_verification
	[30] :limit_did_channels
	[31] :get_states_list
	[32] :configure_t38
	[33] :delete_regulation_address
	[34] :get_countries_list
	[35] :get_did_group_info
	[36] :update_capacity_group
	[37] :get_tollfree_credit_package_list
	[38] :map_did_checking_status
	[39] :update_delivery
	[40] :get_account_balance

Copyright
---------

Copyright (c) 2011 Jason Goecke. See LICENSE.txt for
further details.
