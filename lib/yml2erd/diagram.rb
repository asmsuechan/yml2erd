require "graphviz"

module Yml2erd
  class Diagram
    class << self
      def table_relations(schema_structure)
        schema_structure.relations
      end

      def create(schema_structure, output_path)
        GraphViz::options(use: 'dot')
        g = GraphViz::new('structs')

        columns = ''
        table_names = schema_structure.table_names

        table_names.each do |table_name|
          schema_structure.columns(table_name).each do |column|
            column.each { |key, value| columns += "#{key}: <FONT color='gray'>#{value}</FONT><BR/>" }
          end

          index = schema_structure.index(table_name)
          label = build_label(table_name, columns, index)
          g.add_nodes(table_name, shape: "record", label: label, style: "rounded")
        end

        table_names.each do |table_name|
          unless schema_structure.relation(table_name)['belongs_to'].nil?
            schema_structure.relation(table_name)['belongs_to'].each do |belongs_to|
              g.add_edges(belongs_to, table_name)
            end
          end
        end

        g.output(:png => output_path)
      end

      def build_label(table_name, columns, index)
        if index
          "<{<FONT POINT-SIZE='15'>#{table_name}</FONT> | #{columns} | indexed: #{index.to_s}}>"
        else
          "<{<FONT POINT-SIZE='15'>#{table_name}</FONT> | #{columns}}>"
        end
      end
    end
  end
end
