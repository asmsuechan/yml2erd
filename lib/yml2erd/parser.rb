require 'yml2erd/schema_structure'
require 'yaml'

module Yml2erd
  class Parser
    class << self
      # returns relationship of tables
      def parse(path)
        yml = YAML.load_file(path)
        Yml2erd::Parser::Validator.new(yml).validate
        Yml2erd::SchemaStructure.new(yml)
      end
    end
  end
end
