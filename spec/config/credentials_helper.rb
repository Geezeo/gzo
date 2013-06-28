module CredentialsHelper
  def self.credentials
    credentials_file = "#{File.dirname(__FILE__)}/geezeo_credentials.json"
    unless File.exist? credentials_file
      raise "You need credentials in config/geezeo_credentials.json"
    end
    @credentials ||= json_load credentials_file
  end
  def credentials; CredentialsHelper.credentials; end

  def self.json_load(file)
    json = File.read file
    JSON.load json
  end
end
