module GeeePay
  class Engine < ::Rails::Engine
    isolate_namespace GeeePay

    initializer 'GeeePay', group: :all do |app|
      Rails.application.routes.prepend do
        mount GeeePay::Engine, at: '/api/geee_pay'
      end
    end
  end
end

