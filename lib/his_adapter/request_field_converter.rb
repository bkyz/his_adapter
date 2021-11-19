
module HisAdapter
  class RequestFieldConverter
    class ApiDictConfigNotFoundError < StandardError; end
    class ApiRequestDictConfigNotFoundError < StandardError; end

    attr_accessor :api, :params

    def initialize(api, params)
      @api = api.to_s
      @params = params
    end

    def dict
      @dict ||= begin
                  common_dict = ::HisAdapter.config["dict"]["common"]["request"] || {}
                  dict = ::HisAdapter.config["dict"].fetch(api) do
                    raise(ApiDictConfigNotFoundError, api)
                  end.fetch("request") do
                    raise(ApiRequestDictConfigNotFoundError, api)
                  end || {}

                  common_dict.merge(dict)
                end
    end

    def convert_field(dict, value)
      case value
      when Array
        value.each {|item| convert_field(dict, item)}
      when Hash
        value.deep_transform_keys!{ |k| convert_field(dict, k) }
      when String
        dict[value] || value
      else
        value
      end
    end

    def convert
      params = @params.deep_transform_keys(&:to_s)

      convert_field(dict, params)

      params
    end
  end
end