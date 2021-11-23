
module HisAdapter
  module Soap
    class EsbParameter < HisAdapter::Soap::Parameter
      attr_accessor :adapter

      def initialize(api, params, adapter: , wrap_field: nil, xml_root: nil)
        super(api, params, wrap_field: wrap_field, xml_root: xml_root)
        @adapter = adapter.to_s
      end

      protected

      def format!
        @converted = Soap::ParameterFormatter.new(@converted, xml_root: xml_root, wrap_field: wrap_field).format

        @converted = wrap_esb_text!
      end

      def wrap_esb_text!
        xml_message = <<~ESB
          <ESBEnvelope xmlns="http://ESB.TopSchemaV2">
              <ESBHeader>
                  <HeaderControl AppCode="#{app_code}" Password="#{password}" MessageCategory="#{message_category}" Version="#{version}" CreateTime="">
                  </HeaderControl>
              </ESBHeader>
              <ESBBody>
                  <BusinessRequest>
                      <![CDATA[#{converted}]]>
                  </BusinessRequest>
              </ESBBody>
          </ESBEnvelope>
        ESB

        "<#{wrap_field}>#{CGI.escapeHTML(xml_message)}</#{wrap_field}>"
      end

      def app_code
        adapter_config["app_code"]
      end

      def password
        adapter_config["password"]
      end

      def message_category
        adapter_config["message_category"][api]
      end

      def version
        adapter_config["version"]
      end

      def adapter_config
        @wsb_config ||= HisAdapter.config[adapter]
      end
    end
  end
end
