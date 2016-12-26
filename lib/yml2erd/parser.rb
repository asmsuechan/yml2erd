require 'yml2erd/schema_structure'
require 'yml2erd/schema_structure/validator'

module Yml2erd
  class Parser
    class << self
      # returns an object of Yml2erd::SchemaStructure
      def parse(yml)
        ss = Yml2erd::SchemaStructure.new(yml)
        Yml2erd::SchemaStructure::Validator.new(ss).validate
        ss
      end
    end
  end
end
