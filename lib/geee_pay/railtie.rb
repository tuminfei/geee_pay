#encoding: utf-8
module GeeePay
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'rake/geee_pay.rake'
    end
  end
end
