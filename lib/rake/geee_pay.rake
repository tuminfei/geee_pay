require 'fileutils'

namespace :geee_pay do
  namespace :init do
    desc "Generate geee_pay init file from example"
    task :create do
      source = File.join(Gem.loaded_specs["geee_pay"].full_gem_path, "geee_pay.rb")
      target = File.join(Rails.root, "config", "initializers", "geee_pay.rb")
      FileUtils.cp_r source, target
    end

  end
end