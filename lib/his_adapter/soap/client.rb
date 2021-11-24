
module HisAdapter
  module Soap
    class Client
      class ApiNotFoundError < StandardError; end
      attr_accessor :client, :adapter

      def initialize(adapter:)
        @adapter = adapter.to_s
        @client = Savon.client(wsdl: wsdl)
      end

      def request(api, params = nil, **options)
        parameter = ::HisAdapter::Parameter.new(api,
                                                params,
                                                adapter: adapter)

        request = ::HisAdapter::Soap::Request.new(api,
                                                  parameter,
                                                  adapter: adapter,
                                                  client: client,
                                                  **options)

        raw_response = request.call

        # req = client.build_request(operation,
        #                            message: message,
        #                            **default_request_options.merge(options))

        # raw_response = client.call(operation,
        #                            message: message,
        #                            **default_request_options.merge(options))

        Soap::Response.new(request, raw_response)
      end

      # 构建请求，但实际上没有调用
      def build_request(api, params, **options)
        operation = operation(api)
        message = format(api, params)

        client.build_request(operation,
                             message: message,
                             **default_request_options.merge(options))
      end

      def config
        @config ||= ::HisAdapter.config[adapter]
      end

      def wsdl
        config["wsdl"]
      end

    end
  end
end
