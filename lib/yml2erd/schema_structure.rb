module Yml2erd
  class SchemaStructure
    SHARED_COLUMNS = 'shared_columns'.freeze
    RELATIONS = 'relations'.freeze
    BELONGS_TO = 'belongs_to'.freeze
    COLUMNS = 'columns'.freeze
    INDEX = 'index'.freeze
    COMMENT = 'comment'.freeze

    attr_accessor :structure_yml, :table_names

    def initialize(yml)
      @structure_yml = yml
      @table_names = table_names
    end

    # returns an array which has table_names like bellow
    # => ["users", "user_auths", "posts", "companies"]
    def table_names
      structure_yml.to_a.map { |s| s.first }.select{ |tn| tn != SHARED_COLUMNS }
    end

    # returns a hash like below
    # { belongs_to: ['user_auths', 'companies'], has_many: ['posts'] }
    def relation(table_name)
      structure_yml[table_name][RELATIONS]
    end

    # returns an array like below
    # ['user_auths', 'companies']
    def belongs(table_name)
      relation(table_name)[BELONGS_TO]
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
      structure_yml[table_name][COLUMNS]
    end

    # returns an array like below
    # => ["email"]
    def index(table_name)
      structure_yml[table_name][INDEX]
    end

    # returns a hash like below
    # => { "id"=>"integer", "created_at"=>"datetime", "updated_at"=>"datetime" }
    def shared_columns
      structure_yml[SHARED_COLUMNS]
    end

    # returns a string like below
    # => "This is users table"
    def comment(table_name)
      structure_yml[table_name][COMMENT]
    end
  end
end
