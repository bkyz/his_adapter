
module HisAdapter
  class Client
    attr_accessor :client

    delegate :request, :build_request, to: :client

    def initialize(adapter: :his, **options)
      if ::HisAdapter.use_soap?(adapter: adapter)
        @client = ::HisAdapter::Soap::Client.new(adapter: adapter, **options)
      elsif HisAdapter.use_http?(adapter: adapter)
        @client = ::HisAdapter::Http::Client.new(adapter: adapter, **options)
      end
    end

  end
end
