module Yml2erd
  class SchemaStructure
    class Validator
      class InvalidKeyNameError < StandardError;end
      class InvalidYmlStructureError < StandardError;end

      attr_reader :ss

      def initialize(schema_structure)
        @ss = schema_structure
      end

      def validate
        # relations
        # table_name
        columns
        keyname
      end

      private

      # check to match or not a table name among relations
      def relations
        raise InvalidYmlStructureError
      end

      def table_name
        raise InvalidKeyNameError
      end

      # columns must be an array
      def columns
        ss.table_names.each do |table_name|
          raise InvalidYmlStructureError, 'columns must be an array' unless ss.columns(table_name).class == 'Array'
        end
      end

      # yml structure is just like below
      # ```
      # <table_name>:
      #   columns:
      #     - <column_name>: <column_type>
      #   relations:
      #     belongs_to:
      #       - <table_name>
      #     has_many:
      #       - <table_name>
      # ```
      # belongs_to or has_many is not necessary
      def keyname
        ss.table_names.each do |table_name|
          if ss.columns(table_name).nil? || ss.table(table_name)['relations'].nil?
            raise InvalidKeyNameError, 'you must use correct keyname'
          end
        end
      end
    end
  end
end
