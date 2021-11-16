
module HisAdapter
  module Soap
    class Client
      class ApiNotFoundError < StandardError; end
      attr_accessor :client

      def initialize
        @client = Savon.client(wsdl: wsdl)
      end

      def wsdl
        config["wsdl"]
      end

      def request(api, params = nil, wrap_field: nil, xml_root: "Request", **options)
        operation = operation(api)

        message = if params
                    Parameter.new(api, params, wrap_field: wrap_field, xml_root: xml_root).converted
                  else
                    ""
                  end

        default_options = {
          attributes: {
            "xmlns" => "http://tempuri.org/"
          }
        }

        raw_response = client.call(operation, message: message, **default_options.merge(options))

        request = Soap::Request.new(api: api,
                                    operation: operation,
                                    message: message,
                                    wsdl: config["wsdl"])


        Soap::Response.new(request, raw_response)
      end

      def config
        @config ||= ::HisAdapter.config
      end

      def operation(api)
        config["api"].fetch(api.to_s) do
          raise ApiNotFoundError, "#{api} config not found, please check if config defined in config/his_adapter.yml "
        end
      end
    end
  end
end