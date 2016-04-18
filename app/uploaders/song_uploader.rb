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

   after :store, :tag_id3v2


   end




  def extension_white_list
    %w(mp3 aif wav)
  end

  def tag_id3v2(for_file)
 
     TagLib::MPEG::File.open(file.file) do |file|
     tag = file.id3v2_tag(true)
     tag.title = "#{model.title}"
     file.save
  
  end
  end 



 

  def filename
   @filename.downcase
  end


end
