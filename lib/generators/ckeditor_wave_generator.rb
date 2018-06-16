require 'rails/generators'
require 'rails/generators/migration'

class CkeditorWaveGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.join(CkeditorWave::Engine.root, 'db/migrate')
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_ck_images_table.rb'
  end
end
