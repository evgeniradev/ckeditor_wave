module CkeditorWave
  class CkImage < ApplicationRecord
    mount_uploader :ck_image, CkImageUploader
    def url
      ck_image.url
    end
  end
end
