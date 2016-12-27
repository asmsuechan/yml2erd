require "yml2erd/parser"
require "yml2erd/diagram"
require "thor"
require "yaml"

module Yml2erd
  class CLI < Thor
    desc "convert <path>", "Convert erd from yml"
    option :output, aliases: :o, banner: 'FILE_PATH', desc: 'default: output.png'
    option :projectname, aliases: :p, banner: 'PROJECT_NAME', desc: 'default: null'
    option :outputstyle, aliases: :s, banner: 'OUTPUT_STYLE', desc: 'svg or png, default: png'
    def convert(path)
      abort_if_graphviz_isnt_installed
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

    # This method has a bug around `which gvpr`.
    # That is because which command may not exist except UNIX based OS.
    def abort_if_graphviz_isnt_installed
      abort "GraphViz is not installed, please install graphviz from http://www.graphviz.org/Download..php \n\nOr you can get by\n   $ brew install graphviz    # on macOS\n   $ apt-get install graphviz # on Ubuntu" unless !`which gvpr`.empty?
    end
  end
end
