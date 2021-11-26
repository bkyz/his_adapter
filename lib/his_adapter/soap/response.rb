
module HisAdapter
  module Soap
    class Response
      attr_accessor :raw, :data, :request

      delegate :api, :wsdl, :operation, :message, :adapter, to: :request

      # @param [Soap::Request] soap_request
      # @param [Savon::Response] raw
      def initialize(request, raw)
        @raw = raw
        @request = request

        raw_data = raw.body.dig(response_wrap_field, result_wrap_field)

        data = if raw_data.is_a? String # 针对顺德妇幼返回的 xml 字符串的数据
                 Hash.from_xml(raw_data)
               elsif raw_data[:schema] # 针对 LIS 接口返回的 XSD 格式的数据
                 raw_data[:diffgram][:document_element]
               else # 针对返回普通 xml 格式的数据 ( 广三旧院区 )
                 raw_data
               end&.deep_transform_keys(&:to_s)
        @data = ResponseFieldConverter.new(api, data).convert

        # raw_data 可能返回 string 但不是 xml 格式的（广三旧院区 esb 报错信息），这里捕捉这种情况的异常
        # 如 {:call_esb_response=>{:call_esb_result=>"未知服务", :@xmlns=>"http://ESB.Service/"}}
      rescue REXML::ParseException => e
        @data = ResponseFieldConverter.new(api, {result: { code: "xxxx", msg: raw_data }}.with_indifferent_access).convert
      end

      def raw_data
        raw.data
      end

      def http_code
        raw.http.code
      end

      def code
        data["result"]["code"]
      end

      def message
        data["result"]["msg"]
      end

      def success?
        code == success_code
      end

      def failure?
        !success?
      end

      private

      def response_wrap_field
        :"#{operation}_response"
      end

      def result_wrap_field
        :"#{operation}_result"
      end

      def success_code
        HisAdapter.config[adapter]["success_code"]
      end
    end
  end
end
