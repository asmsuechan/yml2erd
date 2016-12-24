module Yml2erd
  class SchemaStructure
    class InvalidKeyNameError < StandardError;end

    attr_accessor :structure_yml, :table_names

    def initializer(parsed_schema)
      @structure_yml = yml
      @table_names = table_names
    end

    # returns an array which has table_names like bellow
    # => ["users", "user_auths", "posts", "companies"]
    def table_names
      structure_yml.to_a.map { |s| s.first }
    end

    # returns an hash like below
    # { users: { belongs_to: ['user_auths', 'companies'], has_many: ['posts'] } }
    def relation(table_name)
      relations = structure_yml[table_name]['relations']
      { table_name.to_sym => relations }
    end

    def relations
      table_names.map { |table_name| table_name.relation }
    end

    # private

    # def check_keyname(yml)
    #   # implement to detect incorrect key name
    #   raise InvalidKeyNameError
    # end
  end
end
