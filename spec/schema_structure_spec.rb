require 'spec_helper'
require 'yaml'

describe Yml2erd::SchemaStructure do
  let(:path) { './sample.yml' }
  let(:yml) { YAML.load_file(path) }
  let(:ss) { Yml2erd::SchemaStructure.new(yml) }
  let(:table_name) { ss.table_names.first }

  describe '#initialize' do
    it 'should not raise any errors' do
      expect{ ss }.not_to raise_error
    end
  end

  describe '#table_names' do
    it 'should return an array' do
      expect(ss.table_names.class).to eq(Array)
    end
  end

  describe '#relation' do
    it 'should return a hash correctly' do
      aggregate_failures do
        expect(ss.relation(table_name).class).to eq(Hash)
        expect(ss.relation(table_name).keys.first).to eq(table_name.to_sym)
      end
    end
  end

  describe '#table' do
    it 'should return a hash' do
      expect(ss.table(table_name).class).to eq (Hash)
    end
  end

  describe '#columns' do
    it 'should return an array' do
      expect(ss.columns(table_name).class).to eq(Array)
    end
  end
end
