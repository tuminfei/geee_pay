require 'rails/generators/active_record'

class GeeePay::MigrationGenerator < ::Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  desc 'Installs GeeePay migration file.'

  def install
    migration_template 'migration.rb', 'db/migrate/create_geee_pay_notices.rb'
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end
