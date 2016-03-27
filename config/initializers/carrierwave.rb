CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'                        # required
  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:     'GOOG3GITCFR74T3GSX3M',
    google_storage_secret_access_key: 'X9Wuyz6GE25MNcfhEHcavM2Jc2pXcq9rPfQeymhv'
  }
  config.fog_directory = 'nestformusic'
end