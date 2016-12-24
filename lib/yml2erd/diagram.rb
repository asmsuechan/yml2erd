require "graphviz"

module Yml2erd
  class Diagram
    class << self
      def build_relations(schema_structure)
        schema_structure.relations
      end

      def create(schema_structure)
        relations = build_relations
        d.add_edge()
        d.output(:png => "#{$0}.png")
      end
    end
  end
end
