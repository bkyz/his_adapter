
module HisAdapter
  module Http
    class ParameterFormatter
      attr_accessor :api,
                    :origin_params,
                    :wrap_field,
                    :formatted_params

      def initialize(api, params, wrap_field: nil)
        @api = api
        @origin_params = params
        @wrap_field = wrap_field
      end

      def format
        if wrap_field.present?
          @formatted_params = {
            "#{wrap_field}": origin_params
          }
        else
          origin_params
        end
      end
    end
  end
end
