require "graphviz"

module Yml2erd
  class Diagram
    class << self
      def table_relations(schema_structure)
        schema_structure.relations
      end

      def create(schema_structure)
        GraphViz::options(use: 'dot')
        g = GraphViz::new('structs')

        columns = ''
        table_names = schema_structure.table_names
        table_names.each do |table_name|
          schema_structure.structure_yml[table_name]['columns'].each do |column|
            column.each { |key, value| columns += "#{key}: #{value}\n" }
          end

          g.add_nodes(table_name, shape: "record", label: "{#{table_name} | #{columns}}")
        end

        table_names.each do |table_name|
          unless schema_structure.structure_yml[table_name]["relations"]["belongs_to"].nil?
            schema_structure.structure_yml[table_name]['relations']['belongs_to'].each do |belongs_to|
              g.add_edges(belongs_to, table_name)
            end
          end
        end

        # TODO: can specify output path
        g.output(:png => "output.png")
      end
    end
  end
end
