require "yml2erd/parser"
require "yml2erd/diagram"
require "thor"

module Yml2erd
  class CLI < Thor
    DEFAULT_OUTPUT_PATH = 'output.png'.freeze

    desc "convert <path>", "Convert erd from yml"
    option :output, aliases: :o, banner: 'FILE_PATH', desc: 'default: output.png'
    option :projectname, aliases: :p, banner: 'PROJECT_NAME'
    option :outputstyle, aliases: :s, banner: 'OUTPUT_STYLE', desc: 'svg or png, default: png'
    def convert(path)
      schema_structure = Yml2erd::Parser.parse(path)
      opts = {
        output_path: options[:output] || DEFAULT_OUTPUT_PATH,
        project_name: options[:projectname],
        output_style: options[:outputstyle]
      }
      Yml2erd::Diagram.create(schema_structure, opts)
      puts 'Successfully converted!'
    end
  end
end
