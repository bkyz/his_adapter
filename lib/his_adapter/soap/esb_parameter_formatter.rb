
module HisAdapter
  module Soap
    class EsbParameterFormatter
      attr_accessor :api,
                    :adapter,
                    :origin_params,
                    :xml_root,
                    :wrap_field,
                    :adapter

      def initialize(api, params, adapter:, xml_root: nil, wrap_field: nil)
        @adapter = adapter.to_s
        @origin_params = params.presence || {}
        @api = api.to_s
        @xml_root = xml_root
        @wrap_field = wrap_field
      end

      def format
        xml_params = Soap::ParameterFormatter.new(api,
                                                  origin_params,
                                                  adapter: adapter,
                                                  xml_root: xml_root,
                                                  wrap_field: wrap_field).format

        wrap_esb_text(xml_params)
      end

      def wrap_esb_text(xml_params)
        xml_message = <<~ESB
          <ESBEnvelope xmlns="http://ESB.TopSchemaV2">
              <ESBHeader>
                  <HeaderControl AppCode="#{app_code}" Password="#{password}" MessageCategory="#{message_category}" Version="#{version}" CreateTime="">
                  </HeaderControl>
              </ESBHeader>
              <ESBBody>
                  <BusinessRequest>
                      <![CDATA[#{xml_params}]]>
                  </BusinessRequest>
              </ESBBody>
          </ESBEnvelope>
        ESB

        "<#{wrap_field}>#{CGI.escapeHTML(xml_message)}</#{wrap_field}>"
      end

      def convert_field(params)
        RequestFieldConverter.new(api, params).convert
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
