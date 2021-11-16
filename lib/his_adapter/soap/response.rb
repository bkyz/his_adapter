
module HisAdapter
  module Soap
    class Response
      attr_accessor :raw, :data, :request

      delegate :api, :wsdl, :operation, :message, to: :request

      # @param [Soap::Request] soap_request
      # @param [Savon::Response] raw
      def initialize(request, raw)
        @raw = raw
        @request = request

        # data = Hash.from_xml(raw.body.dig(response_wrap_field, result_wrap_field))["Response"]
        raw_data = raw.body.dig(response_wrap_field, result_wrap_field)

        binding.pry
        data = if raw_data.is_a? String
                 Hash.from_xml(raw_data)
               else
                 raw_data
               end

        @data = ResponseFieldConverter.new(api, data).convert
      end

      def raw_data
        raw.data
      end

      private

      def response_wrap_field
        :"#{operation}_response"
      end

      def result_wrap_field
        :"#{operation}_result"
      end

    end
  end
end