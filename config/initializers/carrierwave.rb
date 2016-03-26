CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'                        # required
  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:     'GOOGIY5ATZSN3W55TRQM',
    google_storage_secret_access_key: 'bas9fSsicMpxokTJVKpLTpKIh3PCy2wTgwCBE3U3'
  }
  config.fog_directory = 'owlnest'
end