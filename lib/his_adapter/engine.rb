require "his_adapter/parameter"
require "his_adapter/soap/parameter"
require "his_adapter/soap/esb_parameter"
require "his_adapter/request_field_converter"
require "his_adapter/soap/parameter_formatter"
require "his_adapter/soap/request"
require "his_adapter/client"
require "his_adapter/http/client"
require "his_adapter/http/parameter"
require "his_adapter/http/parameter_formatter"
require "his_adapter/soap/client"
require "his_adapter/response_field_converter"
require "his_adapter/soap/response"
require "savon"
require "faraday"
require 'factory_bot_rails'

module HisAdapter
  class Engine < ::Rails::Engine
    isolate_namespace HisAdapter

    config.autoload_paths << File.expand_path("./lib")

    FactoryBot.definition_file_paths <<  File.expand_path('./spec/factories')

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
