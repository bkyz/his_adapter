
module HisAdapter
  module Http
    class Client
      class AdapterConfigNotFoundError < StandardError; end

      attr_accessor :adapter

      def initialize(adapter: )
        @adapter = adapter.to_s
      end

      def request(api, params, wrap_field: nil, **options)
        url = url(api.to_s)

        formatted_parameter = format_params(api, params, wrap_field: wrap_field)

        response = Faraday.post(url, formatted_parameter, **options)

        p 1

      end

      private

      def config
        @config ||= ::HisAdapter.config.fetch(adapter) do
          raise AdapterConfigNotFoundError, adapter
        end
      end

      def format_params(api, params, wrap_field: )
        ::HisAdapter::Http::Parameter.new(api, params, wrap_field: wrap_field).convert!
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
