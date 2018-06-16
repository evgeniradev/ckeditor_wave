module CkeditorWave
  class CkImageUploader < ::CarrierWave::Uploader::Base
    def store_dir
      "uploads/#{model.class.to_s.pluralize.underscore}"
    end

    def filename
      "#{model.uuid}.jpg"
    end
  end
end
