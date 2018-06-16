module CkeditorWave
  class CkImagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      ck_image = CkImage.new(ck_image: params[:ck_image], uuid: SecureRandom.uuid)
      if ck_image.save
        render plain: ck_image.url
      else
        render plain: 'Image upload failed'
      end
    end

    def destroy
      ck_image = CkImage.find_by_uuid(params[:id])
      if ck_image.destroy
        render plain: 'Image deletion successful'
      else
        render plain: 'Image deletion failed'
      end
    end
  end
end