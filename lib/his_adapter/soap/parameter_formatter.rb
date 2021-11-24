
module HisAdapter
  module Soap
    class ParameterFormatter
      attr_accessor :api,
                    :origin_params,
                    :wrap_field,
                    :xml_root,
                    :converted

      def initialize(api, params, adapter:, wrap_field: nil, xml_root: "")
        @adapter = adapter
        @api = api
        @xml_root = xml_root
        @wrap_field = wrap_field
        @origin_params = params
      end

      def wrap(content)
        if @wrap_field
          "<#{@wrap_field}><![CDATA[#{content}]]></#{@wrap_field}>"
        else
          "#{content}"
        end
      end

      def format
        return "" if origin_params.blank?

        params = convert_field(origin_params)
        xml = params_to_xml(params)
        wrap(xml)
      end

      def convert_field(params)
        RequestFieldConverter.new(api, params).convert
      end

      def params_to_xml(params)
        return params if params.nil?

        # 因为有些服务不需要根标签，这时候只要传入值为 "" 的 xml_root 即可。
        # 因为 to_xml 的 root 参数为 "" 会产生一对 <></> 空标签作为根标签，这里将这对空标签去除
        if xml_root == ""
          params.to_xml(
            root: @xml_root,
            skip_instruct: true,
            dasherize: false
          )
                .gsub("<>\n  ", "")
                .gsub("\n</>\n", "")
        else
          params.to_xml(
            root: @xml_root,
            skip_instruct: true,
            dasherize: false
          )
        end
      end
    end
  end
end
