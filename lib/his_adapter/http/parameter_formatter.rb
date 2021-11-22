
module HisAdapter
  module Http
    class ParameterFormatter
      attr_accessor :api,
                    :origin_params,
                    :wrap_field,
                    :xml_root,
                    :formatted_params

      def initialize(api, params, xml_root: nil, wrap_field: nil)
        @api = api
        @origin_params = params
        @wrap_field = wrap_field
        @xml_root = xml_root
      end

      def wrap(xml)
        if wrap_field.present?
          @formatted_params = {
            "#{wrap_field}": xml
          }
        else
          origin_params
        end
      end

      def format
        wrap(convert_params_to_xml)
      end

      def convert_params_to_xml
        # 因为有些服务不需要根标签，这时候只要传入值为 "" 的 xml_root 即可。
        # 因为 to_xml 的 root 参数为 "" 会产生一对 <></> 空标签作为根标签，这里将这对空标签去除
        if xml_root == ""
          @origin_params.to_xml(
            root: xml_root,
            skip_instruct: true,
            dasherize: false
          )
                .gsub("<>\n  ", "")
                .gsub("\n</>\n", "")
        else
          @origin_params.to_xml(
            root: xml_root,
            skip_instruct: true,
            dasherize: false
          )
        end
      end
    end
  end
end
