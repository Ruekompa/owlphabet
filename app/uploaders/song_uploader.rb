class SongUploader < CarrierWave::Uploader::Base
require 'taglib'
include CarrierWave::Audio

  storage :file
 
  def store_dir
  "../app/songs/#{model.id}"
  end

  def cache_dir
  "../app/songs/tmp/cache/#{model.id}"
  end

   version :mp3 do
    process :convert => [:mp3]

    def full_filename(for_file)
      "#{super.chomp(File.extname(super))}.mp3"
    end
  end

  def extension_white_list
    %w(mp3 aif wav)
  end


  def filename
   @filename.downcase
  end


end
