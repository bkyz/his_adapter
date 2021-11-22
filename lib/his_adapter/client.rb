
module HisAdapter
  class Client
    attr_accessor :client

    delegate :request, to: :client

    def initialize(adapter: :his)
      if ::HisAdapter.use_soap?(adapter: adapter)
        @client = ::HisAdapter::Soap::Client.new(adapter: adapter)
      elsif HisAdapter.use_http?(adapter: adapter)
        @client = ::HisAdapter::Http::Client.new(adapter: adapter)
      end
    end

  end
end
