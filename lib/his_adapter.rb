
require "his_adapter/version"
require "his_adapter/engine"

module HisAdapter

  mattr_accessor :before_params_convert_handlers
  mattr_accessor :after_params_convert_handlers
  mattr_accessor :after_params_format_handlers

  def self.config
    @config ||= begin
                  config = YAML.load_file(config_path)
                  config[Rails.env] || config["default"]
                end
  end

  # def self.before_params_convert_handlers
  #   @before_params_convert_handlers ||= {}
  # end
  #
  # def self.after_params_convert_handlers
  #   @after_params_convert_handlers ||= {}
  # end
  #
  # def self.after_params_format_handlers
  #   @after_params_format_handlers ||= {}
  # end
  #

  def self.config_path
    @config_path = Rails.root.join("config/his_adapter.yml")
  end

  def self.use_soap?(adapter: )
    config[adapter.to_s]["protocol"].in? soap_protocol
  end

  def self.use_http?(adapter: )
    config[adapter.to_s]["protocol"] == "http"
  end

  def self.soap_protocol
    [ "his", "lis", "esb", "pacs" ]
  end

  def self.before_params_convert

  end

  def self.after_params_convert

  end

  def self.after_params_format

  end
end
