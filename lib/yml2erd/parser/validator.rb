module Yml2erd
  class Parser
    class Validator
      class InvalidKeyNameError < StandardError;end
      class InvalidYmlStructureError < StandardError;end

      attr_reader :yml

      def initialize(yml)
        @yml = yml
      end

      def validate
      end

      private

      def relations
        rails InvalidYmlStructureError
      end

      # check to match or not a table name among relations
      def table_name
      end

      def columns
      end

      def keyname
        raise InvalidKeyNameError
      end
    end
  end
end
