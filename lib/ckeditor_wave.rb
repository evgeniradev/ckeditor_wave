module CkeditorWave
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.orm             :active_record
    end
  end
end
