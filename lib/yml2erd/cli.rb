require "yml2erd/parser"
require "yml2erd/diagram"
require "thor"

module Yml2erd
  class CLI < Thor
    DEFAULT_OUTPUT_PATH = 'output.png'.freeze

    desc "convert <path>", "Convert erd from yml"
    option :output, aliases: :o, banner: 'FILE_PATH', desc: 'default: output.png'
    def convert(path)
      schema_structure = Yml2erd::Parser.parse(path)
      output_path = options[:output] || DEFAULT_OUTPUT_PATH
      Yml2erd::Diagram.create(schema_structure, output_path)
    end
  end
end
