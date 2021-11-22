
module HisAdapter
  module Http
    class Parameter < ::HisAdapter::Parameter
      attr_accessor :xml_root

      def initialize(api, params, wrap_field: nil, xml_root: nil, options: {})
        super(api, params, wrap_field: wrap_field)
        @xml_root = xml_root
      end

      def format!
        @converted = ::HisAdapter::Http::ParameterFormatter.new(api,
                                                                origin,
                                                                xml_root: xml_root,
                                                                wrap_field: wrap_field).format
      end
    end
  end
end
