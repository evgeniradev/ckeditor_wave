lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ckeditor_wave/version'

Gem::Specification.new do |spec|
  spec.name          = 'ckeditor_wave'
  spec.version       = CkeditorWave::VERSION
  spec.authors       = ['Evgeni Radev']
  spec.email         = ['evgeniradev@gmail.com']
  spec.summary       = %q{This gem integrates CKEditor 5 with CarrierWave to allow image upload.}
  spec.homepage      = 'https://github.com/evgeniradev/ckeditor_wave'
  spec.license       = 'GPL-3.0+'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'carrierwave', '~> 1.2'
end
