require 'spec_helper'
require 'yaml'

describe Yml2erd::Parser do
  let(:path) { './sample.yml' }
  let(:yml) { YAML.load_file(path) }
  let(:ss) { Yml2erd::Parser.new.parse(yml) }

  describe '#parser' do
    it 'should not raise any errors' do
      expect { ss }.not_to raise_error
    end

    it 'returns an object of Yml2erd::SchemaStructure' do
      expect(ss.class).to eq(Yml2erd::SchemaStructure)
    end
  end
end
