
module HisAdapter
  module Http
    class Parameter < ::HisAdapter::Parameter

      def format!
        @converted = ::HisAdapter::Http::ParameterFormatter.new(api, origin, wrap_field: wrap_field).format
      end
    end
  end
end
