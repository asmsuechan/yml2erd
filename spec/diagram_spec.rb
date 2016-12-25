require 'spec_helper'
require 'yaml'

describe Yml2erd::Diagram do
  describe '#create' do
    let(:path) { './sample.yml' }
    let(:yml) { YAML.load_file(path) }
    let(:ss) { Yml2erd::SchemaStructure.new(yml) }

    let(:opts_default) { {} }
    let(:opts_project_name) { { project_name: 'Project Name' } }
    let(:opts_svg) { { output_style: 'svg' } }
    let(:opts_png) { { output_style: 'png' } }
    let(:opts_output_path) { { output_path: './output.png' } }

    let(:diagram_default) { Yml2erd::Diagram.create(ss, opts_default) }
    let(:diagram_project_name) { Yml2erd::Diagram.create(ss, opts_project_name) }
    let(:diagram_svg) { Yml2erd::Diagram.create(ss, opts_svg) }
    let(:diagram_png) { Yml2erd::Diagram.create(ss, opts_png) }
    let(:diagram_output_path) { Yml2erd::Diagram.create(ss, opts_output_path) }

    it 'should create erd' do
      aggregate_failures do
        expect{ diagram_default }.not_to raise_error
        expect{ diagram_project_name }.not_to raise_error
        expect{ diagram_svg }.not_to raise_error
        expect{ diagram_png }.not_to raise_error
        expect{ diagram_output_path }.not_to raise_error
      end
    end
  end
end
