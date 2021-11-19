
module HisAdapter
  module Soap
    class Parameter < HisAdapter::Parameter
      attr_accessor :wrap_field, :xml_root, :origin, :converted, :api

      def initialize(api, params, wrap_field: nil, xml_root: "")
        super(api, params, wrap_field: wrap_field)
        @xml_root = xml_root
      end

      protected

      def format!
        @converted = Soap::ParameterFormatter.new(@converted, xml_root: xml_root, wrap_field: wrap_field).format
      end
    end
  end
end
