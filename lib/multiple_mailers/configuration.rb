require "yaml"

module MultipleMailers
  class Configuration
    class <<self
      def get(name)
        configuration[name]
      end

      private

      def configuration
        @configuration ||= YAML.load_file(Rails.root.join("config/mailers.yml"))[Rails.env]
      end
    end
  end
end
