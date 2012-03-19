require "multiple_mailers/version"
require "yaml"
require "action_mailer"

module MultipleMailers
  autoload :Configuration, "multiple_mailers/configuration"

  def self.included(base)
    base.extend(ClassMethods)
    base.class_eval do
      Configuration.load
      mailer_account("default")
    end
  end

  if defined? Rails::Railtie
    class BulletRailtie < Rails::Railtie
      initializer "multiple_mailers.configure_rails_initialization" do |app|
        ActionMailer::Base.send(:include, MultipleMailers)
      end
    end
  end

  module ClassMethods
    def mailer_account(name)
      config = Configuration.get(name)
      if config
        self.smtp_settings = config.symbolize_keys
      end
    end
  end
end

