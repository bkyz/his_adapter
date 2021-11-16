
module HisAdapter
  module Soap
    class Request
      attr_accessor  :api, :operation, :message

      def initialize(api: , operation:, message: ,wsdl: )
        @api = api
        @operation = operation
        @message = message
        @wsdl = wsdl
      end
    end
  end
end