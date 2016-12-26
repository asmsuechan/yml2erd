require "yml2erd/parser"
require "yml2erd/diagram"
require "thor"
require "yaml"

module Yml2erd
  class CLI < Thor
    class YmlNotFoundError < StandardError;end

    desc "convert <path>", "Convert erd from yml"
    option :output, aliases: :o, banner: 'FILE_PATH', desc: 'default: output.png'
    option :projectname, aliases: :p, banner: 'PROJECT_NAME', desc: 'default: null'
    option :outputstyle, aliases: :s, banner: 'OUTPUT_STYLE', desc: 'svg or png, default: png'
    def convert(path)
      schema_structure = load_yml(path)
      opts = {
        output_path: options[:output_path],
        project_name: options[:projectname],
        output_style: options[:outputstyle]
      }
      Yml2erd::Diagram.create(schema_structure, opts)
      puts 'Successfully converted!'
    end

    private

    def load_yml(path)
      abort "#{path} is not found, please check your .yml file path" unless File.exists?(path)
      yml = YAML.load_file(path)
      Yml2erd::Parser.parse(yml)
    end
  end
end
