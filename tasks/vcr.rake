require "geezeo"

namespace :vcr do
	desc "Anonymize VCR cassettes"
	task :anonymize do
		if File.exist?("#{ENV["HOME"]}/.geezeo/credentials.rb")
			require "#{ENV["HOME"]}/.geezeo/credentials.rb"
		else
			raise "To anonymize you must have a credentials file (see README)"
		end

		api_key = Geezeo.configuration.api_key
		user_id = Geezeo.configuration.user_id

		cassette_files = Dir.glob("spec/cassettes/**/**.yml")
		cassette_files.each do |filename|

			tmp = Tempfile.new("tempfile.tmp")
			File.open(filename, "r") do |f|
				f.each_line do |line|
					tmp.puts line.gsub(api_key, "abc123").gsub(user_id, "testy")

				end
			end
			FileUtils.mv(tmp.path, filename)
		end
	end
end
