
module HisAdapter
  module Http
    class Client
      class AdapterConfigNotFoundError < StandardError; end

      attr_accessor :adapter

      def initialize(adapter: )
        @adapter = adapter.to_s
      end

      # base_params 是为了放最外层的参数而存在的
      def request(api, params, xml_root: nil, wrap_field: nil, base_params: {}, **options)
        url = url(api.to_s)

        formatted_parameter = format_params(api,
                                            params,
                                            xml_root: xml_root,
                                            wrap_field: wrap_field)

        response = Faraday.post(url, base_params.merge(formatted_parameter), **options)

        p 1

      end

      private

      def config
        @config ||= ::HisAdapter.config.fetch(adapter) do
          raise AdapterConfigNotFoundError, adapter
        end
      end

      def format_params(api, params, xml_root:, wrap_field:)
        ::HisAdapter::Http::Parameter.new(api,
                                          params,
                                          xml_root: xml_root,
                                          wrap_field: wrap_field).convert!
      end

      def url(api)
        "#{base_url}/#{path(api)}"
      end

      def base_url
        config.fetch("base_url")
      end

      def path(api)
        ::HisAdapter.config["api"][api]
      end

      def headers
        {
          "Content-Type": content_type
        }
      end

      def content_type
        "application/x-www-form-urlencoded"
      end
    end
  end
end
