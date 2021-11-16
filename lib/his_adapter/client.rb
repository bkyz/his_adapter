
module HisAdapter
  class Client
    attr_accessor :client

    delegate :request, to: :client

    def initialize
      if ::HisAdapter.use_soap?
        @client = ::HisAdapter::Soap::Client.new
      elsif HisAdapter.use_http?
        @client = ::HisAdapter::Soap::Client
      end
    end

  end
end