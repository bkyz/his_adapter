
module HisAdapter
  module Soap
    class Request
      class ApiNotFoundError < StandardError; end

      attr_accessor :api, :parameter, :adapter, :options, :client


      alias payload parameter

      def initialize(api, parameter, client:, adapter:, **options)
        @api = api
        @parameter = parameter
        @adapter = adapter
        @client = client
        @options = options
      end

      def call
        client.call(operation,
                    message: message,
                    **default_request_options.merge(options))
      end


      def build
        client.build_request(operation,
                             message: message,
                             **default_request_options.merge(options))
      end

      def message
        parameter.format
      end

      def default_request_options
        {
          attributes: {
            # 默认 soap 协议命名空间，一般来说除开开发模式以外，应该提供指定的命名空间
            # 但是有些 HIS 厂商没有指定，所以这里将这个默认命名空间设置为默认值
            "xmlns" => "http://tempuri.org/"
          }
        }
      end

      def config
        @config ||= ::HisAdapter.config[adapter]
      end

      def operation
        HisAdapter.config["api"].fetch(api.to_s) do
          raise ApiNotFoundError, "#{api} config not found, please check if config defined in config/his_adapter.yml "
        end
      end

    end
  end
end
