module CkeditorWave
  class CkImagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      ck_image = CkImage.new(ck_image: params[:ck_image], uuid: SecureRandom.uuid)

      if ck_image.save
        render json: { url: ck_image.url }
      else
        head 500
      end
    end
  end
end
