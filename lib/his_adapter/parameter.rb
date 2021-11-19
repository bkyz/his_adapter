
module HisAdapter
  class Parameter
    attr_accessor :wrap_field, :xml_root, :origin, :converted, :api

    def initialize(api, params, wrap_field: nil)
      @wrap_field = wrap_field
      @api = api.to_s
      @origin = params
    end

    def convert!
      convert_field!
      format!

      yield @converted if block_given?

      @converted
    end

    private

    def convert_field!
      @converted = RequestFieldConverter.new(@api, @origin).convert
    end
  end
end
