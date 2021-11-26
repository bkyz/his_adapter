
module HisAdapter
  class Parameter
    attr_accessor :api,
                  :adapter,
                  :origin,
                  :formatter

    def initialize(api, params, adapter:)
      @api = api.to_s
      @adapter = adapter.to_s
      @origin = params

      # 这里 esb 协议的请求参数格式有些不同，会额外包裹固定结构的参数，所以使用单独的参数类
      formatter_class = if esb_protocol?
                          ::HisAdapter::Soap::EsbParameterFormatter
                        else
                          ::HisAdapter::Soap::ParameterFormatter
                        end

      @formatter = formatter_class.new(api,
                                       params.reject{|_, v| v.nil?},
                                       adapter: adapter,
                                       xml_root: xml_root,
                                       wrap_field: wrap_field)

    end

    def format
      formatter.format
    end

    private

    def esb_protocol?
      adapter_config["protocol"] == "esb"
    end

    def adapter_config
      ::HisAdapter.config[adapter]
    end

    def xml_root
      adapter_config["xml_root"]
    end

    def wrap_field
      adapter_config["wrap_field"]
    end
  end
end
