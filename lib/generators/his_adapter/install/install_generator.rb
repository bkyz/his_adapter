class HisAdapter::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def install_config_file
    copy_file "his_adapter.yml", "config/his_adapter.yml"
  end
end
