require "yml2erd/parser"
require "yml2erd/diagram"
require "thor"

module Yml2erd
  class CLI < Thor
    desc "convert yml", "generate erd"
    def convert(path)
      schema_structure = Yml2erd::Parser.parse(path)
      Diagram.create(schema_structure)
    end
  end
end
