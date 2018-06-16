# CkeditorWave

This gem integrates [CKEditor 5](https://docs.ckeditor.com/ckeditor5/) with [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) to allow image upload.

## Installation

Add this line to your application's Gemfile:

```
gem 'ckeditor_wave', '~> 1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ckeditor_wave

To generate and execute the migration, run:

    $ rails g ckeditor_wave
    $ rails db:migrate

Add the following at the bottom of your application.js:

```
//= require ckeditor_wave
```

Add the following to your routes.rb file:

```
mount CkeditorWave::Engine => 'ckeditor_wave'
```


To attach [CKEditor 5](https://docs.ckeditor.com/ckeditor5/) to an HTML form, please ensure that it has the 'ckeditor_wave' id.


## Dependencies
* [CKEditor 5](https://docs.ckeditor.com/ckeditor5/) - classic editor build 10.0.1
* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) - version ~> 1.2

To install [CKEditor 5](https://docs.ckeditor.com/ckeditor5/), download the 'classic editor build 10.0.1' ZIP package from [this link](https://ckeditor.com/ckeditor-5/download/) and insert the ckeditor.js file inside you app/assets/javascripts folder. Alternatively, you can use the CDN also available from the [same link](https://ckeditor.com/ckeditor-5/download/).

If you do not have the [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) gem installed, please add the following to your Gemfile:

```
gem 'carrierwave', '~> 1.2'
```

And then execute:

    $ bundle

## Contributing

Bug reports and pull requests are welcome on GitHub.

## License

Licensed under the terms of [GNU General Public License Version 3 or later](http://www.gnu.org/licenses/gpl.html).
