
require "his_adapter/version"
require "his_adapter/engine"

module HisAdapter
  def self.config
    @config ||= begin
                  config = YAML.load_file(config_path)
                  config[Rails.env] || config["default"]
                end
  end

  def self.config_path
    @config_path = Rails.root.join("config/his_adapter.yml")
  end

  def self.use_soap?
    config["adapter"] == "soap"
  end

  def self.use_http?
    config["adapter"] == "http"
  end
end
