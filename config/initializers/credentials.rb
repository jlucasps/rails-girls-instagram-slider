require 'yaml'

INSTAGRAM = YAML.load_file(Rails.root.join('config/instagram.yml'))[Rails.env]

REDIRECT_URL = "#{INSTAGRAM['redirect_endpoint']}:#{INSTAGRAM['redirect_port']}/#{INSTAGRAM['redirect_path']}"
