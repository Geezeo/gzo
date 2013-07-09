if File.exist?("#{Dir.home}/.geezeo/credentials.rb")
  require "#{Dir.home}/.geezeo/credentials"
else
  raise "To perform this action you must have a credentials file (see README)"
end