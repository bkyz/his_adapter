
module HisAdapter
  class ResponseFieldConverter
    class ApiDictConfigNotFoundError < StandardError; end
    class ApiResponseDictConfigNotFoundError < StandardError; end

    attr_accessor :api, :data

    def initialize(api, data)
      @api = api.to_s
      @data = data
    end

    def dict
      @dict ||= begin
                  common_dict = ::HisAdapter.config["dict"]["common"]["response"] || {}
                  custom_dict = ::HisAdapter.config["dict"].fetch(api) do
                    raise ApiDictConfigNotFoundError, api
                  end.fetch("response") do
                    raise ApiResponseDictConfigNotFoundError, api
                  end

                  binding.pry
                  common_dict.merge(custom_dict)
                end
    end

    def convert_field(dict, value)
      case value
      when Array
        value.each {|item| convert_field(dict, item) }
      when Hash
        value.deep_transform_keys! { |k| convert_field(dict, k) }
      when String
        # dict.key(value) || value
        dict[value] || value
      else
        value
      end
    end

    def convert
      p "---------"
      p @dict
      p "---------"
      data = @data.deep_transform_keys(&:to_s)

      convert_field(dict, data)

      data
    end
  end
end
