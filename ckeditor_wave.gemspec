$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'ckeditor_wave/version'

Gem::Specification.new do |spec|
  spec.name          = 'ckeditor_wave'
  spec.version       = CkeditorWave::VERSION
  spec.authors       = ['Evgeni Radev']
  spec.email         = ['evgeniradev@gmail.com']
  spec.summary       = '
    This gem integrates CKEditor 5 with CarrierWave to allow image upload.'
  spec.homepage      = 'https://github.com/evgeniradev/ckeditor_wave'
  spec.license       = 'GPL-3.0+'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.require_paths = ['lib']
  spec.files = Dir[
    '{app,config,db,lib}/**/*', 'LICENSE', 'README.md'
  ]

  spec.add_dependency 'rails', '>= 5.0', '< 7'
  spec.add_dependency 'carrierwave', '>= 1.2', '< 3'
end
