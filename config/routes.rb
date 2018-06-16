Rails.application.routes.draw do
  post 'ckeditor_wave/ck_images', to: 'ckeditor_wave/ck_images#create'
end
