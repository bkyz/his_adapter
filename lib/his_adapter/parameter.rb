
module HisAdapter
  class Parameter
    attr_accessor :wrap_field, :xml_root, :origin, :converted, :api

    def initialize(api, params, wrap_field: nil, xml_root: "")
      @wrap_field = wrap_field
      @xml_root = xml_root
      @api = api
      @origin = params

      @converted = convert!
    end

    def convert!
      convert_field!
      format!
    end

    def convert_field!
      @converted = RequestFieldConverter.new(@api, @origin).convert
    end

    def format!
      if ::HisAdapter.use_soap?
        format_as_xml!
      elsif ::HisAdapter.use_http?
        format_as_json!
      end
    end

    def format_as_xml!
      @converted = Soap::ParameterFormatter.new(@converted, xml_root: xml_root, wrap_field: wrap_field).format
    end

    def format_as_json!

    end
  end
end