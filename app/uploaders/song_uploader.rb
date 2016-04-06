class SongUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
  "../app/songs/#{model.id}"
  end

  def cache_dir
  "../app/songs/tmp/cache/#{model.id}"
  end

  def extension_white_list
    %w(mp3 aif wav)
  end

  def filename
   @filename.downcase
  end

end
