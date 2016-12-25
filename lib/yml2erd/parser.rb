require 'yml2erd/schema_structure'
require 'yaml'

module Yml2erd
  class Parser
    class << self
      # returns an object of Yml2erd::SchemaStructure
      def parse(path)
        yml = YAML.load_file(path)
        Yml2erd::SchemaStructure.new(yml)
      end
    end
  end
end
