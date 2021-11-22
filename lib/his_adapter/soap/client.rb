
module HisAdapter
  module Soap
    class Client
      class ApiNotFoundError < StandardError; end
      attr_accessor :client, :adapter

      def initialize(adapter: )
        @adapter = adapter.to_s
        @client = Savon.client(wsdl: wsdl)
      end

      def wsdl
        config["wsdl"]
      end

      def request(api, params = nil, wrap_field: nil, xml_root: "Request", **options)
        operation = operation(api)

        message = format_params(api,
                                params,
                                adapter: adapter,
                                wrap_field: wrap_field,
                                xml_root: xml_root)

        default_options = {
          attributes: {
            "xmlns" => "http://tempuri.org/"
          }
        }

        # binding.pry
        req = client.build_request(operation, message: message, **default_options.merge(options))
        raw_response = client.call(operation, message: message, **default_options.merge(options))
        # binding.pry


        request = Soap::Request.new(api: api,
                                    operation: operation,
                                    message: message,
                                    wsdl: wsdl)

        Soap::Response.new(request, raw_response)
      end

      # 将参数转为 soap 协议的 message 参数，类型为字符串
      def format_params(api, params, adapter: , wrap_field: , xml_root: )
        return "" if params.blank?


        if config["protocol"] == 'esb'
          ::HisAdapter::Soap::EsbParameter.new(api,
                                               params,
                                               adapter: adapter,
                                               wrap_field: wrap_field,
                                               xml_root: xml_root).convert!
        else
          ::HisAdapter::Soap::Parameter.new(api,
                                            params,
                                            wrap_field: wrap_field,
                                            xml_root: xml_root).convert!
        end
      end

      def config
        @config ||= ::HisAdapter.config[adapter]
      end

      def operation(api)
        HisAdapter.config["api"].fetch(api.to_s) do
          raise ApiNotFoundError, "#{api} config not found, please check if config defined in config/his_adapter.yml "
        end
      end
    end
  end
end
