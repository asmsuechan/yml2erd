module Yml2erd
  class SchemaStructure

    attr_accessor :structure_yml, :table_names

    def initialize(yml)
      @structure_yml = yml
      @table_names = table_names
    end

    # returns an array which has table_names like bellow
    # => ["users", "user_auths", "posts", "companies"]
    def table_names
      structure_yml.to_a.map { |s| s.first }.select{ |tn| tn != 'shared_columns' }
    end

    # returns a hash like below
    # { users: { belongs_to: ['user_auths', 'companies'], has_many: ['posts'] } }
    def relation(table_name)
      relations = structure_yml[table_name]['relations']
      # { table_name.to_sym => relations }
    end

    def relations
      table_names.map { |table_name| relation(table_name) }
    end

    # returns a hash like below
    # => {"columns"=>[{"name"=>"string"}, {"email"=>"string"}], "relations"=>{"belongs_to"=>["user_auths", "companies"], "has_many"=>["posts"]}}
    def table(table_name)
      structure_yml[table_name]
    end

    # returns an array like below
    # => [{"name"=>"string"}, {"email"=>"string"}]
    def columns(table_name)
      structure_yml[table_name]['columns']
    end

    # returns an array like below
    # => ["email"]
    def index(table_name)
      structure_yml[table_name]['index']
    end

    # returns a hash like below
    # => { "id"=>"integer", "created_at"=>"datetime", "updated_at"=>"datetime" }
    def shared_columns
      structure_yml['shared_columns']
    end
  end
end
