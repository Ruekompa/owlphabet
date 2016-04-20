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
     frame_factory = TagLib::ID3v2::FrameFactory.instance
     frame_factory.default_text_encoding = TagLib::String::UTF8
     TagLib::MPEG::File.open(file.file) do |file|
     tag = file.id3v2_tag(true)
     tag.title = "#{model.title}"
     tag.artist = "#{model.info_artist}"
     tag.album = "#{model.info_album}"
     tag.year = model.info_year
     apic = TagLib::ID3v2::AttachedPictureFrame.new
     apic.mime_type = "image/jpeg"
     apic.description = "Cover"
     apic.type = TagLib::ID3v2::AttachedPictureFrame::FrontCover
     apic.picture = File.open("public#{model.info_cover}", 'rb') { |f| f.read }
 
     tag.add_frame(apic)

     file.save
  
  end
  end 


  def filename
  end


end
