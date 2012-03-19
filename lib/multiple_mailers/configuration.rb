require "yaml"

module MultipleMailers
  class Configuration
    class <<self
      def load
        @configurations ||= YAML.load_file(Rails.root.join("config/mailers.yml"))[Rails.env]
      end

      def get(name)
        @configurations and @configurations[name]
      end
    end
  end
end
