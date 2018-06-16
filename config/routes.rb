CkeditorWave::Engine.routes do
  root to: 'ckeditor_wave/ck_images#list'
  scope module: 'ckeditor_wave' do
    resources :ck_images
  end
end

