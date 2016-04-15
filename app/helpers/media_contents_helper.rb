module MediaContentsHelper
#TO DO Something along these lines to tag tracks with artists, to track credits. This code snippet tags before saving.
# 	module CarrierWave
#   module TagLib
#     extend ::ActiveSupport::Concern

#     included do
#       begin
#         require "taglib"
#       rescue LoadError => e
#         e.message << " (You may need to install the taglib-ruby gem)"
#         raise e
#       end
#     end

#     module ClassMethods
#       def tag_id3v1(tags)
#         process :tag_id3v1 => tags
#       end
#     end

#     # Tag mp3 before uploading
#     #
#     # tags - Hash of tag names and values
#     #
#     # Supported keys: artist, title, album, year, genre, comment
#     def tag_id3v1(tags)
#       tags.symbolize_keys!
#       ::TagLib::MPEG::File.open(file.path) do |f|
#         [:artist, :title, :album, :year, :genre, :comment].each do |key|
#           tags[key] && f.tag.public_send("#{key}=", tags[key])
#         end
#         f.save
#       end
#     end
#   end
# end
end
