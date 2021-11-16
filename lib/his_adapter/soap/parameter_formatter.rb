
module HisAdapter
  module Soap
    class ParameterFormatter
      attr_accessor :params, :wrap_field, :xml_root

      def initialize(params, wrap_field: nil, xml_root: "")
        @wrap_field = wrap_field
        @params = params
        @xml_root = xml_root
      end

      def wrap(content)
        if @wrap_field
          "<#{@wrap_field}><![CDATA[#{content}]]></#{@wrap_field}>"
        else
          "#{content}"
        end
      end

      def format
        wrap(convert_params_to_xml)
      end

      def convert_params_to_xml
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