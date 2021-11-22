
module HisAdapter
  class RequestFieldConverter
    class ApiDictConfigNotFoundError < StandardError; end

    attr_accessor :api, :params

    def initialize(api, params)
      @api = api.to_s
      @params = params
    end

    def dict
      @dict ||= begin
                  common_dict = ::HisAdapter.config["dict"]["common"]["request"] || {}
                  dict = ::HisAdapter.config["dict"].dig(api, "request") || {}

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
      return @params if @params.blank? || dict.blank?

      params = @params.deep_transform_keys(&:to_s)

      convert_field(dict, params)

      params
    end
  end
end