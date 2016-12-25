require 'spec_helper'

describe Yml2erd::SchemaStructure::Validator do
  let(:path_normal) { './sample.yml' }
  let(:path_abnormal) { './sample_abnormal.yml' }
  let(:yml_normal) { YAML.load_file(path_normal) }
  let(:yml_abnormal) { YAML.load_file(path_abnormal) }
  let(:ss_normal) { Yml2erd::SchemaStructure.new(yml_normal) }
  let(:ss_abnormal) { Yml2erd::SchemaStructure.new(yml_abnormal) }
  let(:validator_normal) { Yml2erd::SchemaStructure::Validator.new(ss_normal) }
  let(:validator_abnormal) { Yml2erd::SchemaStructure::Validator.new(ss_abnormal) }
  let(:table_name) { ss_normal.table_names.first }

  describe '#columns' do
    it 'should not raise any errors' do
      expect{ validator_normal.send(:columns) }.not_to raise_error
    end

    it 'should raise any errors' do
      expect{ validator_abnormal.send(:columns) }.to raise_error
    end
  end

  describe '#keyname' do
    it 'should not raise any errors' do
      expect{ validator_normal.send(:keyname) }.not_to raise_error
    end

    it 'should raise any errors' do
      expect{ validator_abnormal.send(:keyname) }.to raise_error
    end
  end

  describe '#correct_relation_key?' do
    it 'should return true if it has correct value' do
      expect(validator_normal.send(:correct_relation_key?, 'users')).to be_truthy
    end
  end
end
