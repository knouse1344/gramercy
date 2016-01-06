CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                         # required
    :aws_access_key_id      => 'AKIAJDZHC2JBZDBSX6HA',                        # required
    :aws_secret_access_key  => '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',    # required
    :region                 => 'us-east-1',                  				  # optional, defaults to 'us-east-1'
  }
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.fog_directory  = 'gramercy-uploads'
  # config.asset_host = "http://d14g96h6pwfa3w.cloudfront.net"                        		  # required
end