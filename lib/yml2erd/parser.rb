require 'yml2erd/schema_structure'
require 'yaml'

module Yml2erd
  # data shaping for image converter
  class Parser
    class InvalidKeyNameError < StandardError;end

    class << self
      # returns relationship of tables
      def parse(path)
        yml = YAML.load_file(path)
        check_keyname(yml)
        Yml2erd::ShcemaStructure.new(yml)
      end

      private

      # yml rule
      # you can see more in sample.yml
      def check_keyname(yml)
        raise InvalidKeyNameError
      end
    end
  end
end
