require "graphviz"

module Yml2erd
  class Diagram
    DEFAULT_OPTIONS = { output_path: './output.png' }.freeze

    def create(schema_structure, opts = {})
      opts = opts.merge(DEFAULT_OPTIONS)
      GraphViz::options(use: 'dot')
      g = GraphViz::new('structs', label: opts[:project_name])

      table_names = schema_structure.table_names

      table_names.each do |table_name|
        columns = ''
        schema_structure.shared_columns.each { |key, value| columns += build_column(key, value) } unless schema_structure.shared_columns.nil?
        schema_structure.columns(table_name).each do |column|
          column.each { |key, value| columns += build_column(key, value) }
        end

        index = schema_structure.index(table_name)
        comment = schema_structure.comment(table_name)
        label = build_label(table_name, columns, index, comment)
        g.add_nodes(table_name, shape: "record", label: label, style: "rounded")
      end

      table_names.each do |table_name|
        if !schema_structure.relation(table_name).nil? && \
          !schema_structure.belongs(table_name).nil?
          schema_structure.belongs(table_name).each do |belongs_to|
            g.add_edges(belongs_to, table_name)
          end
        end
      end

      if opts[:output_style] == 'svg'
        g.output(:svg=> opts[:output_path] + '.svg')
      else
        g.output(:png => opts[:output_path])
      end
    end

    private

    def build_label(table_name, columns, index, comment)
      partial ||= "| indexed: #{index.to_s}" if index
      partial += "| #{comment}" if comment
      base_label(table_name, columns, partial)
    end

    # TODO: Contemplates method name
    def base_label(table_name, columns, partial = nil)
      "<{<FONT POINT-SIZE='15'>#{table_name}</FONT> | #{columns}#{partial}}>"
    end

    def build_column(name, type)
      "#{name}: <FONT color='gray'>#{type}</FONT><BR/>"
    end
  end
end
